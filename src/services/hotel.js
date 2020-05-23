import config from '../config'
import {
    authHost
} from '../helpers'
import {
    responseService
} from './response'
//const qs = require('qs');
export const hotel = {
    listHotel,
    detailHotel,
    deleteHotel,
    getListRoom,
    createRoom,
    listHotelCity,
    deleteRoom
}

function listHotel() {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}hotel`, {
        method: 'GET',
        headers: header,
        mode: 'cors',
    }, 4)
}

function listHotelCity(idCity) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}hotel/city/${idCity}`, {
        method: 'GET',
        headers: header,
        mode: 'cors', 
    }, 4)
}

function detailHotel(hotelId) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}hotel/${hotelId}`, {
        method: 'GET',
        headers: header,
        mode: 'cors', 
    }, 4)
}

function deleteHotel(userId,hotelId) {
    return responseService.fetchRetry(`${config.apiUrl}user/${userId}/hotel/${hotelId}`, {
        method: 'DELETE',
        headers: authHost(),
        mode: 'cors'
    }, 4)
}

function getListRoom(hotelId) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}hotel/${hotelId}/room`, {
        method: 'GET',
        headers: header,
        mode: 'cors'
    }, 4)
}

function createRoom(body,hotelId,userId) {
    return responseService.fetchRetry(`${config.apiUrl}user/${userId}/hotel/${hotelId}/room`, {
        method: 'POST',
        headers: authHost(),
        mode: 'cors',
        body: JSON.stringify(body)
    }, 4)
}

function deleteRoom(roomId,userId) {
    return responseService.fetchRetry(`${config.apiUrl}user/${userId}/room/${roomId}`, {
        method: 'DELETE',
        headers: authHost(),
        mode: 'cors'
    }, 4)
}