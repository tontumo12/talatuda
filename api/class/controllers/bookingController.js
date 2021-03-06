'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../../db')

module.exports = {
    getBookingRoom: (req, res) => {
        let sql = 'SELECT booking_room.id,booking_room.comment,booking_room.id_room,booking_room.date,booking_room.date_in,booking_room.date_out,booking_room.state,user_info.firstName,user_info.lastName,user_info.phone,room_hotel.name,hotel.name as hotelName FROM booking_room INNER JOIN user_info on booking_room.id_user = user_info.id_user INNER JOIN room_hotel on booking_room.id_room = room_hotel.id INNER JOIN hotel on hotel.id = room_hotel.id_hotel INNER JOIN user_hotel on user_hotel.id_hotel = hotel.id INNER JOIN user on user_hotel.id_user = user.id WHERE user.id = ?'
        db.query(sql, [req.params.userId], (err, response) => {
            if (err) throw err
            res.json({status: 'SUCCESS',message: 'lấy thông tin thành công',response:response})
        })
    },
    getBookingUser: (req, res) => {
        let sql = 'SELECT booking_room.id,booking_room.comment,booking_room.id_room,booking_room.date,booking_room.date_in,booking_room.date_out,booking_room.state,room_hotel.name,hotel.name as hotelName FROM booking_room INNER JOIN room_hotel on booking_room.id_room = room_hotel.id INNER JOIN hotel on hotel.id = room_hotel.id_hotel WHERE booking_room.id_user = ?'
        db.query(sql, [req.params.userId], (err, response) => {
            if (err) throw err
            res.json({status: 'SUCCESS',message: 'lấy thông tin thành công',response:response})
        })
    },
    createBookingRoom: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO booking_room(id_user,id_room,comment,date_in,date_out,state) VALUES(?,?,?,?,?,1)'
        db.query(sql, [req.params.userId,req.params.roomId,data.comment,data.dateIn,data.dateOut], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Đăng ký thành công'})
        })
    },
    updateStateBookingRoom: (req, res) => {
        let data = req.body;
        let sql = 'UPDATE booking_room SET state=? WHERE id = ?'
        db.query(sql, [data.state,req.params.bookingId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Sửa thông tin thành công'})
        })
    },
    deleteBookingRoom: (req, res) => {
        let sql = 'DELETE FROM booking_room WHERE id = ?'
        db.query(sql, [req.params.bookingId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Xoá thông tin thành công'})
        })
    },
}