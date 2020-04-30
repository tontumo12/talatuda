'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../../db')

module.exports = {
    getHotelCity: (req, res) => {
        let sql = 'SELECT * FROM hotel where type = 1  and location like ?'
        db.query(sql,[req.params.cityId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Lấy thông tin thành công',response:response,sql: sql})
        })
    },
    getAllHotel: (req, res) => {
        let sql = 'SELECT * FROM hotel where type = 1'
        db.query(sql, (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Lấy thông tin thành công',response:response})
        })
    },
    getDetailHotel: (req, res) => {
        let sql = 'SELECT * FROM hotel WHERE id = ? and type = 1'
        db.query(sql, [req.params.hotelId], (err, response) => {
            if (err) throw err
            let sql1 = 'SELECT * FROM room_hotel WHERE id_hotel = ?'
            db.query(sql1, [req.params.hotelId], (err, result) => {
                if (err) throw err
                res.json({status:'SUCCESS',message: 'Lấy thông tin thành công', response:{hotel:response[0],room:result}})
            })
        })
    }, 
    getHotelUser: (req, res) => {
        let sql = 'SELECT * FROM hotel INNER JOIN user_hotel on hotel.id = user_hotel.id_hotel INNER JOIN user on user_hotel.id_user = user.id WHERE user.id = ?'
        db.query(sql, [req.params.userId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message:'lấy thông tin thành công',response:response})
        })
    },
    createHotel: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO hotel(name,address,level,location,detail,type,img) VALUES(?,?,?,?,?,?,?)'
        //let sql1 = 'INSERT INTO '
        db.query(sql, [data.name,data.address,data.level,data.location,data.detail,data.type,`http://localhost:3000/images/${req.file.filename}`], (err, response) => {
            if (err) throw err
            let sql1 = 'INSERT INTO user_hotel(id_user,id_hotel) VALUES(?,?)'
            db.query(sql1, [req.params.userId,response.insertId], (err, result) => {
                if (err) throw err
                res.json({status:'SUCCESS',message: 'Đăng ký thành công'})
            })
            //res.json({status:'SUCCESS',message: 'Đăng ký thành công', response:response})
        })
    },
    updateHotel: (req, res) => {
        let data = req.body;
        let sql = 'UPDATE hotel SET name=?,address=?,level=?,location=?,detail=?,type=?,img=? WHERE id = ?'
        if (data.newImg === true || data.newImg === "true") {
            db.query(sql, [data.name,data.address,data.level,data.location,data.detail,data.type,`http://localhost:3000/images/${req.file.filename}`, req.params.hotelId], (err, response) => {
                if (err) throw err
                res.json({status:'SUCCESS',message: 'Sửa thông tin thành công'})
            })
        }else{
            db.query(sql, [data.name,data.address,data.level,data.location,data.detail,data.type,data.img, req.params.hotelId], (err, response) => {
                if (err) throw err
                res.json({status:'SUCCESS',message: 'Sửa thông tin thành công'})
            })
        }
    },
    deleteHotel: (req, res) => {
        let sql = 'DELETE FROM hotel WHERE id = ?'
        db.query(sql, [req.params.hotelId], (err, response) => {
            if (err) throw err
            let sql1 = 'DELETE FROM user_hotel WHERE id_user=? AND id_hotel=?'
            db.query(sql1, [req.params.userId,req.params.hotelId], (err, result) => {
                if (err) throw err
                res.json({status:'SUCCESS',message: 'Xoá thông tin thành công'})
            })
        })
    },
}