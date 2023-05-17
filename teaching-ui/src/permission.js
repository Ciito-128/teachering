import router from './router'
import store from './store'
import {Message} from 'element-ui'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import {getToken} from '@/utils/auth'

NProgress.configure({showSpinner: false})

const whiteList = ['/login', '/auth-redirect', '/bind', '/register', '/pc']

router.beforeEach((to, from, next) => {
  NProgress.start()
  if (getToken()) {
    to.meta.title && store.dispatch('settings/setTitle', to.meta.title)
    /* has token*/
    if (to.path === '/login') {
      next({path: '/'})
      NProgress.done()
    } else {
      if (store.getters.roles.length === 0) {
        // 判断当前用户是否已拉取完user_info信息
        store.dispatch('GetInfo').then(() => {
          store.dispatch('GenerateRoutes').then(accessRoutes => {
            // 根据roles权限生成可访问的路由表
            router.addRoutes(accessRoutes) // 动态添加可访问路由表
            // 页面跳转的路由拦截，根据角色不同跳转到不同的页面
            let path = "/";
            // 判断用户
           /* if (store.state.user.id != 1) {
              path = "/pc";
            }*/
            // 判断要去哪个页面
            if (to.path === "/index") {
              // 如果要去首页则去path路径
              next({path, replace: true}) // hack方法 确保addRoutes已完成
            } else {
              next({...to, replace: true}) // hack方法 确保addRoutes已完成
            }

          })
        }).catch(err => {
          store.dispatch('LogOut').then(() => {
            Message.error(err)
            next({path: '/'})
          })
        })
      } else {
        next()
      }
    }
  } else {
    // 没有token
    if (to.path.startsWith('/pc')) {
      next()
    } else if (whiteList.indexOf(to.path) !== -1) {
      next()
    } else {
      //next(`/login?redirect=${to.fullPath}`) // 否则全部重定向到登录页
      next(`/login`)
      NProgress.done()
    }
  }
})

router.afterEach(() => {
  NProgress.done()
})
