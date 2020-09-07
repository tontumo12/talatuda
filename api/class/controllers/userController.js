'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../../db')
const jwtHelper = require("../helpers/jwt.helper");
let tokenList = {};
// Thời gian sống của token
const accessTokenLife = process.env.ACCESS_TOKEN_LIFE || "7d";
// Mã secretKey này phải được bảo mật tuyệt đối, các bạn có thể lưu vào biến môi trường hoặc file
const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET || "tunt20158412";
// Thời gian sống của refreshToken
const refreshTokenLife = process.env.REFRESH_TOKEN_LIFE || "3650d";
// Mã secretKey này phải được bảo mật tuyệt đối, các bạn có thể lưu vào biến môi trường hoặc file
const refreshTokenSecret = process.env.REFRESH_TOKEN_SECRET || "tunt120597";

module.exports = {
    login: async (req, res) => {
        let sql = 'SELECT * FROM user INNER JOIN user_info on user.id = user_info.id_user WHERE user.userName = ? AND user.pass= ?'
        db.query(sql, [req.body.username, req.body.password], async (err, response) => {
            if (err) throw err
            const user = {
                id: response[0].id,
                userName: response[0].userName,
                level: response[0].level,
                firstName: response[0].firstName,
                lastName: response[0].lastName,
                phone: response[0].phone,
                email: response[0].email,
                location: response[0].location,
                city: response[0].city
            }
            const accessToken = await jwtHelper.generateToken(user, accessTokenSecret, accessTokenLife);
            const refreshToken = await jwtHelper.generateToken(user, refreshTokenSecret, refreshTokenLife);
            tokenList[refreshToken] = {
                accessToken,
                refreshToken
            };
            res.json({
                status: 'SUCCESS',
                message: 'Login thành công',
                response: {
                    accessToken: accessToken,
                    refreshToken: refreshToken
                }
            })
        })
    },
    loginAdmin: async (req, res) => {
        let sql = 'SELECT * FROM user INNER JOIN user_info on user.id = user_info.id_user WHERE user.userName = ? AND user.pass= ?'
        db.query(sql, [req.body.username, req.body.password], async (err, response) => {
            if (err) throw err
            const user = {
                id: response[0].id,
                userName: response[0].userName,
                level: response[0].level,
                fistName: response[0].fistName,
                lastName: response[0].lastName,
                phone: response[0].phone,
                email: response[0].email,
                location: response[0].location,
                city: response[0].city
            }
            if (user.level == 0 || user.level == 1) {
                const accessToken = await jwtHelper.generateToken(user, accessTokenSecret, accessTokenLife);
                const refreshToken = await jwtHelper.generateToken(user, refreshTokenSecret, refreshTokenLife);
                tokenList[refreshToken] = {
                    accessToken,
                    refreshToken
                };
                res.json({
                    status: 'SUCCESS',
                    message: 'Login host thành công',
                    response: {
                        accessToken: accessToken,
                        refreshToken: refreshToken
                    }
                })
            } else {
                res.json({
                    status: 'FAIL',
                    message: 'Bạn không phái host'
                })
            }

        })
    },
    refreshToken: async (req, res) => {
        const refreshTokenFromClient = req.body.refreshToken;
        if (refreshTokenFromClient && (tokenList[refreshTokenFromClient])) {
            try {
                // Verify kiểm tra tính hợp lệ của cái refreshToken và lấy dữ liệu giải mã decoded 
                const decoded = await jwtHelper.verifyToken(refreshTokenFromClient, refreshTokenSecret);
                // Thông tin user lúc này các bạn có thể lấy thông qua biến decoded.data
                // có thể mở comment dòng debug bên dưới để xem là rõ nhé.
                // debug("decoded: ", decoded);
                const user = decoded.data;
                const accessToken = await jwtHelper.generateToken(user, accessTokenSecret, accessTokenLife);
                // gửi token mới về cho người dùng
                return res.status(200).json({
                    status: 'SUCCESS',
                    message: 'Lấy token thành công',
                    response: {
                        token: accessToken
                    }
                });
            } catch (error) {
                res.status(403).json({
                    message: 'Invalid refresh token.',
                });
            }
        } else {
            // Không tìm thấy token trong request
            return res.status(403).send({
                message: 'No token provided.',
            });
        }
    },
    update: (req, res) => {
        let data = req.body;
        let userId = req.params.userId;
        let sql = 'UPDATE user_info SET firstName=?,lastName=?, phone=?, email=?, location=?, city=? WHERE id_user = ?'
        db.query(sql, [data.firstName, data.lastName, data.phone, data.email, data.location, data.city, userId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Sửa thông tin user thành công',
                response: userId
            })
        })
    },
    create: (req, res) => {
        let sql = 'INSERT INTO user(userName,pass,level) VALUES(?,?,2)'
        db.query(sql, [req.body.username, req.body.password], (err, response) => {
            if (err) throw err
            let sql1 = 'INSERT INTO user_info(firstName,lastName,phone,email,location,city,id_user) VALUES(?,?,?,?,?,?,?)'
            db.query(sql1, [req.body.firstName,req.body.lastName,req.body.phone,req.body.email,req.body.location,req.body.city,response.insertId], (err, result) => {
                if (err) throw err
                res.json({status:'SUCCESS',message: 'Đăng ký thành công'})
            })
        })
    },
    delete: (req, res) => {
        let sql = 'DELETE FROM user_info WHERE id_user = ?'
        db.query(sql, [req.params.userId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Xoá thông tin thành công'
            })
        })
    },
    addInfoUser: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO user_info(firstName,lastName,phone,email,location,city,id_user) VALUES(?,?,?,?,?,?,?)'
        db.query(sql, [data.firstName, data.lastName, data.phone, data.email, data.location, data.city, req.params.userId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Thêm thông tin thành công'
            })
        })
    },
    allHobisUser: (req, res) => {
        let sql = 'SELECT * FROM hosbi_user WHERE id_user = ?'
        db.query(sql, [req.params.userId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Lấy thông tin thành công',
                response: response
            })
        })
    },
    addHobisUser: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO hosbi_user(id_user,name,value) VALUES(?,?,?)'
        db.query(sql, [req.params.userId, data.feild, data.value], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Thêm sở thích thành công'
            })
        })
    },
    updateHobisUser: (req, res) => {
        let data = req.body;
        let sql = 'UPDATE hosbi_user SET id_user=?,name=?,value=? WHERE id = ?'
        db.query(sql, [req.params.userId, data.feild, data.value, req.params.hobisId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Sửa thông tin sở thích thành công'
            })
        })
    },
    deleteHobisUser: (req, res) => {
        let sql = 'DELETE FROM hosbi_user WHERE id = ?'
        db.query(sql, [req.params.hobisId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Xoá thông tin sở thích thành công'
            })
        })
    },
    getInfoUser: (req, res) => {
        let sql = 'SELECT * FROM user_info_repas WHERE id_user = ?'
        db.query(sql, [req.params.userId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Lấy thông tin thành công',
                response: response
            })
        })
    },
    createInfoUser: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO user_info_repas(weight,height,type,id_user) VALUES(?,?,?,?)'
        db.query(sql, [data.weight,data.height,data.type,req.params.userId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Gửi thông tin thành công',
                response: response
            })
        })
    },
    updateInfoUser: (req, res) => {
        let data = req.body;
        let sql = 'UPDATE user_info_repas SET weight=?,height=?,type=? WHERE id_user = ?'
        db.query(sql, [data.weight,data.height,data.type,req.params.userId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'Sửa thông tin thành công',
                response: response
            })
        })
    },
    daleteInfoUser: (req, res) => {
        let sql = 'DELETE FROM user_info_repas WHERE id_user = ?'
        db.query(sql, [req.params.userId], (err, response) => {
            if (err) throw err
            res.json({
                status: 'SUCCESS',
                message: 'xoá',
                response: response
            })
        })
    }
}