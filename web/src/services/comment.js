import config from '../config'
import {
    authHeader
} from '../helpers'
import {
    responseService
} from './response'
//const qs = require('qs');
export const comment = {
    postCommentRoom,
    getCommentRoom
}

function getCommentRoom(hotelId) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}hotel/${hotelId}/comment`, {
        method: 'GET',
        headers: header,
        mode: 'cors',
    }, 4)
}

function postCommentRoom(userId, hotelId, body) {
    return responseService.fetchRetry(`${config.apiUrl}user/${userId}/hotel/${hotelId}/comment`, {
        method: 'POST',
        headers: authHeader(),
        mode: 'cors',
        body: JSON.stringify(body),
    }, 4)
}