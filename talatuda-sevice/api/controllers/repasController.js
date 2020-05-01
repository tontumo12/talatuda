'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../../db')

module.exports = {
    getRepas: (req, res) => {
        let sql = 'SELECT * FROM repas'
        db.query(sql, (err, response) => {
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
        let sql = 'INSERT INTO repas(name,type,pices,detail,energi,img) VALUES(?,?,?,?,?,?)'
        db.query(sql, [data.name,data.type,data.pices,data.detail,data.energi,`http://localhost:3000/images/${req.file.filename}`], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Thêm thông tin món ăn thành công'})
        })
    },
    updateRepas: (req, res) => {
        let data = req.body;
        let sql = 'UPDATE repas SET name=?,type=?,pices=?,detail=?,energi=?,img=? WHERE id = ?'
        db.query(sql, [data.name,data.type,data.pices,data.detail,data.energi,`http://localhost:3000/images/${req.file.filename}`,req.params.repasId], (err, response) => {
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
    }
}