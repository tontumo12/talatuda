'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../../db')

module.exports = {
    getRoomHotel: (req, res) => {
        let sql = 'SELECT * FROM room_hotel WHERE id_hotel = ?'
        db.query(sql, [req.params.hotelId], (err, response) => {
            if (err) throw err
            res.json({status: 'SUCCESS',message: 'lấy thông tin thành công',response:response})
        })
    }, 
    getDetailRoom: (req, res) => {
        let sql = 'SELECT * FROM room_hotel WHERE id = ?'
        db.query(sql, [req.params.roomId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Lấy thông tin thành công',response:response[0]})
        })
    },
    createRoom: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO room_hotel(name,type,prices,detail,id_hotel,number) VALUES(?,?,?,?,?,?)'
        db.query(sql, [data.name,data.type,data.prices,data.detail,req.params.hotelId,data.number], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Đăng ký thành công'})
        })
    },
    updateRoom: (req, res) => {
        let data = req.body;
        let sql = 'UPDATE room_hotel SET name=?,type=?,pices=?,detail=?,id_hotel=?,number=? WHERE id = ?'
        db.query(sql, [data.name,data.type,data.pices,data.detail,req.params.hotelId,data.number, req.params.roomId], (err, response) => {
            if (err) throw err
            res.json({stauts:'SUCCESS',message: 'Sửa thông tin thành công'})
        })
    },
    deleteRoom: (req, res) => {
        let sql = 'DELETE FROM room_hotel WHERE id = ?'
        db.query(sql, [req.params.roomId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Xoá thông tin thành công'})
        })
    },
}