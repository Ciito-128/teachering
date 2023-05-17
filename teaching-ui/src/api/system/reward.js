import request from '@/utils/request'

// 查询获奖成果列表
export function listReward(query) {
  return request({
    url: '/system/reward/list',
    method: 'get',
    params: query
  })
}

// 查询获奖成果详细
export function getReward(id) {
  return request({
    url: '/system/reward/' + id,
    method: 'get'
  })
}

// 新增获奖成果
export function addReward(data) {
  return request({
    url: '/system/reward',
    method: 'post',
    data: data
  })
}

// 修改获奖成果
export function updateReward(data) {
  return request({
    url: '/system/reward',
    method: 'put',
    data: data
  })
}

// 删除获奖成果
export function delReward(id) {
  return request({
    url: '/system/reward/' + id,
    method: 'delete'
  })
}
