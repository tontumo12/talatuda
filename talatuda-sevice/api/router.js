'use strict';
module.exports = function (app) {
  const AuthMiddleWare = require("./middleware/authMiddleware");
  let user = require('./controllers/userController.js');
  let hotel = require('./controllers/hotelController.js');
  let room = require('./controllers/roomController.js');
  let repas = require('./controllers/repasController.js');
  let comment = require('./controllers/commentController.js')
  let booking = require('./controllers/bookingController')
  var multer = require('multer');
  var storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, './public/images');
    },
    filename: (req, file, cb) => {
      console.log(file);
      var filetype = '';
      if (file.mimetype === 'image/gif') {
        filetype = 'gif';
      }
      if (file.mimetype === 'image/png') {
        filetype = 'png';
      }
      if (file.mimetype === 'image/jpeg') {
        filetype = 'jpg';
      }
      cb(null, Date.now() + '.' + filetype);
    }
  });
  var upload = multer({
    storage: storage
  });
  app.get('/imgages/:imageId', (req, res) => {
    res.sendFile(`./public/images/${req.params.imageId}`, { root: __dirname });
  })
  // todoList Routes
  app.route('/repas') //done
    .get(repas.getRepas)
  app.post('/repas', upload.single('file'), repas.createRepas)
  app.put('/repas/:repasId', upload.single('file'), repas.updateRepas)
  app.route('/repas/:repasId') //done
    .get(repas.getDetailRepas)
    .delete(repas.deleteRepas)
  app.route('/login')
    .post(user.login) //done
  app.route('/loginhost')
    .post(user.loginAdmin) //done
  app.route('/token')
    .post(user.refreshToken) //done
  app.route('/regiter')
    .post(user.create) //done
  app.route('/hotel')
    .get(hotel.getAllHotel)
  app.route('/hotel/city/:cityId')
    .get(hotel.getHotelCity)
  app.route('/hotel/:hotelId') //done
    .get(hotel.getDetailHotel)
  app.route('/hotel/:hotelId/room') //done
    .get(room.getRoomHotel)
  app.route('/hotel/:hotelId/room/:roomId') //done
    .get(room.getDetailRoom)
  app.route('/hotel/:hotelId/comment')
    .get(comment.getCommentRoom) //done
  app.use(AuthMiddleWare.isAuth) // middeware
  app.route('/user/:userId')
    .put(user.update) //done
    .delete(user.delete) //done
  app.route('/user/:userId/hobis')
    .post(user.addHobisUser) //done
    .get(user.allHobisUser) //done
  app.route('/user/:userId/hobis/:hobisId')
    .put(user.updateHobisUser) //done
    .delete(user.deleteHobisUser) //done
  app.route('/user/:userId/info')
    .post(user.createInfoUser) //done
    .get(user.getInfoUser) //done
    .put(user.updateInfoUser) //done
    .delete(user.daleteInfoUser) //done
  app.post('/user/:userId/hotel', upload.single('file'), hotel.createHotel)
  app.put('/user/:userId/hotel/:hotelId',upload.single('file'),hotel.updateHotel)
  app.route('/user/:userId/hotel/:hotelId')
    .delete(hotel.deleteHotel) //done
  app.route('/user/:userId/hotel/:hotelId/room')
    .post(room.createRoom) //done
  app.route('/user/:userId/room/:roomId')
    .delete(room.deleteRoom) //done
  app.route('/user/:userId/hotel/:hotelId/comment')
    .post(comment.createCommentRoom) //done
  app.route('/user/:userId/room/:roomId/comment/:commentId')
    .put(comment.updateCommentRoom) //done
    .delete(comment.deleteCommentRoom) //done
  app.route('/user/:userId/room/:roomId/booking')
    .post(booking.createBookingRoom) //done
  app.route('/host/:userId/booking')
    .get(booking.getBookingRoom) //done
  app.route('/user/:userId/booking')
    .get(booking.getBookingUser) //done
  app.route('/host/:userId/booking/:bookingId')
    .put(booking.updateStateBookingRoom) //done
    .delete(booking.deleteBookingRoom) //done
};