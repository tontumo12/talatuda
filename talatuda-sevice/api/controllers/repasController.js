'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../../db')

module.exports = {
    getRepasHotel: (req, res) => {
        let sql = 'SELECT * FROM repas WHERE id_hotel = ?'
        db.query(sql, [req.params.hotelId], (err, response) => {
            if (err) throw err
            res.json({status: 'SUCCESS',message: 'lấy thông tin thành công',response:response})
        })
    }, 
    getRepasMenu: (req, res) => {
        let sql = 'SELECT * FROM repas INNER JOIN menu_repas on repas.id=menu_repas.id_repas WHERE menu_repas.id_menus = ?'
        db.query(sql, [req.params.menuId], (err, response) => {
            if (err) throw err
            res.json({status: 'SUCCESS',message: 'lấy thông tin thành công',response:response})
        })
    }, 
    getDetailRepas: (req, res) => {
        let sql = 'SELECT * FROM repas WHERE id = ?'
        db.query(sql, [req.params.repasId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Lấy thông tin thành công',response:response[0]})
        })
    },
    createRepas: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO repas(name,type,pices,detail,energi,id_hotel) VALUES(?,?,?,?,?,?)'
        db.query(sql, [data.name,data.type,data.pices,data.detail,data.energi,req.params.hotelId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Đăng ký thành công'})
        })
    },
    updateRepas: (req, res) => {
        let data = req.body;
        let sql = 'UPDATE repas SET name=?,type=?,pices=?,detail=?,energi=?,id_hotel WHERE id = ?'
        db.query(sql, [data.name,data.type,data.pices,data.detail,data.energi,req.params.hotelId, req.params.repasId], (err, response) => {
            if (err) throw err
            res.json({stauts:'SUCCESS',message: 'Sửa thông tin thành công'})
        })
    },
    deleteRepas: (req, res) => {
        let sql = 'DELETE FROM repas WHERE id = ?'
        db.query(sql, [req.params.repasId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Xoá thông tin thành công'})
        })
    },
    addRepasToMenu: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO menu_repas(id_repas,id_menu) VALUES(?,?)'
        db.query(sql, [req.params.menuId,req.params.repasId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Thêm thành công'})
        })
    },
    deteleRepasToMenu: (req, res) => {
        let data = req.body;
        let sql = 'DELETE FROM menu_repas WHERE id_repas=? AND id_menu=?'
        db.query(sql, [req.params.menuId,req.params.repasId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Xoá thành công'})
        })
    },
}