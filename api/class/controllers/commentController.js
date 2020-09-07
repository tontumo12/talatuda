'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../../db')

module.exports = {
    getCommentRoom: (req, res) => {
        let sql = 'SELECT cm.id,cm.detail,cm.point,cm.date,ui.firstName,ui.lastName FROM comment_room as cm INNER JOIN user_info as ui on cm.id_user = ui.id_user WHERE cm.id_hotel = ?'
        db.query(sql, [req.params.hotelId], (err, response) => {
            if (err) throw err
            res.json({status: 'SUCCESS',message: 'lấy thông tin thành công',response:response})
        })
    },
    createCommentRoom: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO comment_room(id_hotel,id_user,detail,point) value(?,?,?,?)'
        db.query(sql, [req.params.hotelId,req.params.userId,data.detail,data.point], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Gửi comment thành công'})
        })
    },
    updateCommentRoom: (req, res) => {
        let data = req.body;
        let sql = 'UPDATE comment_room SET id_room,id_user,detail,point WHERE id = ?'
        db.query(sql, [req.params.roomtId,req.params.userId,data.detail,data.point,req.params.commentId], (err, response) => {
            if (err) throw err
            res.json({stauts:'SUCCESS',message: 'Sửa thông tin thành công'})
        })
    },
    deleteCommentRoom: (req, res) => {
        let sql = 'DELETE FROM comment_room WHERE id = ?'
        db.query(sql, [req.params.commentId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Xoá thông tin thành công'})
        })
    },
}