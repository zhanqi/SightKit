//
//  AppRqDefines.swift
//
//
//  Created by SwaggerGenerator on 2021-02-28 18:50:46.003
//


import Foundation


/** 参数处理方式（where to put the parameter
 ## 使用示例
 ```
 path, e.g. /users/{id};
 query, e.g. /users?role=admin;
 header, e.g. X-MyHeader: Value;
 cookie, e.g. Cookie: debug=0;
*/
enum SGParamPosition {
    case inBody,inQuery,inPath
}

class SGItem {
    var url:String = ""
    var method:String = "GET"
    var paramMap:[(name:String,typeStr:String,paramPosition:SGParamPosition,isRequied:Bool)] = []
}

class SGResponseItem: NSObject {
    enum CodingKeys: String, CodingKey {
        case extensionStr = "description"
    }
}

var hostUrl = "http://47.115.54.215:8085/"

// MARK: - UrlItems

extension SGItem {

    /** 按状态分页获取用户佣金列表  (代理板块)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:5
     status:Int
    */
    static let agent_commission_list_get:SGItem = {
        let item = SGItem()
        item.url = "/agent/commission/list"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
            ("status","Int",.inQuery,false),
        ]
        return item
    }()

    /// 获取会员等级信息  (代理板块)
    static let agent_level_list_get:SGItem = {
        let item = SGItem()
        item.url = "/agent/level/list"
        item.method = "get"
        return item
    }()

    /** 获取下线会员列表  (代理板块)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:5
    */
    static let agent_subline_member_list_get:SGItem = {
        let item = SGItem()
        item.url = "/agent/subline/member/list"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /** 提现申请  (代理板块)
    ## 参数说明
    ```
     withdrawalApplyParam:  required
    */
    static let agent_withdrawal_apply_post:SGItem = {
        let item = SGItem()
        item.url = "/agent/withdrawal/apply"
        item.method = "post"
        item.paramMap = [
            ("withdrawalApplyParam","",.inBody,true),
        ]
        return item
    }()

    /** 获取提现记录  (代理板块)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:5
     status:Int
    */
    static let agent_withdrawal_list_get:SGItem = {
        let item = SGItem()
        item.url = "/agent/withdrawal/list"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
            ("status","Int",.inQuery,false),
        ]
        return item
    }()

    /** 获取品牌详情  (前台品牌管理)
    ## 参数说明
    ```
     brandId:Int  required
    */
    static let brand_detail_get:SGItem = {
        let item = SGItem()
        item.url = "/brand/detail"
        item.method = "get"
        item.paramMap = [
            ("brandId","Int",.inPath,true),
        ]
        return item
    }()

    /** 分页获取品牌相关商品  (前台品牌管理)
    ## 参数说明
    ```
     brandId:Int  required
     pageNum:Int  default:1
     pageSize:Int  default:6
    */
    static let brand_productList_get:SGItem = {
        let item = SGItem()
        item.url = "/brand/productList"
        item.method = "get"
        item.paramMap = [
            ("brandId","Int",.inQuery,true),
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /** 分页获取推荐品牌  (前台品牌管理)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:6
    */
    static let brand_recommendList_get:SGItem = {
        let item = SGItem()
        item.url = "/brand/recommendList"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /** 添加商品到购物车  (购物车管理)
    ## 参数说明
    ```
     cartItem:  required
    */
    static let cart_add_post:SGItem = {
        let item = SGItem()
        item.url = "/cart/add"
        item.method = "post"
        item.paramMap = [
            ("cartItem","",.inBody,true),
        ]
        return item
    }()

    /// 清空购物车  (购物车管理)
    static let cart_clear_post:SGItem = {
        let item = SGItem()
        item.url = "/cart/clear"
        item.method = "post"
        return item
    }()

    /** 删除购物车中的某个商品  (购物车管理)
    ## 参数说明
    ```
     ids:Array  required
    */
    static let cart_delete_post:SGItem = {
        let item = SGItem()
        item.url = "/cart/delete"
        item.method = "post"
        item.paramMap = [
            ("ids","Array",.inQuery,true),
        ]
        return item
    }()

    /** 获取购物车中某个商品的规格,用于重选规格  (购物车管理)
    ## 参数说明
    ```
     productId:Int  required
    */
    static let cart_getProduct_get:SGItem = {
        let item = SGItem()
        item.url = "/cart/getProduct"
        item.method = "get"
        item.paramMap = [
            ("productId","Int",.inPath,true),
        ]
        return item
    }()

    /// 获取某个会员的购物车列表  (购物车管理)
    static let cart_list_get:SGItem = {
        let item = SGItem()
        item.url = "/cart/list"
        item.method = "get"
        return item
    }()

    /** 获取某个会员的购物车列表,包括促销信息  (购物车管理)
    ## 参数说明
    ```
     cartIds:Array
    */
    static let cart_list_promotion_get:SGItem = {
        let item = SGItem()
        item.url = "/cart/list/promotion"
        item.method = "get"
        item.paramMap = [
            ("cartIds","Array",.inQuery,false),
        ]
        return item
    }()

    /** 修改购物车中商品的规格  (购物车管理)
    ## 参数说明
    ```
     cartItem:  required
    */
    static let cart_update_attr_post:SGItem = {
        let item = SGItem()
        item.url = "/cart/update/attr"
        item.method = "post"
        item.paramMap = [
            ("cartItem","",.inBody,true),
        ]
        return item
    }()

    /** 修改购物车中某个商品的数量  (购物车管理)
    ## 参数说明
    ```
     id:Int  required
     quantity:Int  required
    */
    static let cart_update_quantity_get:SGItem = {
        let item = SGItem()
        item.url = "/cart/update/quantity"
        item.method = "get"
        item.paramMap = [
            ("id","Int",.inQuery,true),
            ("quantity","Int",.inQuery,true),
        ]
        return item
    }()

    /// 首页内容页信息展示  (首页内容管理)
    static let home_content_get:SGItem = {
        let item = SGItem()
        item.url = "/home/content"
        item.method = "get"
        return item
    }()

    /** 分页获取人气推荐商品  (首页内容管理)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:6
    */
    static let home_hotProductList_get:SGItem = {
        let item = SGItem()
        item.url = "/home/hotProductList"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /** 分页获取新品推荐商品  (首页内容管理)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:6
    */
    static let home_newProductList_get:SGItem = {
        let item = SGItem()
        item.url = "/home/newProductList"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /** 获取首页商品分类  (首页内容管理)
    ## 参数说明
    ```
     parentId:Int  required
    */
    static let home_productCateList_get:SGItem = {
        let item = SGItem()
        item.url = "/home/productCateList"
        item.method = "get"
        item.paramMap = [
            ("parentId","Int",.inPath,true),
        ]
        return item
    }()

    /** 分页获取推荐商品  (首页内容管理)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:4
    */
    static let home_recommendProductList_get:SGItem = {
        let item = SGItem()
        item.url = "/home/recommendProductList"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /** 根据分类获取专题  (首页内容管理)
    ## 参数说明
    ```
     cateId:Int
     pageNum:Int  default:1
     pageSize:Int  default:4
    */
    static let home_subjectList_get:SGItem = {
        let item = SGItem()
        item.url = "/home/subjectList"
        item.method = "get"
        item.paramMap = [
            ("cateId","Int",.inQuery,false),
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /** 添加收货地址  (会员收货地址管理)
    ## 参数说明
    ```
     address:  required
    */
    static let member_address_add_post:SGItem = {
        let item = SGItem()
        item.url = "/member/address/add"
        item.method = "post"
        item.paramMap = [
            ("address","",.inBody,true),
        ]
        return item
    }()

    /** 删除收货地址  (会员收货地址管理)
    ## 参数说明
    ```
     id:Int  required
    */
    static let member_address_delete_post:SGItem = {
        let item = SGItem()
        item.url = "/member/address/delete"
        item.method = "post"
        item.paramMap = [
            ("id","Int",.inPath,true),
        ]
        return item
    }()

    /// 显示所有收货地址  (会员收货地址管理)
    static let member_address_list_get:SGItem = {
        let item = SGItem()
        item.url = "/member/address/list"
        item.method = "get"
        return item
    }()

    /** 修改收货地址  (会员收货地址管理)
    ## 参数说明
    ```
     address:  required
     id:Int  required
    */
    static let member_address_update_post:SGItem = {
        let item = SGItem()
        item.url = "/member/address/update"
        item.method = "post"
        item.paramMap = [
            ("address","",.inBody,true),
            ("id","Int",.inPath,true),
        ]
        return item
    }()

    /** 获取收货地址详情  (会员收货地址管理)
    ## 参数说明
    ```
     id:Int  required
    */
    static let member_address_get:SGItem = {
        let item = SGItem()
        item.url = "/member/address"
        item.method = "get"
        item.paramMap = [
            ("id","Int",.inPath,true),
        ]
        return item
    }()

    /** 添加品牌关注  (会员关注品牌管理)
    ## 参数说明
    ```
     memberBrandAttention:  required
    */
    static let member_attention_add_post:SGItem = {
        let item = SGItem()
        item.url = "/member/attention/add"
        item.method = "post"
        item.paramMap = [
            ("memberBrandAttention","",.inBody,true),
        ]
        return item
    }()

    /// 清空关注列表  (会员关注品牌管理)
    static let member_attention_clear_post:SGItem = {
        let item = SGItem()
        item.url = "/member/attention/clear"
        item.method = "post"
        return item
    }()

    /** 取消关注  (会员关注品牌管理)
    ## 参数说明
    ```
     brandId:Int
    */
    static let member_attention_delete_post:SGItem = {
        let item = SGItem()
        item.url = "/member/attention/delete"
        item.method = "post"
        item.paramMap = [
            ("brandId","Int",.inQuery,false),
        ]
        return item
    }()

    /** 显示关注品牌详情  (会员关注品牌管理)
    ## 参数说明
    ```
     brandId:Int  required
    */
    static let member_attention_detail_get:SGItem = {
        let item = SGItem()
        item.url = "/member/attention/detail"
        item.method = "get"
        item.paramMap = [
            ("brandId","Int",.inQuery,true),
        ]
        return item
    }()

    /** 显示关注列表  (会员关注品牌管理)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:5
    */
    static let member_attention_list_get:SGItem = {
        let item = SGItem()
        item.url = "/member/attention/list"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /** 领取指定优惠券  (用户优惠券管理)
    ## 参数说明
    ```
     couponId:Int  required
    */
    static let member_coupon_add_post:SGItem = {
        let item = SGItem()
        item.url = "/member/coupon/add"
        item.method = "post"
        item.paramMap = [
            ("couponId","Int",.inPath,true),
        ]
        return item
    }()

    /** 获取用户优惠券列表  (用户优惠券管理)
    ## 参数说明
    ```
     useStatus:ref
    */
    static let member_coupon_list_get:SGItem = {
        let item = SGItem()
        item.url = "/member/coupon/list"
        item.method = "get"
        item.paramMap = [
            ("useStatus","ref",.inQuery,false),
        ]
        return item
    }()

    /** 获取登录会员购物车的相关优惠券  (用户优惠券管理)
    ## 参数说明
    ```
     type:ref  default:1
    */
    static let member_coupon_list_cart_get:SGItem = {
        let item = SGItem()
        item.url = "/member/coupon/list/cart"
        item.method = "get"
        item.paramMap = [
            ("type","ref",.inQuery,false),
        ]
        return item
    }()

    /** 获取当前商品相关优惠券  (用户优惠券管理)
    ## 参数说明
    ```
     productId:Int  required
    */
    static let member_coupon_listByProduct_get:SGItem = {
        let item = SGItem()
        item.url = "/member/coupon/listByProduct"
        item.method = "get"
        item.paramMap = [
            ("productId","Int",.inPath,true),
        ]
        return item
    }()

    /** 获取用户优惠券历史列表  (用户优惠券管理)
    ## 参数说明
    ```
     useStatus:ref
    */
    static let member_coupon_listHistory_get:SGItem = {
        let item = SGItem()
        item.url = "/member/coupon/listHistory"
        item.method = "get"
        item.paramMap = [
            ("useStatus","ref",.inQuery,false),
        ]
        return item
    }()

    /** 添加商品收藏  (会员收藏管理)
    ## 参数说明
    ```
     productCollection:  required
    */
    static let member_productCollection_add_post:SGItem = {
        let item = SGItem()
        item.url = "/member/productCollection/add"
        item.method = "post"
        item.paramMap = [
            ("productCollection","",.inBody,true),
        ]
        return item
    }()

    /// 清空收藏列表  (会员收藏管理)
    static let member_productCollection_clear_post:SGItem = {
        let item = SGItem()
        item.url = "/member/productCollection/clear"
        item.method = "post"
        return item
    }()

    /** 删除收藏商品  (会员收藏管理)
    ## 参数说明
    ```
     productId:Int
    */
    static let member_productCollection_delete_post:SGItem = {
        let item = SGItem()
        item.url = "/member/productCollection/delete"
        item.method = "post"
        item.paramMap = [
            ("productId","Int",.inQuery,false),
        ]
        return item
    }()

    /** 显示收藏商品详情  (会员收藏管理)
    ## 参数说明
    ```
     productId:Int  required
    */
    static let member_productCollection_detail_get:SGItem = {
        let item = SGItem()
        item.url = "/member/productCollection/detail"
        item.method = "get"
        item.paramMap = [
            ("productId","Int",.inQuery,true),
        ]
        return item
    }()

    /** 显示收藏列表  (会员收藏管理)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:5
    */
    static let member_productCollection_list_get:SGItem = {
        let item = SGItem()
        item.url = "/member/productCollection/list"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /// 清空除浏览记录  (会员商品浏览记录管理)
    static let member_readHistory_clear_post:SGItem = {
        let item = SGItem()
        item.url = "/member/readHistory/clear"
        item.method = "post"
        return item
    }()

    /** 创建浏览记录  (会员商品浏览记录管理)
    ## 参数说明
    ```
     memberReadHistory:  required
    */
    static let member_readHistory_create_post:SGItem = {
        let item = SGItem()
        item.url = "/member/readHistory/create"
        item.method = "post"
        item.paramMap = [
            ("memberReadHistory","",.inBody,true),
        ]
        return item
    }()

    /** 删除浏览记录  (会员商品浏览记录管理)
    ## 参数说明
    ```
     ids:Array  required
    */
    static let member_readHistory_delete_post:SGItem = {
        let item = SGItem()
        item.url = "/member/readHistory/delete"
        item.method = "post"
        item.paramMap = [
            ("ids","Array",.inQuery,true),
        ]
        return item
    }()

    /** 分页获取用户浏览记录  (会员商品浏览记录管理)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:5
    */
    static let member_readHistory_list_get:SGItem = {
        let item = SGItem()
        item.url = "/member/readHistory/list"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
        ]
        return item
    }()

    /** 取消单个超时订单  (订单管理)
    ## 参数说明
    ```
     orderId:Int
    */
    static let order_cancelOrder_post:SGItem = {
        let item = SGItem()
        item.url = "/order/cancelOrder"
        item.method = "post"
        item.paramMap = [
            ("orderId","Int",.inQuery,false),
        ]
        return item
    }()

    /// 自动取消超时订单  (订单管理)
    static let order_cancelTimeOutOrder_post:SGItem = {
        let item = SGItem()
        item.url = "/order/cancelTimeOutOrder"
        item.method = "post"
        return item
    }()

    /** 用户取消订单  (订单管理)
    ## 参数说明
    ```
     orderId:Int
    */
    static let order_cancelUserOrder_post:SGItem = {
        let item = SGItem()
        item.url = "/order/cancelUserOrder"
        item.method = "post"
        item.paramMap = [
            ("orderId","Int",.inQuery,false),
        ]
        return item
    }()

    /** 用户确认收货  (订单管理)
    ## 参数说明
    ```
     orderId:Int
    */
    static let order_confirmReceiveOrder_post:SGItem = {
        let item = SGItem()
        item.url = "/order/confirmReceiveOrder"
        item.method = "post"
        item.paramMap = [
            ("orderId","Int",.inQuery,false),
        ]
        return item
    }()

    /** 用户删除订单  (订单管理)
    ## 参数说明
    ```
     orderId:Int
    */
    static let order_deleteOrder_post:SGItem = {
        let item = SGItem()
        item.url = "/order/deleteOrder"
        item.method = "post"
        item.paramMap = [
            ("orderId","Int",.inQuery,false),
        ]
        return item
    }()

    /** 根据ID获取订单详情  (订单管理)
    ## 参数说明
    ```
     orderId:Int  required
    */
    static let order_detail_get:SGItem = {
        let item = SGItem()
        item.url = "/order/detail"
        item.method = "get"
        item.paramMap = [
            ("orderId","Int",.inPath,true),
        ]
        return item
    }()

    /** 根据购物车信息生成确认单信息  (订单管理)
    ## 参数说明
    ```
     cartIds:  required
    */
    static let order_generateConfirmOrder_post:SGItem = {
        let item = SGItem()
        item.url = "/order/generateConfirmOrder"
        item.method = "post"
        item.paramMap = [
            ("cartIds","",.inBody,true),
        ]
        return item
    }()

    /** 根据购物车信息生成订单  (订单管理)
    ## 参数说明
    ```
     orderParam:  required
    */
    static let order_generateOrder_post:SGItem = {
        let item = SGItem()
        item.url = "/order/generateOrder"
        item.method = "post"
        item.paramMap = [
            ("orderParam","",.inBody,true),
        ]
        return item
    }()

    /** 按状态分页获取用户订单列表  (订单管理)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:5
     status:Int  default:-1
    */
    static let order_list_get:SGItem = {
        let item = SGItem()
        item.url = "/order/list"
        item.method = "get"
        item.paramMap = [
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
            ("status","Int",.inQuery,false),
        ]
        return item
    }()

    /** 用户支付成功的回调  (订单管理)
    ## 参数说明
    ```
     orderId:Int  required
     payType:Int  required
    */
    static let order_paySuccess_post:SGItem = {
        let item = SGItem()
        item.url = "/order/paySuccess"
        item.method = "post"
        item.paramMap = [
            ("orderId","Int",.inQuery,true),
            ("payType","Int",.inQuery,true),
        ]
        return item
    }()

    /// 以树形结构获取所有商品分类  (前台商品管理)
    static let product_categoryTreeList_get:SGItem = {
        let item = SGItem()
        item.url = "/product/categoryTreeList"
        item.method = "get"
        return item
    }()

    /** 获取前台商品详情  (前台商品管理)
    ## 参数说明
    ```
     id:Int  required
    */
    static let product_detail_get:SGItem = {
        let item = SGItem()
        item.url = "/product/detail"
        item.method = "get"
        item.paramMap = [
            ("id","Int",.inPath,true),
        ]
        return item
    }()

    /** 综合搜索、筛选、排序  (前台商品管理)
    ## 参数说明
    ```
     brandId:Int
     keyword:String
     pageNum:Int  default:0
     pageSize:Int  default:5
     productCategoryId:Int
     sort:ref  default:0
    */
    static let product_search_get:SGItem = {
        let item = SGItem()
        item.url = "/product/search"
        item.method = "get"
        item.paramMap = [
            ("brandId","Int",.inQuery,false),
            ("keyword","String",.inQuery,false),
            ("pageNum","Int",.inQuery,false),
            ("pageSize","Int",.inQuery,false),
            ("productCategoryId","Int",.inQuery,false),
            ("sort","ref",.inQuery,false),
        ]
        return item
    }()

    /** 申请退货  (申请退货管理)
    ## 参数说明
    ```
     returnApply:  required
    */
    static let returnApply_create_post:SGItem = {
        let item = SGItem()
        item.url = "/returnApply/create"
        item.method = "post"
        item.paramMap = [
            ("returnApply","",.inBody,true),
        ]
        return item
    }()

    /** 获取验证码  (会员登录注册管理)
    ## 参数说明
    ```
     telephone:String  required
    */
    static let sso_getAuthCode_get:SGItem = {
        let item = SGItem()
        item.url = "/sso/getAuthCode"
        item.method = "get"
        item.paramMap = [
            ("telephone","String",.inQuery,true),
        ]
        return item
    }()

    /** 获取会员信息  (会员登录注册管理)
    ## 参数说明
    ```
     name:String
    */
    static let sso_info_get:SGItem = {
        let item = SGItem()
        item.url = "/sso/info"
        item.method = "get"
        item.paramMap = [
            ("name","String",.inQuery,false),
        ]
        return item
    }()

    /** 会员登录  (会员登录注册管理)
    ## 参数说明
    ```
     password:String  required
     username:String  required
    */
    static let sso_login_post:SGItem = {
        let item = SGItem()
        item.url = "/sso/login"
        item.method = "post"
        item.paramMap = [
            ("password","String",.inQuery,true),
            ("username","String",.inQuery,true),
        ]
        return item
    }()

    /// 刷新token  (会员登录注册管理)
    static let sso_refreshToken_get:SGItem = {
        let item = SGItem()
        item.url = "/sso/refreshToken"
        item.method = "get"
        return item
    }()

    /** 会员注册  (会员登录注册管理)
    ## 参数说明
    ```
     authCode:String  required
     password:String  required
     shareCode:String
     telephone:String  required
     username:String  required
    */
    static let sso_register_post:SGItem = {
        let item = SGItem()
        item.url = "/sso/register"
        item.method = "post"
        item.paramMap = [
            ("authCode","String",.inQuery,true),
            ("password","String",.inQuery,true),
            ("shareCode","String",.inQuery,false),
            ("telephone","String",.inQuery,true),
            ("username","String",.inQuery,true),
        ]
        return item
    }()

    /** 修改密码  (会员登录注册管理)
    ## 参数说明
    ```
     authCode:String  required
     password:String  required
     telephone:String  required
    */
    static let sso_updatePassword_post:SGItem = {
        let item = SGItem()
        item.url = "/sso/updatePassword"
        item.method = "post"
        item.paramMap = [
            ("authCode","String",.inQuery,true),
            ("password","String",.inQuery,true),
            ("telephone","String",.inQuery,true),
        ]
        return item
    }()

}

// MARK: - Models

class AgCommission: SGResponseItem {
    /// 佣金
    var commission:Float?
    /// 创建时间
    var createTime:String?
    var id:Int?
    /// 会员ID
    var memberId:Int?
    /// 订单编号
    var orderSn:String?
    /// 订单总金额
    var orderTotalAmount:Float?
    /// 状态0:待结算 1:已结算
    var status:Int?

}
class AgWithdrawal: SGResponseItem {
    /// 金额
    var amount:Float?
    /// 支行信息
    var bankBranch:String?
    /// 银行名称
    var bankName:String?
    /// 银行卡号
    var bankNo:String?
    /// 创建时间
    var createTime:String?
    /// ID
    var id:Int?
    /// 会员ID
    var memberId:Int?
    /// 真实姓名
    var realName:String?
    /// 状态 0:审核中 1:已完成
    var status:Int?
    /// 修改时间
    var updateTime:String?

}
class AgWithdrawalApply: SGResponseItem {
    /// 金额
    var amount:Float?
    /// 支行信息
    var bankBranch:String?
    /// 银行名称
    var bankName:String?
    /// 银行卡号
    var bankNo:String?
    /// 真实姓名
    var realName:String?

}
class CalcAmount: SGResponseItem {
    var freightAmount:Float?
    var payAmount:Float?
    var promotionAmount:Float?
    var totalAmount:Float?

}
class CartProduct: SGResponseItem {
    /// 画册图片，连产品图片限制为5张，以逗号分割
    var albumPics:String?
    var brandId:Int?
    /// 品牌名称
    var brandName:String?
    /// 删除状态：0->未删除；1->已删除
    var deleteStatus:Int?
    /// 商品描述
    var descriptionStr:String?
    var detailDesc:String?
    /// 产品详情网页内容
    var detailHtml:String?
    /// 移动端网页详情
    var detailMobileHtml:String?
    var detailTitle:String?
    /// 折扣金额（可抵扣）
    var discountAmount:Float?
    var feightTemplateId:Int?
    /// 赠送的成长值
    var giftGrowth:Int?
    /// 赠送的积分
    var giftPoint:Int?
    var id:Int?
    var keywords:String?
    /// 库存预警值
    var lowStock:Int?
    var name:String?
    /// 新品状态:0->不是新品；1->新品
    var newStatus:Int?
    var note:String?
    /// 市场价
    var originalPrice:Float?
    var pic:String?
    /// 是否为预告商品：0->不是；1->是
    var previewStatus:Int?
    var price:Float?
    var productAttributeCategoryId:Int?
    var productAttributeList:[PmsProductAttribute] = []
    var productCategoryId:Int?
    /// 商品分类名称
    var productCategoryName:String?
    /// 货号
    var productSn:String?
    /// 促销结束时间
    var promotionEndTime:String?
    /// 活动限购数量
    var promotionPerLimit:Int?
    /// 促销价格
    var promotionPrice:Float?
    /// 促销开始时间
    var promotionStartTime:String?
    /// 促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购
    var promotionType:Int?
    /// 上架状态：0->下架；1->上架
    var publishStatus:Int?
    /// 推荐状态；0->不推荐；1->推荐
    var recommandStatus:Int?
    /// 销量
    var sale:Int?
    /// 以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮
    var serviceIds:String?
    var skuStockList:[PmsSkuStock] = []
    /// 排序
    var sort:Int?
    /// 库存
    var stock:Int?
    /// 副标题
    var subTitle:String?
    /// 单位
    var unit:String?
    /// 限制使用的积分数
    var usePointLimit:Int?
    /// 审核状态：0->未审核；1->审核通过
    var verifyStatus:Int?
    /// 商品重量，默认为克
    var weight:Float?

}
class CartPromotionItem: SGResponseItem {
    /// 创建时间
    var createDate:String?
    /// 是否删除
    var deleteStatus:Int?
    var growth:Int?
    var id:Int?
    var integration:Int?
    var memberId:Int?
    /// 会员昵称
    var memberNickname:String?
    /// 修改时间
    var modifyDate:String?
    /// 添加到购物车的价格
    var price:Float?
    /// 商品销售属性:[{'key':'颜色','value':'颜色'},{'key':'容量','value':'4G'}]
    var productAttr:String?
    var productBrand:String?
    /// 商品分类
    var productCategoryId:Int?
    var productId:Int?
    /// 商品名称
    var productName:String?
    /// 商品主图
    var productPic:String?
    /// 商品sku条码
    var productSkuCode:String?
    var productSkuId:Int?
    var productSn:String?
    /// 商品副标题（卖点）
    var productSubTitle:String?
    var promotionMessage:String?
    /// 购买数量
    var quantity:Int?
    var realStock:Int?
    var reduceAmount:Float?

}
class CmsSubject: SGResponseItem {
    /// 画册图片用逗号分割
    var albumPics:String?
    var categoryId:Int?
    /// 专题分类名称
    var categoryName:String?
    var collectCount:Int?
    var commentCount:Int?
    var content:String?
    var createTime:String?
    var descriptionStr:String?
    /// 转发数
    var forwardCount:Int?
    var id:Int?
    /// 专题主图
    var pic:String?
    /// 关联产品数量
    var productCount:Int?
    var readCount:Int?
    var recommendStatus:Int?
    /// 显示状态：0->不显示；1->显示
    var showStatus:Int?
    var title:String?

}
class CommonPage_AgCommission: SGResponseItem {
    /// 分页数据
    var list:[AgCommission] = []
    /// 当前页码
    var pageNum:Int?
    /// 每页数量
    var pageSize:Int?
    /// 总条数
    var total:Int?
    /// 总页数
    var totalPage:Int?

}
class CommonPage_AgWithdrawal: SGResponseItem {
    /// 分页数据
    var list:[AgWithdrawal] = []
    /// 当前页码
    var pageNum:Int?
    /// 每页数量
    var pageSize:Int?
    /// 总条数
    var total:Int?
    /// 总页数
    var totalPage:Int?

}
class CommonPage_MemberBrandAttention: SGResponseItem {
    /// 分页数据
    var list:[MemberBrandAttention] = []
    /// 当前页码
    var pageNum:Int?
    /// 每页数量
    var pageSize:Int?
    /// 总条数
    var total:Int?
    /// 总页数
    var totalPage:Int?

}
class CommonPage_MemberProductCollection: SGResponseItem {
    /// 分页数据
    var list:[MemberProductCollection] = []
    /// 当前页码
    var pageNum:Int?
    /// 每页数量
    var pageSize:Int?
    /// 总条数
    var total:Int?
    /// 总页数
    var totalPage:Int?

}
class CommonPage_MemberReadHistory: SGResponseItem {
    /// 分页数据
    var list:[MemberReadHistory] = []
    /// 当前页码
    var pageNum:Int?
    /// 每页数量
    var pageSize:Int?
    /// 总条数
    var total:Int?
    /// 总页数
    var totalPage:Int?

}
class CommonPage_OmsOrderDetail: SGResponseItem {
    /// 分页数据
    var list:[OmsOrderDetail] = []
    /// 当前页码
    var pageNum:Int?
    /// 每页数量
    var pageSize:Int?
    /// 总条数
    var total:Int?
    /// 总页数
    var totalPage:Int?

}
class CommonPage_PmsProduct: SGResponseItem {
    /// 分页数据
    var list:[PmsProduct] = []
    /// 当前页码
    var pageNum:Int?
    /// 每页数量
    var pageSize:Int?
    /// 总条数
    var total:Int?
    /// 总页数
    var totalPage:Int?

}
class CommonPage_object: SGResponseItem {
    /// 分页数据
    var list:[Any] = []
    /// 当前页码
    var pageNum:Int?
    /// 每页数量
    var pageSize:Int?
    /// 总条数
    var total:Int?
    /// 总页数
    var totalPage:Int?

}
class CommonResult: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:Any?
    /// 提示信息
    var message:String?

}
class CommonResult_CartProduct: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:CartProduct?
    /// 提示信息
    var message:String?

}
class CommonResult_CommonPage_AgCommission: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:AgCommission?
    /// 提示信息
    var message:String?

}
class CommonResult_CommonPage_AgWithdrawal: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:AgWithdrawal?
    /// 提示信息
    var message:String?

}
class CommonResult_CommonPage_MemberBrandAttention: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:MemberBrandAttention?
    /// 提示信息
    var message:String?

}
class CommonResult_CommonPage_MemberProductCollection: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:MemberProductCollection?
    /// 提示信息
    var message:String?

}
class CommonResult_CommonPage_MemberReadHistory: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:MemberReadHistory?
    /// 提示信息
    var message:String?

}
class CommonResult_CommonPage_OmsOrderDetail: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:OmsOrderDetail?
    /// 提示信息
    var message:String?

}
class CommonResult_CommonPage_PmsProduct: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:PmsProduct?
    /// 提示信息
    var message:String?

}
class CommonResult_CommonPage_object: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:Any?
    /// 提示信息
    var message:String?

}
class CommonResult_ConfirmOrderResult: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:ConfirmOrderResult?
    /// 提示信息
    var message:String?

}
class CommonResult_HomeContentResult: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:HomeContentResult?
    /// 提示信息
    var message:String?

}
class CommonResult_List_CartPromotionItem: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[CartPromotionItem] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_CmsSubject: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[CmsSubject] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_OmsCartItem: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[OmsCartItem] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_PmsBrand: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[PmsBrand] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_PmsProductCategoryNode: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[PmsProductCategoryNode] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_PmsProductCategory: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[PmsProductCategory] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_PmsProduct: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[PmsProduct] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_SmsCouponHistoryDetail: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[SmsCouponHistoryDetail] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_SmsCouponHistory: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[SmsCouponHistory] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_SmsCoupon: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[SmsCoupon] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_UmsMemberLevel: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[UmsMemberLevel] = []
    /// 提示信息
    var message:String?

}
class CommonResult_List_UmsMemberReceiveAddress: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:[UmsMemberReceiveAddress] = []
    /// 提示信息
    var message:String?

}
class CommonResult_MemberBrandAttention: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:MemberBrandAttention?
    /// 提示信息
    var message:String?

}
class CommonResult_MemberProductCollection: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:MemberProductCollection?
    /// 提示信息
    var message:String?

}
class CommonResult_OmsOrderDetail: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:OmsOrderDetail?
    /// 提示信息
    var message:String?

}
class CommonResult_PmsBrand: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:PmsBrand?
    /// 提示信息
    var message:String?

}
class CommonResult_PmsPortalProductDetail: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:PmsPortalProductDetail?
    /// 提示信息
    var message:String?

}
class CommonResult_UmsMemberReceiveAddress: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:UmsMemberReceiveAddress?
    /// 提示信息
    var message:String?

}
class CommonResult_UmsMember: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:UmsMember?
    /// 提示信息
    var message:String?

}
class CommonResult_object: SGResponseItem {
    /// 状态码
    var code:Int?
    var data:Any?
    /// 提示信息
    var message:String?

}
class ConfirmOrderResult: SGResponseItem {
    var calcAmount:CalcAmount?
    var cartPromotionItemList:[CartPromotionItem] = []
    var couponHistoryDetailList:[SmsCouponHistoryDetail] = []
    var integrationConsumeSetting:UmsIntegrationConsumeSetting?
    var memberIntegration:Int?
    var memberReceiveAddressList:[UmsMemberReceiveAddress] = []

}
class FlashPromotionProduct: SGResponseItem {
    /// 画册图片，连产品图片限制为5张，以逗号分割
    var albumPics:String?
    var brandId:Int?
    /// 品牌名称
    var brandName:String?
    /// 删除状态：0->未删除；1->已删除
    var deleteStatus:Int?
    /// 商品描述
    var descriptionStr:String?
    var detailDesc:String?
    /// 产品详情网页内容
    var detailHtml:String?
    /// 移动端网页详情
    var detailMobileHtml:String?
    var detailTitle:String?
    /// 折扣金额（可抵扣）
    var discountAmount:Float?
    var feightTemplateId:Int?
    var flashPromotionCount:Int?
    var flashPromotionLimit:Int?
    var flashPromotionPrice:Float?
    /// 赠送的成长值
    var giftGrowth:Int?
    /// 赠送的积分
    var giftPoint:Int?
    var id:Int?
    var keywords:String?
    /// 库存预警值
    var lowStock:Int?
    var name:String?
    /// 新品状态:0->不是新品；1->新品
    var newStatus:Int?
    var note:String?
    /// 市场价
    var originalPrice:Float?
    var pic:String?
    /// 是否为预告商品：0->不是；1->是
    var previewStatus:Int?
    var price:Float?
    var productAttributeCategoryId:Int?
    var productCategoryId:Int?
    /// 商品分类名称
    var productCategoryName:String?
    /// 货号
    var productSn:String?
    /// 促销结束时间
    var promotionEndTime:String?
    /// 活动限购数量
    var promotionPerLimit:Int?
    /// 促销价格
    var promotionPrice:Float?
    /// 促销开始时间
    var promotionStartTime:String?
    /// 促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购
    var promotionType:Int?
    /// 上架状态：0->下架；1->上架
    var publishStatus:Int?
    /// 推荐状态；0->不推荐；1->推荐
    var recommandStatus:Int?
    /// 销量
    var sale:Int?
    /// 以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮
    var serviceIds:String?
    /// 排序
    var sort:Int?
    /// 库存
    var stock:Int?
    /// 副标题
    var subTitle:String?
    /// 单位
    var unit:String?
    /// 限制使用的积分数
    var usePointLimit:Int?
    /// 审核状态：0->未审核；1->审核通过
    var verifyStatus:Int?
    /// 商品重量，默认为克
    var weight:Float?

}
class HomeContentResult: SGResponseItem {
    var advertiseList:[SmsHomeAdvertise] = []
    var brandList:[PmsBrand] = []
    var homeFlashPromotion:HomeFlashPromotion?
    var hotProductList:[PmsProduct] = []
    var newProductList:[PmsProduct] = []
    var subjectList:[CmsSubject] = []

}
class HomeFlashPromotion: SGResponseItem {
    var endTime:String?
    var nextEndTime:String?
    var nextStartTime:String?
    var productList:[FlashPromotionProduct] = []
    var startTime:String?

}
class MemberBrandAttention: SGResponseItem {
    var brandCity:String?
    var brandId:Int?
    var brandLogo:String?
    var brandName:String?
    var createTime:String?
    var id:String?
    var memberIcon:String?
    var memberId:Int?
    var memberNickname:String?

}
class MemberProductCollection: SGResponseItem {
    var createTime:String?
    var id:String?
    var memberIcon:String?
    var memberId:Int?
    var memberNickname:String?
    var productId:Int?
    var productName:String?
    var productPic:String?
    var productPrice:String?
    var productSubTitle:String?

}
class MemberReadHistory: SGResponseItem {
    var createTime:String?
    var id:String?
    var memberIcon:String?
    var memberId:Int?
    var memberNickname:String?
    var productId:Int?
    var productName:String?
    var productPic:String?
    var productPrice:String?
    var productSubTitle:String?

}
class OmsCartItem: SGResponseItem {
    /// 创建时间
    var createDate:String?
    /// 是否删除
    var deleteStatus:Int?
    var id:Int?
    var memberId:Int?
    /// 会员昵称
    var memberNickname:String?
    /// 修改时间
    var modifyDate:String?
    /// 添加到购物车的价格
    var price:Float?
    /// 商品销售属性:[{'key':'颜色','value':'颜色'},{'key':'容量','value':'4G'}]
    var productAttr:String?
    var productBrand:String?
    /// 商品分类
    var productCategoryId:Int?
    var productId:Int?
    /// 商品名称
    var productName:String?
    /// 商品主图
    var productPic:String?
    /// 商品sku条码
    var productSkuCode:String?
    var productSkuId:Int?
    var productSn:String?
    /// 商品副标题（卖点）
    var productSubTitle:String?
    /// 购买数量
    var quantity:Int?

}
class OmsOrderDetail: SGResponseItem {
    /// 自动确认时间（天）
    var autoConfirmDay:Int?
    /// 发票内容
    var billContent:String?
    /// 发票抬头
    var billHeader:String?
    /// 收票人邮箱
    var billReceiverEmail:String?
    /// 收票人电话
    var billReceiverPhone:String?
    /// 发票类型：0->不开发票；1->电子发票；2->纸质发票
    var billType:Int?
    /// 评价时间
    var commentTime:String?
    /// 确认收货状态：0->未确认；1->已确认
    var confirmStatus:Int?
    /// 优惠券抵扣金额
    var couponAmount:Float?
    var couponId:Int?
    /// 提交时间
    var createTime:String?
    /// 删除状态：0->未删除；1->已删除
    var deleteStatus:Int?
    /// 物流公司(配送方式)
    var deliveryCompany:String?
    /// 物流单号
    var deliverySn:String?
    /// 发货时间
    var deliveryTime:String?
    /// 管理员后台调整订单使用的折扣金额
    var discountAmount:Float?
    /// 运费金额
    var freightAmount:Float?
    /// 可以活动的成长值
    var growth:Int?
    /// 订单id
    var id:Int?
    /// 可以获得的积分
    var integration:Int?
    /// 积分抵扣金额
    var integrationAmount:Float?
    var memberId:Int?
    /// 用户帐号
    var memberUsername:String?
    /// 修改时间
    var modifyTime:String?
    /// 订单备注
    var note:String?
    var orderItemList:[OmsOrderItem] = []
    /// 订单编号
    var orderSn:String?
    /// 订单类型：0->正常订单；1->秒杀订单
    var orderType:Int?
    /// 应付金额（实际支付金额）
    var payAmount:Float?
    /// 支付方式：0->未支付；1->支付宝；2->微信
    var payType:Int?
    /// 支付时间
    var paymentTime:String?
    /// 促销优化金额（促销价、满减、阶梯价）
    var promotionAmount:Float?
    /// 活动信息
    var promotionInfo:String?
    /// 确认收货时间
    var receiveTime:String?
    /// 城市
    var receiverCity:String?
    /// 详细地址
    var receiverDetailAddress:String?
    /// 收货人姓名
    var receiverName:String?
    /// 收货人电话
    var receiverPhone:String?
    /// 收货人邮编
    var receiverPostCode:String?
    /// 省份/直辖市
    var receiverProvince:String?
    /// 区
    var receiverRegion:String?
    /// 订单来源：0->PC订单；1->app订单
    var sourceType:Int?
    /// 订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单
    var status:Int?
    /// 订单总金额
    var totalAmount:Float?
    /// 下单时使用的积分
    var useIntegration:Int?

}
class OmsOrderItem: SGResponseItem {
    /// 优惠券优惠分解金额
    var couponAmount:Float?
    var giftGrowth:Int?
    var giftIntegration:Int?
    var id:Int?
    /// 积分优惠分解金额
    var integrationAmount:Float?
    /// 订单id
    var orderId:Int?
    /// 订单编号
    var orderSn:String?
    /// 商品销售属性:[{'key':'颜色','value':'颜色'},{'key':'容量','value':'4G'}]
    var productAttr:String?
    var productBrand:String?
    /// 商品分类id
    var productCategoryId:Int?
    var productId:Int?
    var productName:String?
    var productPic:String?
    /// 销售价格
    var productPrice:Float?
    /// 购买数量
    var productQuantity:Int?
    /// 商品sku条码
    var productSkuCode:String?
    /// 商品sku编号
    var productSkuId:Int?
    var productSn:String?
    /// 商品促销分解金额
    var promotionAmount:Float?
    /// 商品促销名称
    var promotionName:String?
    /// 该商品经过优惠后的分解金额
    var realAmount:Float?

}
class OmsOrderReturnApplyParam: SGResponseItem {
    /// 描述
    var descriptionStr:String?
    /// 会员用户名
    var memberUsername:String?
    /// 订单id
    var orderId:Int?
    /// 订单编号
    var orderSn:String?
    /// 商品销售属性：颜色：红色；尺码：xl;
    var productAttr:String?
    /// 商品品牌
    var productBrand:String?
    /// 退货数量
    var productCount:Int?
    /// 退货商品id
    var productId:Int?
    /// 商品名称
    var productName:String?
    /// 商品图片
    var productPic:String?
    /// 商品单价
    var productPrice:Float?
    /// 商品实际支付单价
    var productRealPrice:Float?
    /// 凭证图片，以逗号隔开
    var proofPics:String?
    /// 原因
    var reason:String?
    /// 退货人姓名
    var returnName:String?
    /// 退货人电话
    var returnPhone:String?

}
class OrderParam: SGResponseItem {
    /// 被选中的购物车商品ID
    var cartIds:[Any] = []
    /// 优惠券ID
    var couponId:Int?
    /// 收货地址ID
    var memberReceiveAddressId:Int?
    /// 支付方式
    var payType:Int?
    /// 使用的积分数
    var useIntegration:Int?

}
class PmsBrand: SGResponseItem {
    /// 专区大图
    var bigPic:String?
    /// 品牌故事
    var brandStory:String?
    /// 是否为品牌制造商：0->不是；1->是
    var factoryStatus:Int?
    /// 首字母
    var firstLetter:String?
    var id:Int?
    /// 品牌logo
    var logo:String?
    var name:String?
    /// 产品评论数量
    var productCommentCount:Int?
    /// 产品数量
    var productCount:Int?
    var showStatus:Int?
    var sort:Int?

}
class PmsPortalProductDetail: SGResponseItem {
    /// 商品品牌
    var brand:PmsBrand?
    /// 商品可用优惠券
    var couponList:[SmsCoupon] = []
    /// 商品信息
    var product:PmsProduct?
    /// 商品属性与参数
    var productAttributeList:[PmsProductAttribute] = []
    /// 手动录入的商品属性与参数值
    var productAttributeValueList:[PmsProductAttributeValue] = []
    /// 商品满减价格设置
    var productFullReductionList:[PmsProductFullReduction] = []
    /// 商品阶梯价格设置
    var productLadderList:[PmsProductLadder] = []
    /// 商品的sku库存信息
    var skuStockList:[PmsSkuStock] = []

}
class PmsProduct: SGResponseItem {
    /// 画册图片，连产品图片限制为5张，以逗号分割
    var albumPics:String?
    var brandId:Int?
    /// 品牌名称
    var brandName:String?
    /// 删除状态：0->未删除；1->已删除
    var deleteStatus:Int?
    /// 商品描述
    var descriptionStr:String?
    var detailDesc:String?
    /// 产品详情网页内容
    var detailHtml:String?
    /// 移动端网页详情
    var detailMobileHtml:String?
    var detailTitle:String?
    /// 折扣金额（可抵扣）
    var discountAmount:Float?
    var feightTemplateId:Int?
    /// 赠送的成长值
    var giftGrowth:Int?
    /// 赠送的积分
    var giftPoint:Int?
    var id:Int?
    var keywords:String?
    /// 库存预警值
    var lowStock:Int?
    var name:String?
    /// 新品状态:0->不是新品；1->新品
    var newStatus:Int?
    var note:String?
    /// 市场价
    var originalPrice:Float?
    var pic:String?
    /// 是否为预告商品：0->不是；1->是
    var previewStatus:Int?
    var price:Float?
    var productAttributeCategoryId:Int?
    var productCategoryId:Int?
    /// 商品分类名称
    var productCategoryName:String?
    /// 货号
    var productSn:String?
    /// 促销结束时间
    var promotionEndTime:String?
    /// 活动限购数量
    var promotionPerLimit:Int?
    /// 促销价格
    var promotionPrice:Float?
    /// 促销开始时间
    var promotionStartTime:String?
    /// 促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购
    var promotionType:Int?
    /// 上架状态：0->下架；1->上架
    var publishStatus:Int?
    /// 推荐状态；0->不推荐；1->推荐
    var recommandStatus:Int?
    /// 销量
    var sale:Int?
    /// 以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮
    var serviceIds:String?
    /// 排序
    var sort:Int?
    /// 库存
    var stock:Int?
    /// 副标题
    var subTitle:String?
    /// 单位
    var unit:String?
    /// 限制使用的积分数
    var usePointLimit:Int?
    /// 审核状态：0->未审核；1->审核通过
    var verifyStatus:Int?
    /// 商品重量，默认为克
    var weight:Float?

}
class PmsProductAttribute: SGResponseItem {
    /// 分类筛选样式：1->普通；1->颜色
    var filterType:Int?
    /// 是否支持手动新增；0->不支持；1->支持
    var handAddStatus:Int?
    var id:Int?
    /// 可选值列表，以逗号隔开
    var inputList:String?
    /// 属性录入方式：0->手工录入；1->从列表中选取
    var inputType:Int?
    var name:String?
    var productAttributeCategoryId:Int?
    /// 相同属性产品是否关联；0->不关联；1->关联
    var relatedStatus:Int?
    /// 检索类型；0->不需要进行检索；1->关键字检索；2->范围检索
    var searchType:Int?
    /// 属性选择类型：0->唯一；1->单选；2->多选
    var selectType:Int?
    /// 排序字段：最高的可以单独上传图片
    var sort:Int?
    /// 属性的类型；0->规格；1->参数
    var type:Int?

}
class PmsProductAttributeValue: SGResponseItem {
    var id:Int?
    var productAttributeId:Int?
    var productId:Int?
    /// 手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开
    var value:String?

}
class PmsProductCategory: SGResponseItem {
    /// 描述
    var descriptionStr:String?
    /// 图标
    var icon:String?
    var id:Int?
    var keywords:String?
    /// 分类级别：0->1级；1->2级
    var level:Int?
    var name:String?
    /// 是否显示在导航栏：0->不显示；1->显示
    var navStatus:Int?
    /// 上机分类的编号：0表示一级分类
    var parentId:Int?
    var productCount:Int?
    var productUnit:String?
    /// 显示状态：0->不显示；1->显示
    var showStatus:Int?
    var sort:Int?

}
class PmsProductCategoryNode: SGResponseItem {
    var children:[PmsProductCategoryNode] = []
    /// 描述
    var descriptionStr:String?
    /// 图标
    var icon:String?
    var id:Int?
    var keywords:String?
    /// 分类级别：0->1级；1->2级
    var level:Int?
    var name:String?
    /// 是否显示在导航栏：0->不显示；1->显示
    var navStatus:Int?
    /// 上机分类的编号：0表示一级分类
    var parentId:Int?
    var productCount:Int?
    var productUnit:String?
    /// 显示状态：0->不显示；1->显示
    var showStatus:Int?
    var sort:Int?

}
class PmsProductFullReduction: SGResponseItem {
    var fullPrice:Float?
    var id:Int?
    var productId:Int?
    var reducePrice:Float?

}
class PmsProductLadder: SGResponseItem {
    /// 满足的商品数量
    var count:Int?
    /// 折扣
    var discount:Float?
    var id:Int?
    /// 折后价格
    var price:Float?
    var productId:Int?

}
class PmsSkuStock: SGResponseItem {
    /// 折扣金额（可抵扣）
    var discountAmount:Float?
    var id:Int?
    /// 锁定库存
    var lockStock:Int?
    /// 预警库存
    var lowStock:Int?
    /// 展示图片
    var pic:String?
    var price:Float?
    var productId:Int?
    /// 单品促销价格
    var promotionPrice:Float?
    /// 销量
    var sale:Int?
    /// sku编码
    var skuCode:String?
    /// 商品销售属性，json格式
    var spData:String?
    /// 库存
    var stock:Int?

}
class SmsCoupon: SGResponseItem {
    /// 金额
    var amount:Float?
    /// 优惠码
    var code:String?
    /// 数量
    var count:Int?
    /// 可以领取的日期
    var enableTime:String?
    var endTime:String?
    var id:Int?
    /// 可领取的会员类型：0->无限时
    var memberLevel:Int?
    /// 使用门槛；0表示无门槛
    var minPoint:Float?
    var name:String?
    /// 备注
    var note:String?
    /// 每人限领张数
    var perLimit:Int?
    /// 使用平台：0->全部；1->移动；2->PC
    var platform:Int?
    /// 发行数量
    var publishCount:Int?
    /// 领取数量
    var receiveCount:Int?
    var startTime:String?
    /// 优惠券类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券
    var type:Int?
    /// 已使用数量
    var useCount:Int?
    /// 使用类型：0->全场通用；1->指定分类；2->指定商品
    var useType:Int?

}
class SmsCouponHistory: SGResponseItem {
    var couponCode:String?
    var couponId:Int?
    var createTime:String?
    /// 获取类型：0->后台赠送；1->主动获取
    var getType:Int?
    var id:Int?
    var memberId:Int?
    /// 领取人昵称
    var memberNickname:String?
    /// 订单编号
    var orderId:Int?
    /// 订单号码
    var orderSn:String?
    /// 使用状态：0->未使用；1->已使用；2->已过期
    var useStatus:Int?
    /// 使用时间
    var useTime:String?

}
class SmsCouponHistoryDetail: SGResponseItem {
    var categoryRelationList:[SmsCouponProductCategoryRelation] = []
    var coupon:SmsCoupon?
    var couponCode:String?
    var couponId:Int?
    var createTime:String?
    /// 获取类型：0->后台赠送；1->主动获取
    var getType:Int?
    var id:Int?
    var memberId:Int?
    /// 领取人昵称
    var memberNickname:String?
    /// 订单编号
    var orderId:Int?
    /// 订单号码
    var orderSn:String?
    var productRelationList:[SmsCouponProductRelation] = []
    /// 使用状态：0->未使用；1->已使用；2->已过期
    var useStatus:Int?
    /// 使用时间
    var useTime:String?

}
class SmsCouponProductCategoryRelation: SGResponseItem {
    var couponId:Int?
    var id:Int?
    /// 父分类名称
    var parentCategoryName:String?
    var productCategoryId:Int?
    /// 产品分类名称
    var productCategoryName:String?

}
class SmsCouponProductRelation: SGResponseItem {
    var couponId:Int?
    var id:Int?
    var productId:Int?
    /// 商品名称
    var productName:String?
    /// 商品编码
    var productSn:String?

}
class SmsHomeAdvertise: SGResponseItem {
    /// 点击数
    var clickCount:Int?
    var endTime:String?
    var id:Int?
    var name:String?
    /// 备注
    var note:String?
    /// 下单数
    var orderCount:Int?
    var pic:String?
    /// 排序
    var sort:Int?
    var startTime:String?
    /// 上下线状态：0->下线；1->上线
    var status:Int?
    /// 轮播位置：0->PC首页轮播；1->app首页轮播
    var type:Int?
    /// 链接地址
    var url:String?

}
class UmsIntegrationConsumeSetting: SGResponseItem {
    /// 是否可以和优惠券同用；0->不可以；1->可以
    var couponStatus:Int?
    /// 每一元需要抵扣的积分数量
    var deductionPerAmount:Int?
    var id:Int?
    /// 每笔订单最高抵用百分比
    var maxPercentPerOrder:Int?
    /// 每次使用积分最小单位100
    var useUnit:Int?

}
class UmsMember: SGResponseItem {
    /// 生日
    var birthday:String?
    /// 所做城市
    var city:String?
    /// 佣金余额
    var commissionBalance:Float?
    /// 注册时间
    var createTime:String?
    /// 消费券
    var discountBalance:Float?
    /// 性别：0->未知；1->男；2->女
    var gender:Int?
    /// 成长值
    var growth:Int?
    /// 历史积分数量
    var historyIntegration:Int?
    /// 头像
    var icon:String?
    var id:Int?
    /// 积分
    var integration:Int?
    /// 职业
    var job:String?
    /// 剩余抽奖次数
    var luckeyCount:Int?
    var memberLevelId:Int?
    /// 昵称
    var nickname:String?
    /// 密码
    var password:String?
    /// 个性签名
    var personalizedSignature:String?
    /// 手机号码
    var phone:String?
    /// 邀请码
    var shareCode:String?
    /// 用户来源
    var sourceType:Int?
    /// 帐号启用状态:0->禁用；1->启用
    var status:Int?
    /// 上级会员ID
    var uplineMemberId:Int?
    /// 用户名
    var username:String?

}
class UmsMemberLevel: SGResponseItem {
    /// 每次评价获取的成长值
    var commentGrowthPoint:Int?
    /// 是否为默认等级：0->不是；1->是
    var defaultStatus:Int?
    /// 消费券金额
    var discountAmount:Float?
    /// 消费券佣金
    var discountCommissionRate:Float?
    /// 免运费标准
    var freeFreightPoint:Float?
    var growthPoint:Int?
    var id:Int?
    var name:String?
    var note:String?
    /// 是否有生日特权
    var priviledgeBirthday:Int?
    /// 是否有评论获奖励特权
    var priviledgeComment:Int?
    /// 是否有免邮特权
    var priviledgeFreeFreight:Int?
    /// 是否有会员价格特权
    var priviledgeMemberPrice:Int?
    /// 是否有专享活动特权
    var priviledgePromotion:Int?
    /// 是否有签到特权
    var priviledgeSignIn:Int?
    /// 产品佣金
    var productCommissionRate:Float?

}
class UmsMemberReceiveAddress: SGResponseItem {
    /// 城市
    var city:String?
    /// 是否为默认
    var defaultStatus:Int?
    /// 详细地址(街道)
    var detailAddress:String?
    var id:Int?
    var memberId:Int?
    /// 收货人名称
    var name:String?
    var phoneNumber:String?
    /// 邮政编码
    var postCode:String?
    /// 省份/直辖市
    var province:String?
    /// 区
    var region:String?

}
