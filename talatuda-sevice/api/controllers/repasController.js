'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../../db')

module.exports = {
    getRepas: (req, res) => {
        if (req.query.min != null && req.query.min != undefined && req.query.max != null && req.query.max != undefined) {
            let sql = 'SELECT * FROM repas WHERE type =? AND energi BETWEEN ? AND ?'
            db.query(sql, [req.query.type,req.query.min,req.query.max], (err, response) => {
                if (err) throw err
                res.json({status:'SUCCESS',message: 'Lấy thông tin thành công',response:response})
            })
        }else if(req.query.type != null && req.query.type != undefined){
            let sql = 'SELECT * FROM repas WHERE repas.type = ?'
            db.query(sql, [req.query.type,req.query.min,req.query.max], (err, response) => {
                if (err) throw err
                console.log(sql)
                res.json({status:'SUCCESS',message: 'Lấy thông tin thành công',response:response})
            })
        }else{
            let sql = 'SELECT * FROM repas'
            db.query(sql, (err, response) => {
                if (err) throw err
                res.json({status: 'SUCCESS',message: 'lấy thông tin thành công',response:response})
            })
        }
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
        let sql = 'SELECT * FROM repas WHERE id = ?'
        db.query(sql, [req.params.repasId], (err, response) => {
            if (err) throw err
            let choise = response[0].choise+1
            let sql1 = 'UPDATE repas SET choise = ? WHERE id = ?'
            db.query(sql1, [choise,response[0].id], (err, response) => {
                if (err) throw err
                res.json({status:'SUCCESS',message: 'Sửa thông tin thành công'})
            })
        })
    },
    deleteRepas: (req, res) => {
        let sql = 'DELETE FROM repas WHERE id = ?'
        db.query(sql, [req.params.repasId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Xoá thông tin thành công'})
        })
    },
    createPointRepas: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO point_repa(repas_id,point) VALUES(?,?)'
        db.query(sql, [req.params.repasId,data.point], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Chấm điểm thành công'})
        })
    },
    getPoitRepas: (req, res) => {
        let sql = 'SELECT sum(point) as point, repas_id as id FROM point_repa WHERE repas_id = ? GROUP BY repas_id'
        db.query(sql, [req.params.repasId], (err, response) => {
            if (err) throw err
            res.json({status:'SUCCESS',message: 'Get thành công', response: response[0]})
        })
    }
}
