import request from '@/utils/request'

// 查询教研科目列表
export function listTeaching(query) {
  return request({
    url: '/system/teaching/list',
    method: 'get',
    params: query
  })
}

// 查询教研科目详细
export function getTeaching(id) {
  return request({
    url: '/system/teaching/' + id,
    method: 'get'
  })
}

// 新增教研科目
export function addTeaching(data) {
  return request({
    url: '/system/teaching',
    method: 'post',
    data: data
  })
}

// 修改教研科目
export function updateTeaching(data) {
  return request({
    url: '/system/teaching',
    method: 'put',
    data: data
  })
}

// 删除教研科目
export function delTeaching(id) {
  return request({
    url: '/system/teaching/' + id,
    method: 'delete'
  })
}
