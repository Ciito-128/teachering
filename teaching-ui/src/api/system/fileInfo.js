import request from '@/utils/request'

// 查询资料列表
export function listFileInfo(query) {
  return request({
    url: '/system/fileInfo/list',
    method: 'get',
    params: query
  })
}

// 查询资料详细
export function getFileInfo(id) {
  return request({
    url: '/system/fileInfo/' + id,
    method: 'get'
  })
}

// 新增资料
export function addFileInfo(data) {
  return request({
    url: '/system/fileInfo',
    method: 'post',
    data: data
  })
}

// 修改资料
export function updateFileInfo(data) {
  return request({
    url: '/system/fileInfo',
    method: 'put',
    data: data
  })
}

// 删除资料
export function delFileInfo(id) {
  return request({
    url: '/system/fileInfo/' + id,
    method: 'delete'
  })
}
