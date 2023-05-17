// 查询疫情公告详细
import request from "@/utils/request";

// 查询疫情公告列表
export function listGongGao(query) {
  return request({
    url: '/pc/gongGao/list',
    method: 'get',
    headers: {
      isToken: false
    },
    params: query
  })
}

export function getGongGao(id) {
  return request({
    url: '/pc/gongGao/' + id,
    headers: {
      isToken: false
    },
    method: 'get'
  })
}

// 查询房间管理列表
export function listRoom(query) {
  return request({
    url: '/pc/room/list',
    method: 'get',
    headers: {
      isToken: false
    },
    params: query
  })
}

// 查询房间管理详细
export function getRoom(id) {
  return request({
    url: '/pc/room/' + id,
    headers: {
      isToken: false
    },
    method: 'get'
  })
}

// 查询房间图片列表
export function listRoomImg(query) {
  return request({
    url: '/pc/roomImg/list',
    method: 'get',
    headers: {
      isToken: false
    },
    params: query
  })
}

// 查询评论列表
export function listEvaluation(query) {
  return request({
    url: '/pc/evaluation/list',
    method: 'get',
    headers: {
      isToken: false
    },
    params: query
  })
}


// 查询房型管理列表
export function listHotelType(query) {
  return request({
    url: '/pc/hotelType/list',
    method: 'get',
    headers: {
      isToken: false
    },
    params: query
  })
}
