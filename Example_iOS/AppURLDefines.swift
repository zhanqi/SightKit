//
//  AppURLDefines.swift
//
//
//  Created by SwaggerGenerator on 2021-03-06 10:00:52.997
//


import Foundation
import SightKit


/** 参数处理方式（where to put the parameter
 ## 使用示例
 ```
 path, e.g. /users/{id};
 query, e.g. /users?role=admin;
 header, e.g. X-MyHeader: Value;
 cookie, e.g. Cookie: debug=0;
*/
public enum SGParamPosition : Int {
    case inBody = 0,inQuery,inPath,inHeader
}

public struct SGParamItem{
    public var name:String = ""
    public var typeStr:String = "String"
    public var paramPosition:SGParamPosition = .inBody
    public var isRequired = false
    public var value:Any? = nil
}

public protocol SGCommonUrlProtocol {
    var url:String { get set }
    var method:String { get set }
    var paramMap:[String:SGParamItem] { get set }
}

public class SGResponseItem: NSObject {
    public enum CodingKeys: String, CodingKey {
        case description_str = "description"
    }
}

public var hostUrl = "http://47.115.54.215:8085"

// MARK: - UrlItems

public struct SGUrl {

    /** 按状态分页获取用户佣金列表  (代理板块)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:5 pageSize
    status:Int status
    */
    public class agent_commission_list_get:SGCommonUrlProtocol {
        public var url = "/agent/commission/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "status":SGParamItem(name: "status", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /// 获取团油h5首页  (代理板块)
    public class agent_czb365_post:SGCommonUrlProtocol {
        public var url = "/agent/czb365"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 购买礼包，成功后返回订单ID  (代理板块)
    ## 参数说明
    ```
    giftOrderParam: required giftOrderParam
    */
    public class agent_gift_buy_post:SGCommonUrlProtocol {
        public var url = "/agent/gift/buy"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "giftOrderParam":SGParamItem(name: "giftOrderParam", typeStr: "AgGiftOrderParam", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /** 获取礼包列表  (代理板块)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:5 pageSize
    */
    public class agent_gift_list_get:SGCommonUrlProtocol {
        public var url = "/agent/gift/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 帮扶列表  (代理板块)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:5 pageSize
    */
    public class agent_helping_list_get:SGCommonUrlProtocol {
        public var url = "/agent/helping/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /// 获取会员等级信息  (代理板块)
    public class agent_level_list_get:SGCommonUrlProtocol {
        public var url = "/agent/level/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 获取下线会员列表  (代理板块)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:5 pageSize
    */
    public class agent_subline_member_list_get:SGCommonUrlProtocol {
        public var url = "/agent/subline/member/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /// 获取团队人数  (代理板块)
    public class agent_team_cnt_post:SGCommonUrlProtocol {
        public var url = "/agent/team/cnt"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 提现申请  (代理板块)
    ## 参数说明
    ```
    withdrawalApplyParam: required withdrawalApplyParam
    */
    public class agent_withdrawal_apply_post:SGCommonUrlProtocol {
        public var url = "/agent/withdrawal/apply"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "withdrawalApplyParam":SGParamItem(name: "withdrawalApplyParam", typeStr: "AgWithdrawalApply", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /** 获取提现记录  (代理板块)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:5 pageSize
    status:Int status
    */
    public class agent_withdrawal_list_get:SGCommonUrlProtocol {
        public var url = "/agent/withdrawal/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "status":SGParamItem(name: "status", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 获取品牌详情  (前台品牌管理)
    ## 参数说明
    ```
    brandId:Int required brandId
    */
    public class brand_detail_brandId_get:SGCommonUrlProtocol {
        public var url = "/brand/detail/{brandId}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "brandId":SGParamItem(name: "brandId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 分页获取品牌相关商品  (前台品牌管理)
    ## 参数说明
    ```
    brandId:Int required brandId
    pageNum:Int default:1 pageNum
    pageSize:Int default:6 pageSize
    */
    public class brand_productList_get:SGCommonUrlProtocol {
        public var url = "/brand/productList"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "brandId":SGParamItem(name: "brandId", typeStr: "Int", paramPosition: .inQuery, isRequired: true, value: nil),
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 分页获取推荐品牌  (前台品牌管理)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:6 pageSize
    */
    public class brand_recommendList_get:SGCommonUrlProtocol {
        public var url = "/brand/recommendList"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /// 支付宝支付回调  (回调模块)
    public class callback_alipay_delete:SGCommonUrlProtocol {
        public var url = "/callback/alipay"
        public var method = "delete"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /// 支付宝支付回调  (回调模块)
    public class callback_alipay_get:SGCommonUrlProtocol {
        public var url = "/callback/alipay"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /// 支付宝支付回调  (回调模块)
    public class callback_alipay_head:SGCommonUrlProtocol {
        public var url = "/callback/alipay"
        public var method = "head"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /// 支付宝支付回调  (回调模块)
    public class callback_alipay_options:SGCommonUrlProtocol {
        public var url = "/callback/alipay"
        public var method = "options"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /// 支付宝支付回调  (回调模块)
    public class callback_alipay_patch:SGCommonUrlProtocol {
        public var url = "/callback/alipay"
        public var method = "patch"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /// 支付宝支付回调  (回调模块)
    public class callback_alipay_post:SGCommonUrlProtocol {
        public var url = "/callback/alipay"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /// 支付宝支付回调  (回调模块)
    public class callback_alipay_put:SGCommonUrlProtocol {
        public var url = "/callback/alipay"
        public var method = "put"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** alipayCallback  (回调模块)
    ## 参数说明
    ```
    key:String key
    tradeNo:String tradeNo
    */
    public class callback_test_paySuccess_delete:SGCommonUrlProtocol {
        public var url = "/callback/test/paySuccess"
        public var method = "delete"
        public var paramMap:[String:SGParamItem] = [
            "key":SGParamItem(name: "key", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "tradeNo":SGParamItem(name: "tradeNo", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** alipayCallback  (回调模块)
    ## 参数说明
    ```
    key:String key
    tradeNo:String tradeNo
    */
    public class callback_test_paySuccess_get:SGCommonUrlProtocol {
        public var url = "/callback/test/paySuccess"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "key":SGParamItem(name: "key", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "tradeNo":SGParamItem(name: "tradeNo", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** alipayCallback  (回调模块)
    ## 参数说明
    ```
    key:String key
    tradeNo:String tradeNo
    */
    public class callback_test_paySuccess_head:SGCommonUrlProtocol {
        public var url = "/callback/test/paySuccess"
        public var method = "head"
        public var paramMap:[String:SGParamItem] = [
            "key":SGParamItem(name: "key", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "tradeNo":SGParamItem(name: "tradeNo", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** alipayCallback  (回调模块)
    ## 参数说明
    ```
    key:String key
    tradeNo:String tradeNo
    */
    public class callback_test_paySuccess_options:SGCommonUrlProtocol {
        public var url = "/callback/test/paySuccess"
        public var method = "options"
        public var paramMap:[String:SGParamItem] = [
            "key":SGParamItem(name: "key", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "tradeNo":SGParamItem(name: "tradeNo", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** alipayCallback  (回调模块)
    ## 参数说明
    ```
    key:String key
    tradeNo:String tradeNo
    */
    public class callback_test_paySuccess_patch:SGCommonUrlProtocol {
        public var url = "/callback/test/paySuccess"
        public var method = "patch"
        public var paramMap:[String:SGParamItem] = [
            "key":SGParamItem(name: "key", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "tradeNo":SGParamItem(name: "tradeNo", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** alipayCallback  (回调模块)
    ## 参数说明
    ```
    key:String key
    tradeNo:String tradeNo
    */
    public class callback_test_paySuccess_post:SGCommonUrlProtocol {
        public var url = "/callback/test/paySuccess"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "key":SGParamItem(name: "key", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "tradeNo":SGParamItem(name: "tradeNo", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** alipayCallback  (回调模块)
    ## 参数说明
    ```
    key:String key
    tradeNo:String tradeNo
    */
    public class callback_test_paySuccess_put:SGCommonUrlProtocol {
        public var url = "/callback/test/paySuccess"
        public var method = "put"
        public var paramMap:[String:SGParamItem] = [
            "key":SGParamItem(name: "key", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "tradeNo":SGParamItem(name: "tradeNo", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 添加商品到购物车  (购物车管理)
    ## 参数说明
    ```
    cartItem: required cartItem
    */
    public class cart_add_post:SGCommonUrlProtocol {
        public var url = "/cart/add"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "cartItem":SGParamItem(name: "cartItem", typeStr: "OmsCartItem", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /// 清空购物车  (购物车管理)
    public class cart_clear_post:SGCommonUrlProtocol {
        public var url = "/cart/clear"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 删除购物车中的某个商品  (购物车管理)
    ## 参数说明
    ```
    ids:Array required ids
    */
    public class cart_delete_post:SGCommonUrlProtocol {
        public var url = "/cart/delete"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "ids":SGParamItem(name: "ids", typeStr: "[Int]", paramPosition: .inQuery, isRequired: true, value: nil),
        ]
    }

    /** 获取购物车中某个商品的规格,用于重选规格  (购物车管理)
    ## 参数说明
    ```
    productId:Int required productId
    */
    public class cart_getProduct_productId_get:SGCommonUrlProtocol {
        public var url = "/cart/getProduct/{productId}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "productId":SGParamItem(name: "productId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /// 获取某个会员的购物车列表  (购物车管理)
    public class cart_list_get:SGCommonUrlProtocol {
        public var url = "/cart/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 获取某个会员的购物车列表,包括促销信息  (购物车管理)
    ## 参数说明
    ```
    cartIds:Array cartIds
    */
    public class cart_list_promotion_get:SGCommonUrlProtocol {
        public var url = "/cart/list/promotion"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "cartIds":SGParamItem(name: "cartIds", typeStr: "[Int]", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 修改购物车中商品的规格  (购物车管理)
    ## 参数说明
    ```
    cartItem: required cartItem
    */
    public class cart_update_attr_post:SGCommonUrlProtocol {
        public var url = "/cart/update/attr"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "cartItem":SGParamItem(name: "cartItem", typeStr: "OmsCartItem", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /** 修改购物车中某个商品的数量  (购物车管理)
    ## 参数说明
    ```
    id:Int required id
    quantity:Int required quantity
    */
    public class cart_update_quantity_get:SGCommonUrlProtocol {
        public var url = "/cart/update/quantity"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "id":SGParamItem(name: "id", typeStr: "Int", paramPosition: .inQuery, isRequired: true, value: nil),
            "quantity":SGParamItem(name: "quantity", typeStr: "Int", paramPosition: .inQuery, isRequired: true, value: nil),
        ]
    }

    /// 首页内容页信息展示  (首页内容管理)
    public class home_content_get:SGCommonUrlProtocol {
        public var url = "/home/content"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 分页获取人气推荐商品  (首页内容管理)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:6 pageSize
    */
    public class home_hotProductList_get:SGCommonUrlProtocol {
        public var url = "/home/hotProductList"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 分页获取新品推荐商品  (首页内容管理)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:6 pageSize
    */
    public class home_newProductList_get:SGCommonUrlProtocol {
        public var url = "/home/newProductList"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 获取首页商品分类  (首页内容管理)
    ## 参数说明
    ```
    parentId:Int required parentId
    */
    public class home_productCateList_parentId_get:SGCommonUrlProtocol {
        public var url = "/home/productCateList/{parentId}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "parentId":SGParamItem(name: "parentId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 分页获取推荐商品  (首页内容管理)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:4 pageSize
    */
    public class home_recommendProductList_get:SGCommonUrlProtocol {
        public var url = "/home/recommendProductList"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** index  (首页内容管理)
    ## 参数说明
    ```
    code:String code
    */
    public class home_share_get:SGCommonUrlProtocol {
        public var url = "/home/share"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "code":SGParamItem(name: "code", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 根据分类获取专题  (首页内容管理)
    ## 参数说明
    ```
    cateId:Int cateId
    pageNum:Int default:1 pageNum
    pageSize:Int default:4 pageSize
    */
    public class home_subjectList_get:SGCommonUrlProtocol {
        public var url = "/home/subjectList"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "cateId":SGParamItem(name: "cateId", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 版本检测  (首页内容管理)
    ## 参数说明
    ```
    platform:Int default:1 platform
    version:Int default:1 version
    */
    public class home_version_check_get:SGCommonUrlProtocol {
        public var url = "/home/version/check"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "platform":SGParamItem(name: "platform", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "version":SGParamItem(name: "version", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 添加收货地址  (会员收货地址管理)
    ## 参数说明
    ```
    address: required address
    */
    public class member_address_add_post:SGCommonUrlProtocol {
        public var url = "/member/address/add"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "address":SGParamItem(name: "address", typeStr: "UmsMemberReceiveAddress", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /** 删除收货地址  (会员收货地址管理)
    ## 参数说明
    ```
    id:Int required id
    */
    public class member_address_delete_id_post:SGCommonUrlProtocol {
        public var url = "/member/address/delete/{id}"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "id":SGParamItem(name: "id", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /// 显示所有收货地址  (会员收货地址管理)
    public class member_address_list_get:SGCommonUrlProtocol {
        public var url = "/member/address/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 修改收货地址  (会员收货地址管理)
    ## 参数说明
    ```
    address: required address
    id:Int required id
    */
    public class member_address_update_id_post:SGCommonUrlProtocol {
        public var url = "/member/address/update/{id}"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "address":SGParamItem(name: "address", typeStr: "UmsMemberReceiveAddress", paramPosition: .inBody, isRequired: true, value: nil),
            "id":SGParamItem(name: "id", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 获取收货地址详情  (会员收货地址管理)
    ## 参数说明
    ```
    id:Int required id
    */
    public class member_address_id_get:SGCommonUrlProtocol {
        public var url = "/member/address/{id}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "id":SGParamItem(name: "id", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 添加品牌关注  (会员关注品牌管理)
    ## 参数说明
    ```
    memberBrandAttention: required memberBrandAttention
    */
    public class member_attention_add_post:SGCommonUrlProtocol {
        public var url = "/member/attention/add"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "memberBrandAttention":SGParamItem(name: "memberBrandAttention", typeStr: "MemberBrandAttention", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /// 清空关注列表  (会员关注品牌管理)
    public class member_attention_clear_post:SGCommonUrlProtocol {
        public var url = "/member/attention/clear"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 取消关注  (会员关注品牌管理)
    ## 参数说明
    ```
    brandId:Int brandId
    */
    public class member_attention_delete_post:SGCommonUrlProtocol {
        public var url = "/member/attention/delete"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "brandId":SGParamItem(name: "brandId", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 显示关注品牌详情  (会员关注品牌管理)
    ## 参数说明
    ```
    brandId:Int required brandId
    */
    public class member_attention_detail_get:SGCommonUrlProtocol {
        public var url = "/member/attention/detail"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "brandId":SGParamItem(name: "brandId", typeStr: "Int", paramPosition: .inQuery, isRequired: true, value: nil),
        ]
    }

    /** 显示关注列表  (会员关注品牌管理)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:5 pageSize
    */
    public class member_attention_list_get:SGCommonUrlProtocol {
        public var url = "/member/attention/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 领取指定优惠券  (用户优惠券管理)
    ## 参数说明
    ```
    couponId:Int required couponId
    */
    public class member_coupon_add_couponId_post:SGCommonUrlProtocol {
        public var url = "/member/coupon/add/{couponId}"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "couponId":SGParamItem(name: "couponId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 获取用户优惠券列表  (用户优惠券管理)
    ## 参数说明
    ```
    useStatus:ref 优惠券筛选类型:0->未使用；1->已使用；2->已过期
    */
    public class member_coupon_list_get:SGCommonUrlProtocol {
        public var url = "/member/coupon/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "useStatus":SGParamItem(name: "useStatus", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 获取登录会员购物车的相关优惠券  (用户优惠券管理)
    ## 参数说明
    ```
    type:ref 使用可用:0->不可用；1->可用
    */
    public class member_coupon_list_cart_type_get:SGCommonUrlProtocol {
        public var url = "/member/coupon/list/cart/{type}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "type":SGParamItem(name: "type", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 获取当前商品相关优惠券  (用户优惠券管理)
    ## 参数说明
    ```
    productId:Int required productId
    */
    public class member_coupon_listByProduct_productId_get:SGCommonUrlProtocol {
        public var url = "/member/coupon/listByProduct/{productId}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "productId":SGParamItem(name: "productId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 获取用户优惠券历史列表  (用户优惠券管理)
    ## 参数说明
    ```
    useStatus:ref 优惠券筛选类型:0->未使用；1->已使用；2->已过期
    */
    public class member_coupon_listHistory_get:SGCommonUrlProtocol {
        public var url = "/member/coupon/listHistory"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "useStatus":SGParamItem(name: "useStatus", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 添加商品收藏  (会员收藏管理)
    ## 参数说明
    ```
    productCollection: required productCollection
    */
    public class member_productCollection_add_post:SGCommonUrlProtocol {
        public var url = "/member/productCollection/add"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "productCollection":SGParamItem(name: "productCollection", typeStr: "MemberProductCollection", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /// 清空收藏列表  (会员收藏管理)
    public class member_productCollection_clear_post:SGCommonUrlProtocol {
        public var url = "/member/productCollection/clear"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 删除收藏商品  (会员收藏管理)
    ## 参数说明
    ```
    productId:Int productId
    */
    public class member_productCollection_delete_post:SGCommonUrlProtocol {
        public var url = "/member/productCollection/delete"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "productId":SGParamItem(name: "productId", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 显示收藏商品详情  (会员收藏管理)
    ## 参数说明
    ```
    productId:Int required productId
    */
    public class member_productCollection_detail_get:SGCommonUrlProtocol {
        public var url = "/member/productCollection/detail"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "productId":SGParamItem(name: "productId", typeStr: "Int", paramPosition: .inQuery, isRequired: true, value: nil),
        ]
    }

    /** 显示收藏列表  (会员收藏管理)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:5 pageSize
    */
    public class member_productCollection_list_get:SGCommonUrlProtocol {
        public var url = "/member/productCollection/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /// 清空除浏览记录  (会员商品浏览记录管理)
    public class member_readHistory_clear_post:SGCommonUrlProtocol {
        public var url = "/member/readHistory/clear"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 创建浏览记录  (会员商品浏览记录管理)
    ## 参数说明
    ```
    memberReadHistory: required memberReadHistory
    */
    public class member_readHistory_create_post:SGCommonUrlProtocol {
        public var url = "/member/readHistory/create"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "memberReadHistory":SGParamItem(name: "memberReadHistory", typeStr: "MemberReadHistory", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /** 删除浏览记录  (会员商品浏览记录管理)
    ## 参数说明
    ```
    ids:Array required ids
    */
    public class member_readHistory_delete_post:SGCommonUrlProtocol {
        public var url = "/member/readHistory/delete"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "ids":SGParamItem(name: "ids", typeStr: "[String]", paramPosition: .inQuery, isRequired: true, value: nil),
        ]
    }

    /** 分页获取用户浏览记录  (会员商品浏览记录管理)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:5 pageSize
    */
    public class member_readHistory_list_get:SGCommonUrlProtocol {
        public var url = "/member/readHistory/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 取消单个超时订单  (订单管理)
    ## 参数说明
    ```
    orderId:Int orderId
    */
    public class order_cancelOrder_post:SGCommonUrlProtocol {
        public var url = "/order/cancelOrder"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "orderId":SGParamItem(name: "orderId", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /// 自动取消超时订单  (订单管理)
    public class order_cancelTimeOutOrder_post:SGCommonUrlProtocol {
        public var url = "/order/cancelTimeOutOrder"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 用户取消订单  (订单管理)
    ## 参数说明
    ```
    orderId:Int orderId
    */
    public class order_cancelUserOrder_post:SGCommonUrlProtocol {
        public var url = "/order/cancelUserOrder"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "orderId":SGParamItem(name: "orderId", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 用户确认收货  (订单管理)
    ## 参数说明
    ```
    orderId:Int orderId
    */
    public class order_confirmReceiveOrder_post:SGCommonUrlProtocol {
        public var url = "/order/confirmReceiveOrder"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "orderId":SGParamItem(name: "orderId", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 用户删除订单  (订单管理)
    ## 参数说明
    ```
    orderId:Int orderId
    */
    public class order_deleteOrder_post:SGCommonUrlProtocol {
        public var url = "/order/deleteOrder"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "orderId":SGParamItem(name: "orderId", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 根据ID获取订单详情  (订单管理)
    ## 参数说明
    ```
    orderId:Int required orderId
    */
    public class order_detail_orderId_get:SGCommonUrlProtocol {
        public var url = "/order/detail/{orderId}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "orderId":SGParamItem(name: "orderId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 根据购物车信息生成确认单信息  (订单管理)
    ## 参数说明
    ```
    confirmOrderParam: required confirmOrderParam
    */
    public class order_generateConfirmOrder_post:SGCommonUrlProtocol {
        public var url = "/order/generateConfirmOrder"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "confirmOrderParam":SGParamItem(name: "confirmOrderParam", typeStr: "ConfirmOrderParam", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /** 根据购物车信息生成订单  (订单管理)
    ## 参数说明
    ```
    orderParam: required orderParam
    */
    public class order_generateOrder_post:SGCommonUrlProtocol {
        public var url = "/order/generateOrder"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "orderParam":SGParamItem(name: "orderParam", typeStr: "OrderParam", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /** 按状态分页获取用户订单列表  (订单管理)
    ## 参数说明
    ```
    pageNum:Int default:1 pageNum
    pageSize:Int default:5 pageSize
    status:Int default:-1 订单状态：-1->全部；0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭
    */
    public class order_list_get:SGCommonUrlProtocol {
        public var url = "/order/list"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "status":SGParamItem(name: "status", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 获取支付信息  (支付模块)
    ## 参数说明
    ```
    paymentParam: required paymentParam
    */
    public class payment_generatePaymentInfo_post:SGCommonUrlProtocol {
        public var url = "/payment/generatePaymentInfo"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "paymentParam":SGParamItem(name: "paymentParam", typeStr: "PaymentParam", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /// 以树形结构获取所有商品分类  (前台商品管理)
    public class product_categoryTreeList_get:SGCommonUrlProtocol {
        public var url = "/product/categoryTreeList"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 获取前台商品详情  (前台商品管理)
    ## 参数说明
    ```
    id:Int required id
    */
    public class product_detail_id_get:SGCommonUrlProtocol {
        public var url = "/product/detail/{id}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "id":SGParamItem(name: "id", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 综合搜索、筛选、排序  (前台商品管理)
    ## 参数说明
    ```
    brandId:Int brandId
    keyword:String keyword
    pageNum:Int default:0 pageNum
    pageSize:Int default:5 pageSize
    productCategoryId:Int productCategoryId
    sort:ref 排序字段:0->按相关度；1->按新品；2->按销量；3->价格从低到高；4->价格从高到低
    */
    public class product_search_get:SGCommonUrlProtocol {
        public var url = "/product/search"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "brandId":SGParamItem(name: "brandId", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "keyword":SGParamItem(name: "keyword", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageNum":SGParamItem(name: "pageNum", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "pageSize":SGParamItem(name: "pageSize", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "productCategoryId":SGParamItem(name: "productCategoryId", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
            "sort":SGParamItem(name: "sort", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 申请退货  (申请退货管理)
    ## 参数说明
    ```
    returnApply: required returnApply
    */
    public class returnApply_create_post:SGCommonUrlProtocol {
        public var url = "/returnApply/create"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "returnApply":SGParamItem(name: "returnApply", typeStr: "OmsOrderReturnApplyParam", paramPosition: .inBody, isRequired: true, value: nil),
        ]
    }

    /** 获取验证码  (会员登录注册管理)
    ## 参数说明
    ```
    telephone:String required telephone
    */
    public class sso_getAuthCode_get:SGCommonUrlProtocol {
        public var url = "/sso/getAuthCode"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "telephone":SGParamItem(name: "telephone", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
        ]
    }

    /** 获取会员信息  (会员登录注册管理)
    ## 参数说明
    ```
    name:String
    */
    public class sso_info_get:SGCommonUrlProtocol {
        public var url = "/sso/info"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "name":SGParamItem(name: "name", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 会员登录  (会员登录注册管理)
    ## 参数说明
    ```
    password:String required password
    telephone:String telephone
    username:String username
    */
    public class sso_login_post:SGCommonUrlProtocol {
        public var url = "/sso/login"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "password":SGParamItem(name: "password", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
            "telephone":SGParamItem(name: "telephone", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "username":SGParamItem(name: "username", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /// 刷新token  (会员登录注册管理)
    public class sso_refreshToken_get:SGCommonUrlProtocol {
        public var url = "/sso/refreshToken"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [:]
    }

    /** 会员注册  (会员登录注册管理)
    ## 参数说明
    ```
    authCode:String required 验证码
    password:String required 密码
    shareCode:String 分享码
    telephone:String required 手机号
    username:String required 用户名
    */
    public class sso_register_post:SGCommonUrlProtocol {
        public var url = "/sso/register"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "authCode":SGParamItem(name: "authCode", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
            "password":SGParamItem(name: "password", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
            "shareCode":SGParamItem(name: "shareCode", typeStr: "String", paramPosition: .inQuery, isRequired: false, value: nil),
            "telephone":SGParamItem(name: "telephone", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
            "username":SGParamItem(name: "username", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
        ]
    }

    /** 修改密码  (会员登录注册管理)
    ## 参数说明
    ```
    authCode:String required authCode
    password:String required password
    telephone:String required telephone
    */
    public class sso_updatePassword_post:SGCommonUrlProtocol {
        public var url = "/sso/updatePassword"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "authCode":SGParamItem(name: "authCode", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
            "password":SGParamItem(name: "password", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
            "telephone":SGParamItem(name: "telephone", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
        ]
    }

    /** 修改手机  (会员登录注册管理)
    ## 参数说明
    ```
    authCode:String required authCode
    telephone:String required telephone
    */
    public class sso_updatePhone_post:SGCommonUrlProtocol {
        public var url = "/sso/updatePhone"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "authCode":SGParamItem(name: "authCode", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
            "telephone":SGParamItem(name: "telephone", typeStr: "String", paramPosition: .inQuery, isRequired: true, value: nil),
        ]
    }

}
