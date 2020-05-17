import config from '../config'
import {
    authHeader
} from '../helpers'
import {
    authHost
} from '../helpers'
import {
    responseService
} from './response'
//const qs = require('qs');
export const booking = {
    bookingRoom,
    getAllBookingHotel,
    updateState,
    deleteBooking,
    bookingUser
}

function bookingRoom(userId,roomId,body) {
    return responseService.fetchRetry(`${config.apiUrl}user/${userId}/room/${roomId}/booking`, {
        method: 'POST',
        headers: authHeader(),
        mode: 'cors', 
        body: JSON.stringify(body),
    }, 4)
}
function getAllBookingHotel(userId) {
    return responseService.fetchRetry(`${config.apiUrl}host/${userId}/booking`, {
        method: 'GET',
        headers: authHost(),
        mode: 'cors', 
    }, 4)
}
function updateState(body, userId, bookingId) {
    return responseService.fetchRetry(`${config.apiUrl}host/${userId}/booking/${bookingId}`, {
        method: 'PUT',
        headers: authHost(),
        mode: 'cors', 
        body: JSON.stringify(body),
    }, 4)
}
function deleteBooking(userId, bookingId) {
    return responseService.fetchRetry(`${config.apiUrl}host/${userId}/booking/${bookingId}`, {
        method: 'DELETE',
        headers: authHost(),
        mode: 'cors', 
    }, 4)
}
function bookingUser(userId) {
    return responseService.fetchRetry(`${config.apiUrl}user/${userId}/booking`, {
        method: 'GET',
        headers: authHost(),
        mode: 'cors', 
    }, 4)
}