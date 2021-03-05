//
//  AppURLDefines.swift
//
//
//  Created by SwaggerGenerator on 2021-03-05 13:58:58.136
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
     pageNum:Int  default:1
     pageSize:Int  default:5
     status:Int
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
     giftOrderParam:  required
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
     pageNum:Int  default:1
     pageSize:Int  default:5
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
     pageNum:Int  default:1
     pageSize:Int  default:5
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
     pageNum:Int  default:1
     pageSize:Int  default:5
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
     withdrawalApplyParam:  required
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
     pageNum:Int  default:1
     pageSize:Int  default:5
     status:Int
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
     brandId:Int  required
    */
    public class brand_detail_get:SGCommonUrlProtocol {
        public var url = "/brand/detail/{brandId}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "brandId":SGParamItem(name: "brandId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 分页获取品牌相关商品  (前台品牌管理)
    ## 参数说明
    ```
     brandId:Int  required
     pageNum:Int  default:1
     pageSize:Int  default:6
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
     pageNum:Int  default:1
     pageSize:Int  default:6
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
     key:String
     tradeNo:String
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
     key:String
     tradeNo:String
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
     key:String
     tradeNo:String
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
     key:String
     tradeNo:String
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
     key:String
     tradeNo:String
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
     key:String
     tradeNo:String
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
     key:String
     tradeNo:String
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
     cartItem:  required
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
     ids:Array  required
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
     productId:Int  required
    */
    public class cart_getProduct_get:SGCommonUrlProtocol {
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
     cartIds:Array
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
     cartItem:  required
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
     id:Int  required
     quantity:Int  required
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
     pageNum:Int  default:1
     pageSize:Int  default:6
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
     pageNum:Int  default:1
     pageSize:Int  default:6
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
     parentId:Int  required
    */
    public class home_productCateList_get:SGCommonUrlProtocol {
        public var url = "/home/productCateList/{parentId}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "parentId":SGParamItem(name: "parentId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 分页获取推荐商品  (首页内容管理)
    ## 参数说明
    ```
     pageNum:Int  default:1
     pageSize:Int  default:4
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
     code:String
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
     cateId:Int
     pageNum:Int  default:1
     pageSize:Int  default:4
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
     platform:Int  default:1
     version:Int  default:1
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
     address:  required
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
     id:Int  required
    */
    public class member_address_delete_post:SGCommonUrlProtocol {
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
     address:  required
     id:Int  required
    */
    public class member_address_update_post:SGCommonUrlProtocol {
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
     id:Int  required
    */
    public class member_address_get:SGCommonUrlProtocol {
        public var url = "/member/address/{id}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "id":SGParamItem(name: "id", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 添加品牌关注  (会员关注品牌管理)
    ## 参数说明
    ```
     memberBrandAttention:  required
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
     brandId:Int
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
     brandId:Int  required
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
     pageNum:Int  default:1
     pageSize:Int  default:5
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
     couponId:Int  required
    */
    public class member_coupon_add_post:SGCommonUrlProtocol {
        public var url = "/member/coupon/add/{couponId}"
        public var method = "post"
        public var paramMap:[String:SGParamItem] = [
            "couponId":SGParamItem(name: "couponId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 获取用户优惠券列表  (用户优惠券管理)
    ## 参数说明
    ```
     useStatus:ref
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
     type:ref  default:1
    */
    public class member_coupon_list_cart_get:SGCommonUrlProtocol {
        public var url = "/member/coupon/list/cart/{type}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "type":SGParamItem(name: "type", typeStr: "Int", paramPosition: .inQuery, isRequired: false, value: nil),
        ]
    }

    /** 获取当前商品相关优惠券  (用户优惠券管理)
    ## 参数说明
    ```
     productId:Int  required
    */
    public class member_coupon_listByProduct_get:SGCommonUrlProtocol {
        public var url = "/member/coupon/listByProduct/{productId}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "productId":SGParamItem(name: "productId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 获取用户优惠券历史列表  (用户优惠券管理)
    ## 参数说明
    ```
     useStatus:ref
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
     productCollection:  required
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
     productId:Int
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
     productId:Int  required
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
     pageNum:Int  default:1
     pageSize:Int  default:5
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
     memberReadHistory:  required
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
     ids:Array  required
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
     pageNum:Int  default:1
     pageSize:Int  default:5
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
     orderId:Int
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
     orderId:Int
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
     orderId:Int
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
     orderId:Int
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
     orderId:Int  required
    */
    public class order_detail_get:SGCommonUrlProtocol {
        public var url = "/order/detail/{orderId}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "orderId":SGParamItem(name: "orderId", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

    /** 根据购物车信息生成确认单信息  (订单管理)
    ## 参数说明
    ```
     confirmOrderParam:  required
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
     orderParam:  required
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
     pageNum:Int  default:1
     pageSize:Int  default:5
     status:Int  default:-1
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
     paymentParam:  required
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
     id:Int  required
    */
    public class product_detail_get:SGCommonUrlProtocol {
        public var url = "/product/detail/{id}"
        public var method = "get"
        public var paramMap:[String:SGParamItem] = [
            "id":SGParamItem(name: "id", typeStr: "Int", paramPosition: .inPath, isRequired: true, value: nil),
        ]
    }

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
     returnApply:  required
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
     telephone:String  required
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
     password:String  required
     telephone:String
     username:String
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
     authCode:String  required
     password:String  required
     shareCode:String
     telephone:String  required
     username:String  required
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
     authCode:String  required
     password:String  required
     telephone:String  required
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
     authCode:String  required
     telephone:String  required
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

// MARK: - Models

public class AgCommission: SGResponseItem {
    /// 佣金
    public var commission:Float?
    /// 佣金率
    public var commissionRate:Float?
    /// 创建时间
    public var createTime:String?
    /// 深度
    public var depth:Int?
    public var id:Int?
    /// 会员ID
    public var memberId:Int?
    /// 名称
    public var name:String?
    /// 订单金额
    public var orderAmount:Float?
    /// 订单会员ID
    public var orderMemberId:Int?
    /// 来源ID
    public var sourceId:String?
    /// 来源：1->订单 2->消费券
    public var sourceType:Int?
    /// 状态0:待结算 1:已结算
    public var status:Int?
    /// 0: 直推 1:团队
    public var type:Int?

    required convenience init(json:SKJSON) {
        self.init()
        commission = json["commission"].floatValue
        commissionRate = json["commissionRate"].floatValue
        createTime = json["createTime"].stringValue
        depth = json["depth"].intValue
        id = json["id"].intValue
        memberId = json["memberId"].intValue
        name = json["name"].stringValue
        orderAmount = json["orderAmount"].floatValue
        orderMemberId = json["orderMemberId"].intValue
        sourceId = json["sourceId"].stringValue
        sourceType = json["sourceType"].intValue
        status = json["status"].intValue
        type = json["type"].intValue
    }
}
public class AgGift: SGResponseItem {
    /// 画册图片，连产品图片限制为5张，以逗号分割
    public var albumPics:String?
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    /// 描述
    public var description_str:String?
    /// 移动端网页详情
    public var detailMobileHtml:String?
    /// 赠送消费券金额
    public var giftDiscountAmount:Float?
    /// ID
    public var id:Int?
    /// 名称
    public var name:String?
    /// 图片
    public var pic:String?
    /// 价格
    public var price:Float?
    /// 分润金额
    public var profit:Float?
    /// 上架状态：0->下架；1->上架
    public var publishStatus:Int?
    /// 销量
    public var sale:Int?
    /// 排序
    public var sort:Int?
    /// 副标题
    public var subTitle:String?

    required convenience init(json:SKJSON) {
        self.init()
        albumPics = json["albumPics"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        description_str = json["description_str"].stringValue
        detailMobileHtml = json["detailMobileHtml"].stringValue
        giftDiscountAmount = json["giftDiscountAmount"].floatValue
        id = json["id"].intValue
        name = json["name"].stringValue
        pic = json["pic"].stringValue
        price = json["price"].floatValue
        profit = json["profit"].floatValue
        publishStatus = json["publishStatus"].intValue
        sale = json["sale"].intValue
        sort = json["sort"].intValue
        subTitle = json["subTitle"].stringValue
    }
}
public class AgGiftOrderParam: SGResponseItem {
    /// 礼包ID
    public var giftId:Int?

    required convenience init(json:SKJSON) {
        self.init()
        giftId = json["giftId"].intValue
    }
}
public class AgHelping: SGResponseItem {
    /// 年龄
    public var age:Int?
    /// 低保/低保边缘
    public var dbby:String?
    /// 家庭住址
    public var homeAddress:String?
    /// 家庭基本情况
    public var homeInfo:String?
    public var id:Int?
    /// 身份证
    public var idCard:String?
    /// 军龄
    public var jage:Int?
    /// 街道
    public var jd:String?
    /// 困难原因
    public var knReason:String?
    /// 民族
    public var mz:String?
    public var name:String?
    /// 伤残等级
    public var scdj:String?
    /// 伤残证号
    public var sczh:String?
    /// 性别 1:男 2:女
    public var sex:Int?
    /// 所在部队
    public var ssbd:String?
    /// 联系电话
    public var tel:String?
    /// 推荐单位
    public var tjdw:String?
    /// 人员类别
    public var type:String?
    /// 退役时间
    public var tysj:String?
    /// 是否显示1:显示 0:不显示
    public var viewState:Int?
    /// 现就业状态
    public var workState:String?
    /// 学历
    public var xl:String?
    /// 政治面貌
    public var zzmm:String?

    required convenience init(json:SKJSON) {
        self.init()
        age = json["age"].intValue
        dbby = json["dbby"].stringValue
        homeAddress = json["homeAddress"].stringValue
        homeInfo = json["homeInfo"].stringValue
        id = json["id"].intValue
        idCard = json["idCard"].stringValue
        jage = json["jage"].intValue
        jd = json["jd"].stringValue
        knReason = json["knReason"].stringValue
        mz = json["mz"].stringValue
        name = json["name"].stringValue
        scdj = json["scdj"].stringValue
        sczh = json["sczh"].stringValue
        sex = json["sex"].intValue
        ssbd = json["ssbd"].stringValue
        tel = json["tel"].stringValue
        tjdw = json["tjdw"].stringValue
        type = json["type"].stringValue
        tysj = json["tysj"].stringValue
        viewState = json["viewState"].intValue
        workState = json["workState"].stringValue
        xl = json["xl"].stringValue
        zzmm = json["zzmm"].stringValue
    }
}
public class AgWithdrawal: SGResponseItem {
    /// 账号
    public var account:String?
    /// 金额
    public var amount:Float?
    /// 支行信息
    public var bankBranch:String?
    /// 银行名称
    public var bankName:String?
    /// 银行卡号
    public var bankNo:String?
    /// 创建时间
    public var createTime:String?
    /// ID
    public var id:Int?
    /// 会员ID
    public var memberId:Int?
    /// 真实姓名
    public var realName:String?
    /// 状态 0:审核中 1:已完成
    public var status:Int?
    /// 类型 1:银行卡 2:支付宝
    public var type:Int?
    /// 修改时间
    public var updateTime:String?

    required convenience init(json:SKJSON) {
        self.init()
        account = json["account"].stringValue
        amount = json["amount"].floatValue
        bankBranch = json["bankBranch"].stringValue
        bankName = json["bankName"].stringValue
        bankNo = json["bankNo"].stringValue
        createTime = json["createTime"].stringValue
        id = json["id"].intValue
        memberId = json["memberId"].intValue
        realName = json["realName"].stringValue
        status = json["status"].intValue
        type = json["type"].intValue
        updateTime = json["updateTime"].stringValue
    }
}
public class AgWithdrawalApply: SGResponseItem {
    /// 账号
    public var account:String?
    /// 金额
    public var amount:Float?
    /// 支行信息
    public var bankBranch:String?
    /// 银行名称
    public var bankName:String?
    /// 银行卡号
    public var bankNo:String?
    /// 真实姓名
    public var realName:String?
    /// 类型 1:银行卡 2:支付宝
    public var type:Int?

    required convenience init(json:SKJSON) {
        self.init()
        account = json["account"].stringValue
        amount = json["amount"].floatValue
        bankBranch = json["bankBranch"].stringValue
        bankName = json["bankName"].stringValue
        bankNo = json["bankNo"].stringValue
        realName = json["realName"].stringValue
        type = json["type"].intValue
    }
}
public class CalcAmount: SGResponseItem {
    public var discountAmount:Float?
    public var freightAmount:Float?
    public var payAmount:Float?
    public var promotionAmount:Float?
    public var totalAmount:Float?

    required convenience init(json:SKJSON) {
        self.init()
        discountAmount = json["discountAmount"].floatValue
        freightAmount = json["freightAmount"].floatValue
        payAmount = json["payAmount"].floatValue
        promotionAmount = json["promotionAmount"].floatValue
        totalAmount = json["totalAmount"].floatValue
    }
}
public class CartProduct: SGResponseItem {
    /// 画册图片，连产品图片限制为5张，以逗号分割
    public var albumPics:String?
    public var brandId:Int?
    /// 品牌名称
    public var brandName:String?
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    /// 商品描述
    public var description_str:String?
    public var detailDesc:String?
    /// 产品详情网页内容
    public var detailHtml:String?
    /// 移动端网页详情
    public var detailMobileHtml:String?
    public var detailTitle:String?
    /// 折扣金额（可抵扣）
    public var discountAmount:Float?
    public var feightTemplateId:Int?
    /// 赠送的成长值
    public var giftGrowth:Int?
    /// 赠送的积分
    public var giftPoint:Int?
    public var id:Int?
    public var keywords:String?
    /// 库存预警值
    public var lowStock:Int?
    public var name:String?
    /// 新品状态:0->不是新品；1->新品
    public var newStatus:Int?
    public var note:String?
    /// 市场价
    public var originalPrice:Float?
    public var pic:String?
    /// 是否为预告商品：0->不是；1->是
    public var previewStatus:Int?
    public var price:Float?
    public var productAttributeCategoryId:Int?
    public var productAttributeList:[PmsProductAttribute] = []
    public var productCategoryId:Int?
    /// 商品分类名称
    public var productCategoryName:String?
    /// 货号
    public var productSn:String?
    /// 促销结束时间
    public var promotionEndTime:String?
    /// 活动限购数量
    public var promotionPerLimit:Int?
    /// 促销价格
    public var promotionPrice:Float?
    /// 促销开始时间
    public var promotionStartTime:String?
    /// 促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购
    public var promotionType:Int?
    /// 上架状态：0->下架；1->上架
    public var publishStatus:Int?
    /// 推荐状态；0->不推荐；1->推荐
    public var recommandStatus:Int?
    /// 销量
    public var sale:Int?
    /// 以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮
    public var serviceIds:String?
    public var skuStockList:[PmsSkuStock] = []
    /// 排序
    public var sort:Int?
    /// 库存
    public var stock:Int?
    /// 副标题
    public var subTitle:String?
    /// 单位
    public var unit:String?
    /// 限制使用的积分数
    public var usePointLimit:Int?
    /// 审核状态：0->未审核；1->审核通过
    public var verifyStatus:Int?
    /// 商品重量，默认为克
    public var weight:Float?

    required convenience init(json:SKJSON) {
        self.init()
        albumPics = json["albumPics"].stringValue
        brandId = json["brandId"].intValue
        brandName = json["brandName"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        description_str = json["description_str"].stringValue
        detailDesc = json["detailDesc"].stringValue
        detailHtml = json["detailHtml"].stringValue
        detailMobileHtml = json["detailMobileHtml"].stringValue
        detailTitle = json["detailTitle"].stringValue
        discountAmount = json["discountAmount"].floatValue
        feightTemplateId = json["feightTemplateId"].intValue
        giftGrowth = json["giftGrowth"].intValue
        giftPoint = json["giftPoint"].intValue
        id = json["id"].intValue
        keywords = json["keywords"].stringValue
        lowStock = json["lowStock"].intValue
        name = json["name"].stringValue
        newStatus = json["newStatus"].intValue
        note = json["note"].stringValue
        originalPrice = json["originalPrice"].floatValue
        pic = json["pic"].stringValue
        previewStatus = json["previewStatus"].intValue
        price = json["price"].floatValue
        productAttributeCategoryId = json["productAttributeCategoryId"].intValue
        for value in json["productAttributeList"].arrayValue{
            productAttributeList.append(PmsProductAttribute(json: value))
        }
        productCategoryId = json["productCategoryId"].intValue
        productCategoryName = json["productCategoryName"].stringValue
        productSn = json["productSn"].stringValue
        promotionEndTime = json["promotionEndTime"].stringValue
        promotionPerLimit = json["promotionPerLimit"].intValue
        promotionPrice = json["promotionPrice"].floatValue
        promotionStartTime = json["promotionStartTime"].stringValue
        promotionType = json["promotionType"].intValue
        publishStatus = json["publishStatus"].intValue
        recommandStatus = json["recommandStatus"].intValue
        sale = json["sale"].intValue
        serviceIds = json["serviceIds"].stringValue
        for value in json["skuStockList"].arrayValue{
            skuStockList.append(PmsSkuStock(json: value))
        }
        sort = json["sort"].intValue
        stock = json["stock"].intValue
        subTitle = json["subTitle"].stringValue
        unit = json["unit"].stringValue
        usePointLimit = json["usePointLimit"].intValue
        verifyStatus = json["verifyStatus"].intValue
        weight = json["weight"].floatValue
    }
}
public class CartPromotionItem: SGResponseItem {
    /// 创建时间
    public var createDate:String?
    /// 是否删除
    public var deleteStatus:Int?
    public var discountAmount:Float?
    public var growth:Int?
    public var id:Int?
    public var integration:Int?
    public var memberId:Int?
    /// 会员昵称
    public var memberNickname:String?
    /// 修改时间
    public var modifyDate:String?
    /// 添加到购物车的价格
    public var price:Float?
    /// 商品销售属性:[{'key':'颜色','value':'颜色'},{'key':'容量','value':'4G'}]
    public var productAttr:String?
    public var productBrand:String?
    /// 商品分类
    public var productCategoryId:Int?
    public var productId:Int?
    /// 商品名称
    public var productName:String?
    /// 商品主图
    public var productPic:String?
    /// 商品sku条码
    public var productSkuCode:String?
    public var productSkuId:Int?
    public var productSn:String?
    /// 商品副标题（卖点）
    public var productSubTitle:String?
    public var promotionMessage:String?
    /// 购买数量
    public var quantity:Int?
    public var realStock:Int?
    public var reduceAmount:Float?

    required convenience init(json:SKJSON) {
        self.init()
        createDate = json["createDate"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        discountAmount = json["discountAmount"].floatValue
        growth = json["growth"].intValue
        id = json["id"].intValue
        integration = json["integration"].intValue
        memberId = json["memberId"].intValue
        memberNickname = json["memberNickname"].stringValue
        modifyDate = json["modifyDate"].stringValue
        price = json["price"].floatValue
        productAttr = json["productAttr"].stringValue
        productBrand = json["productBrand"].stringValue
        productCategoryId = json["productCategoryId"].intValue
        productId = json["productId"].intValue
        productName = json["productName"].stringValue
        productPic = json["productPic"].stringValue
        productSkuCode = json["productSkuCode"].stringValue
        productSkuId = json["productSkuId"].intValue
        productSn = json["productSn"].stringValue
        productSubTitle = json["productSubTitle"].stringValue
        promotionMessage = json["promotionMessage"].stringValue
        quantity = json["quantity"].intValue
        realStock = json["realStock"].intValue
        reduceAmount = json["reduceAmount"].floatValue
    }
}
public class CmsSubject: SGResponseItem {
    /// 画册图片用逗号分割
    public var albumPics:String?
    public var categoryId:Int?
    /// 专题分类名称
    public var categoryName:String?
    public var collectCount:Int?
    public var commentCount:Int?
    public var content:String?
    public var createTime:String?
    public var description_str:String?
    /// 转发数
    public var forwardCount:Int?
    public var id:Int?
    /// 专题主图
    public var pic:String?
    /// 关联产品数量
    public var productCount:Int?
    public var readCount:Int?
    public var recommendStatus:Int?
    /// 显示状态：0->不显示；1->显示
    public var showStatus:Int?
    public var title:String?

    required convenience init(json:SKJSON) {
        self.init()
        albumPics = json["albumPics"].stringValue
        categoryId = json["categoryId"].intValue
        categoryName = json["categoryName"].stringValue
        collectCount = json["collectCount"].intValue
        commentCount = json["commentCount"].intValue
        content = json["content"].stringValue
        createTime = json["createTime"].stringValue
        description_str = json["description_str"].stringValue
        forwardCount = json["forwardCount"].intValue
        id = json["id"].intValue
        pic = json["pic"].stringValue
        productCount = json["productCount"].intValue
        readCount = json["readCount"].intValue
        recommendStatus = json["recommendStatus"].intValue
        showStatus = json["showStatus"].intValue
        title = json["title"].stringValue
    }
}
public class CommonPage_AgCommission: SGResponseItem {
    /// 分页数据
    public var list:[AgCommission] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(AgCommission(json: value))
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_AgGift: SGResponseItem {
    /// 分页数据
    public var list:[AgGift] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(AgGift(json: value))
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_AgHelping: SGResponseItem {
    /// 分页数据
    public var list:[AgHelping] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(AgHelping(json: value))
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_AgWithdrawal: SGResponseItem {
    /// 分页数据
    public var list:[AgWithdrawal] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(AgWithdrawal(json: value))
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_MemberBrandAttention: SGResponseItem {
    /// 分页数据
    public var list:[MemberBrandAttention] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(MemberBrandAttention(json: value))
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_MemberProductCollection: SGResponseItem {
    /// 分页数据
    public var list:[MemberProductCollection] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(MemberProductCollection(json: value))
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_MemberReadHistory: SGResponseItem {
    /// 分页数据
    public var list:[MemberReadHistory] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(MemberReadHistory(json: value))
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_OmsOrderDetail: SGResponseItem {
    /// 分页数据
    public var list:[OmsOrderDetail] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(OmsOrderDetail(json: value))
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_PmsProduct: SGResponseItem {
    /// 分页数据
    public var list:[PmsProduct] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(PmsProduct(json: value))
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_object: SGResponseItem {
    /// 分页数据
    public var list:[Any] = []
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(value.object)
        }
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonResult: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:Any?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = json["data"].object
        message = json["message"].stringValue
    }
}
public class CommonResult_CartProduct: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CartProduct?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CartProduct(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_AgCommission: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_AgCommission?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_AgCommission(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_AgGift: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_AgGift?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_AgGift(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_AgHelping: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_AgHelping?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_AgHelping(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_AgWithdrawal: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_AgWithdrawal?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_AgWithdrawal(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_MemberBrandAttention: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_MemberBrandAttention?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_MemberBrandAttention(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_MemberProductCollection: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_MemberProductCollection?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_MemberProductCollection(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_MemberReadHistory: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_MemberReadHistory?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_MemberReadHistory(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_OmsOrderDetail: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_OmsOrderDetail?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_OmsOrderDetail(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_PmsProduct: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_PmsProduct?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_PmsProduct(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_object: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:CommonPage_object?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = CommonPage_object(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_ConfirmOrderResult: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:ConfirmOrderResult?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = ConfirmOrderResult(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_HomeContentResult: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:HomeContentResult?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = HomeContentResult(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_List_CartPromotionItem: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[CartPromotionItem] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(CartPromotionItem(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_CmsSubject: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[CmsSubject] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(CmsSubject(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_OmsCartItem: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[OmsCartItem] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(OmsCartItem(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_PmsBrand: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[PmsBrand] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(PmsBrand(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_PmsProductCategoryNode: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[PmsProductCategoryNode] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(PmsProductCategoryNode(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_PmsProductCategory: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[PmsProductCategory] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(PmsProductCategory(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_PmsProduct: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[PmsProduct] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(PmsProduct(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_SmsCouponHistoryDetail: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[SmsCouponHistoryDetail] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(SmsCouponHistoryDetail(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_SmsCouponHistory: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[SmsCouponHistory] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(SmsCouponHistory(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_SmsCoupon: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[SmsCoupon] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(SmsCoupon(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_UmsMemberLevel: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[UmsMemberLevel] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(UmsMemberLevel(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_List_UmsMemberReceiveAddress: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:[UmsMemberReceiveAddress] = []
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(UmsMemberReceiveAddress(json: value))
        }
        message = json["message"].stringValue
    }
}
public class CommonResult_Map_string_object: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:Any?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = json["data"].object
        message = json["message"].stringValue
    }
}
public class CommonResult_MemberBrandAttention: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:MemberBrandAttention?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = MemberBrandAttention(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_MemberProductCollection: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:MemberProductCollection?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = MemberProductCollection(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_OmsOrderDetail: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:OmsOrderDetail?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = OmsOrderDetail(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_PmsBrand: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:PmsBrand?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = PmsBrand(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_PmsPortalProductDetail: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:PmsPortalProductDetail?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = PmsPortalProductDetail(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_UmsMemberInfo: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:UmsMemberInfo?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = UmsMemberInfo(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_UmsMemberReceiveAddress: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:UmsMemberReceiveAddress?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = UmsMemberReceiveAddress(json:json["data"])
        message = json["message"].stringValue
    }
}
public class CommonResult_long: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:Int?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = json["data"].intValue
        message = json["message"].stringValue
    }
}
public class CommonResult_object: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:Any?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = json["data"].object
        message = json["message"].stringValue
    }
}
public class CommonResult_string: SGResponseItem {
    /// 状态码
    public var code:Int?
    public var data:String?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        data = json["data"].stringValue
        message = json["message"].stringValue
    }
}
public class ConfirmOrderParam: SGResponseItem {
    /// 购物车id
    public var cartIds:[Int] = []

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["cartIds"].arrayValue{
            cartIds.append(value.intValue)
        }
    }
}
public class ConfirmOrderResult: SGResponseItem {
    public var calcAmount:CalcAmount?
    public var cartPromotionItemList:[CartPromotionItem] = []
    public var couponHistoryDetailList:[SmsCouponHistoryDetail] = []
    public var discountBalance:Float?
    public var integrationConsumeSetting:UmsIntegrationConsumeSetting?
    public var memberIntegration:Int?
    public var memberReceiveAddressList:[UmsMemberReceiveAddress] = []

    required convenience init(json:SKJSON) {
        self.init()
        calcAmount = CalcAmount(json:json["calcAmount"])
        for value in json["cartPromotionItemList"].arrayValue{
            cartPromotionItemList.append(CartPromotionItem(json: value))
        }
        for value in json["couponHistoryDetailList"].arrayValue{
            couponHistoryDetailList.append(SmsCouponHistoryDetail(json: value))
        }
        discountBalance = json["discountBalance"].floatValue
        integrationConsumeSetting = UmsIntegrationConsumeSetting(json:json["integrationConsumeSetting"])
        memberIntegration = json["memberIntegration"].intValue
        for value in json["memberReceiveAddressList"].arrayValue{
            memberReceiveAddressList.append(UmsMemberReceiveAddress(json: value))
        }
    }
}
public class FlashPromotionProduct: SGResponseItem {
    /// 画册图片，连产品图片限制为5张，以逗号分割
    public var albumPics:String?
    public var brandId:Int?
    /// 品牌名称
    public var brandName:String?
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    /// 商品描述
    public var description_str:String?
    public var detailDesc:String?
    /// 产品详情网页内容
    public var detailHtml:String?
    /// 移动端网页详情
    public var detailMobileHtml:String?
    public var detailTitle:String?
    /// 折扣金额（可抵扣）
    public var discountAmount:Float?
    public var feightTemplateId:Int?
    public var flashPromotionCount:Int?
    public var flashPromotionLimit:Int?
    public var flashPromotionPrice:Float?
    /// 赠送的成长值
    public var giftGrowth:Int?
    /// 赠送的积分
    public var giftPoint:Int?
    public var id:Int?
    public var keywords:String?
    /// 库存预警值
    public var lowStock:Int?
    public var name:String?
    /// 新品状态:0->不是新品；1->新品
    public var newStatus:Int?
    public var note:String?
    /// 市场价
    public var originalPrice:Float?
    public var pic:String?
    /// 是否为预告商品：0->不是；1->是
    public var previewStatus:Int?
    public var price:Float?
    public var productAttributeCategoryId:Int?
    public var productCategoryId:Int?
    /// 商品分类名称
    public var productCategoryName:String?
    /// 货号
    public var productSn:String?
    /// 促销结束时间
    public var promotionEndTime:String?
    /// 活动限购数量
    public var promotionPerLimit:Int?
    /// 促销价格
    public var promotionPrice:Float?
    /// 促销开始时间
    public var promotionStartTime:String?
    /// 促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购
    public var promotionType:Int?
    /// 上架状态：0->下架；1->上架
    public var publishStatus:Int?
    /// 推荐状态；0->不推荐；1->推荐
    public var recommandStatus:Int?
    /// 销量
    public var sale:Int?
    /// 以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮
    public var serviceIds:String?
    /// 排序
    public var sort:Int?
    /// 库存
    public var stock:Int?
    /// 副标题
    public var subTitle:String?
    /// 单位
    public var unit:String?
    /// 限制使用的积分数
    public var usePointLimit:Int?
    /// 审核状态：0->未审核；1->审核通过
    public var verifyStatus:Int?
    /// 商品重量，默认为克
    public var weight:Float?

    required convenience init(json:SKJSON) {
        self.init()
        albumPics = json["albumPics"].stringValue
        brandId = json["brandId"].intValue
        brandName = json["brandName"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        description_str = json["description_str"].stringValue
        detailDesc = json["detailDesc"].stringValue
        detailHtml = json["detailHtml"].stringValue
        detailMobileHtml = json["detailMobileHtml"].stringValue
        detailTitle = json["detailTitle"].stringValue
        discountAmount = json["discountAmount"].floatValue
        feightTemplateId = json["feightTemplateId"].intValue
        flashPromotionCount = json["flashPromotionCount"].intValue
        flashPromotionLimit = json["flashPromotionLimit"].intValue
        flashPromotionPrice = json["flashPromotionPrice"].floatValue
        giftGrowth = json["giftGrowth"].intValue
        giftPoint = json["giftPoint"].intValue
        id = json["id"].intValue
        keywords = json["keywords"].stringValue
        lowStock = json["lowStock"].intValue
        name = json["name"].stringValue
        newStatus = json["newStatus"].intValue
        note = json["note"].stringValue
        originalPrice = json["originalPrice"].floatValue
        pic = json["pic"].stringValue
        previewStatus = json["previewStatus"].intValue
        price = json["price"].floatValue
        productAttributeCategoryId = json["productAttributeCategoryId"].intValue
        productCategoryId = json["productCategoryId"].intValue
        productCategoryName = json["productCategoryName"].stringValue
        productSn = json["productSn"].stringValue
        promotionEndTime = json["promotionEndTime"].stringValue
        promotionPerLimit = json["promotionPerLimit"].intValue
        promotionPrice = json["promotionPrice"].floatValue
        promotionStartTime = json["promotionStartTime"].stringValue
        promotionType = json["promotionType"].intValue
        publishStatus = json["publishStatus"].intValue
        recommandStatus = json["recommandStatus"].intValue
        sale = json["sale"].intValue
        serviceIds = json["serviceIds"].stringValue
        sort = json["sort"].intValue
        stock = json["stock"].intValue
        subTitle = json["subTitle"].stringValue
        unit = json["unit"].stringValue
        usePointLimit = json["usePointLimit"].intValue
        verifyStatus = json["verifyStatus"].intValue
        weight = json["weight"].floatValue
    }
}
public class HomeContentResult: SGResponseItem {
    public var advertiseList:[SmsHomeAdvertise] = []
    public var brandList:[PmsBrand] = []
    public var homeFlashPromotion:HomeFlashPromotion?
    public var hotProductList:[PmsProduct] = []
    public var newProductList:[PmsProduct] = []
    public var subjectList:[CmsSubject] = []

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["advertiseList"].arrayValue{
            advertiseList.append(SmsHomeAdvertise(json: value))
        }
        for value in json["brandList"].arrayValue{
            brandList.append(PmsBrand(json: value))
        }
        homeFlashPromotion = HomeFlashPromotion(json:json["homeFlashPromotion"])
        for value in json["hotProductList"].arrayValue{
            hotProductList.append(PmsProduct(json: value))
        }
        for value in json["newProductList"].arrayValue{
            newProductList.append(PmsProduct(json: value))
        }
        for value in json["subjectList"].arrayValue{
            subjectList.append(CmsSubject(json: value))
        }
    }
}
public class HomeFlashPromotion: SGResponseItem {
    public var endTime:String?
    public var nextEndTime:String?
    public var nextStartTime:String?
    public var productList:[FlashPromotionProduct] = []
    public var startTime:String?

    required convenience init(json:SKJSON) {
        self.init()
        endTime = json["endTime"].stringValue
        nextEndTime = json["nextEndTime"].stringValue
        nextStartTime = json["nextStartTime"].stringValue
        for value in json["productList"].arrayValue{
            productList.append(FlashPromotionProduct(json: value))
        }
        startTime = json["startTime"].stringValue
    }
}
public class MemberBrandAttention: SGResponseItem {
    public var brandCity:String?
    public var brandId:Int?
    public var brandLogo:String?
    public var brandName:String?
    public var createTime:String?
    public var id:String?
    public var memberIcon:String?
    public var memberId:Int?
    public var memberNickname:String?

    required convenience init(json:SKJSON) {
        self.init()
        brandCity = json["brandCity"].stringValue
        brandId = json["brandId"].intValue
        brandLogo = json["brandLogo"].stringValue
        brandName = json["brandName"].stringValue
        createTime = json["createTime"].stringValue
        id = json["id"].stringValue
        memberIcon = json["memberIcon"].stringValue
        memberId = json["memberId"].intValue
        memberNickname = json["memberNickname"].stringValue
    }
}
public class MemberProductCollection: SGResponseItem {
    public var createTime:String?
    public var id:String?
    public var memberIcon:String?
    public var memberId:Int?
    public var memberNickname:String?
    public var productId:Int?
    public var productName:String?
    public var productPic:String?
    public var productPrice:String?
    public var productSubTitle:String?

    required convenience init(json:SKJSON) {
        self.init()
        createTime = json["createTime"].stringValue
        id = json["id"].stringValue
        memberIcon = json["memberIcon"].stringValue
        memberId = json["memberId"].intValue
        memberNickname = json["memberNickname"].stringValue
        productId = json["productId"].intValue
        productName = json["productName"].stringValue
        productPic = json["productPic"].stringValue
        productPrice = json["productPrice"].stringValue
        productSubTitle = json["productSubTitle"].stringValue
    }
}
public class MemberReadHistory: SGResponseItem {
    public var createTime:String?
    public var id:String?
    public var memberIcon:String?
    public var memberId:Int?
    public var memberNickname:String?
    public var productId:Int?
    public var productName:String?
    public var productPic:String?
    public var productPrice:String?
    public var productSubTitle:String?

    required convenience init(json:SKJSON) {
        self.init()
        createTime = json["createTime"].stringValue
        id = json["id"].stringValue
        memberIcon = json["memberIcon"].stringValue
        memberId = json["memberId"].intValue
        memberNickname = json["memberNickname"].stringValue
        productId = json["productId"].intValue
        productName = json["productName"].stringValue
        productPic = json["productPic"].stringValue
        productPrice = json["productPrice"].stringValue
        productSubTitle = json["productSubTitle"].stringValue
    }
}
public class OmsCartItem: SGResponseItem {
    /// 创建时间
    public var createDate:String?
    /// 是否删除
    public var deleteStatus:Int?
    public var id:Int?
    public var memberId:Int?
    /// 会员昵称
    public var memberNickname:String?
    /// 修改时间
    public var modifyDate:String?
    /// 添加到购物车的价格
    public var price:Float?
    /// 商品销售属性:[{'key':'颜色','value':'颜色'},{'key':'容量','value':'4G'}]
    public var productAttr:String?
    public var productBrand:String?
    /// 商品分类
    public var productCategoryId:Int?
    public var productId:Int?
    /// 商品名称
    public var productName:String?
    /// 商品主图
    public var productPic:String?
    /// 商品sku条码
    public var productSkuCode:String?
    public var productSkuId:Int?
    public var productSn:String?
    /// 商品副标题（卖点）
    public var productSubTitle:String?
    /// 购买数量
    public var quantity:Int?

    required convenience init(json:SKJSON) {
        self.init()
        createDate = json["createDate"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        id = json["id"].intValue
        memberId = json["memberId"].intValue
        memberNickname = json["memberNickname"].stringValue
        modifyDate = json["modifyDate"].stringValue
        price = json["price"].floatValue
        productAttr = json["productAttr"].stringValue
        productBrand = json["productBrand"].stringValue
        productCategoryId = json["productCategoryId"].intValue
        productId = json["productId"].intValue
        productName = json["productName"].stringValue
        productPic = json["productPic"].stringValue
        productSkuCode = json["productSkuCode"].stringValue
        productSkuId = json["productSkuId"].intValue
        productSn = json["productSn"].stringValue
        productSubTitle = json["productSubTitle"].stringValue
        quantity = json["quantity"].intValue
    }
}
public class OmsOrderDetail: SGResponseItem {
    /// 自动确认时间（天）
    public var autoConfirmDay:Int?
    /// 发票内容
    public var billContent:String?
    /// 发票抬头
    public var billHeader:String?
    /// 收票人邮箱
    public var billReceiverEmail:String?
    /// 收票人电话
    public var billReceiverPhone:String?
    /// 发票类型：0->不开发票；1->电子发票；2->纸质发票
    public var billType:Int?
    /// 评价时间
    public var commentTime:String?
    /// 确认收货状态：0->未确认；1->已确认
    public var confirmStatus:Int?
    /// 优惠券抵扣金额
    public var couponAmount:Float?
    public var couponId:Int?
    /// 提交时间
    public var createTime:String?
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    /// 物流公司(配送方式)
    public var deliveryCompany:String?
    /// 物流单号
    public var deliverySn:String?
    /// 发货时间
    public var deliveryTime:String?
    /// 管理员后台调整订单使用的折扣金额
    public var discountAmount:Float?
    /// 运费金额
    public var freightAmount:Float?
    /// 可以活动的成长值
    public var growth:Int?
    /// 订单id
    public var id:Int?
    /// 可以获得的积分
    public var integration:Int?
    /// 积分抵扣金额
    public var integrationAmount:Float?
    public var memberId:Int?
    /// 用户帐号
    public var memberUsername:String?
    /// 修改时间
    public var modifyTime:String?
    /// 订单备注
    public var note:String?
    public var orderItemList:[OmsOrderItem] = []
    /// 订单编号
    public var orderSn:String?
    /// 订单类型：0->正常订单；1->秒杀订单
    public var orderType:Int?
    /// 应付金额（实际支付金额）
    public var payAmount:Float?
    /// 支付方式：0->未支付；1->支付宝；2->微信
    public var payType:Int?
    /// 支付时间
    public var paymentTime:String?
    /// 促销优化金额（促销价、满减、阶梯价）
    public var promotionAmount:Float?
    /// 活动信息
    public var promotionInfo:String?
    /// 确认收货时间
    public var receiveTime:String?
    /// 城市
    public var receiverCity:String?
    /// 详细地址
    public var receiverDetailAddress:String?
    /// 收货人姓名
    public var receiverName:String?
    /// 收货人电话
    public var receiverPhone:String?
    /// 收货人邮编
    public var receiverPostCode:String?
    /// 省份/直辖市
    public var receiverProvince:String?
    /// 区
    public var receiverRegion:String?
    /// 订单来源：0->PC订单；1->app订单
    public var sourceType:Int?
    /// 订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单
    public var status:Int?
    /// 订单总金额
    public var totalAmount:Float?
    /// 下单时使用的积分
    public var useIntegration:Int?

    required convenience init(json:SKJSON) {
        self.init()
        autoConfirmDay = json["autoConfirmDay"].intValue
        billContent = json["billContent"].stringValue
        billHeader = json["billHeader"].stringValue
        billReceiverEmail = json["billReceiverEmail"].stringValue
        billReceiverPhone = json["billReceiverPhone"].stringValue
        billType = json["billType"].intValue
        commentTime = json["commentTime"].stringValue
        confirmStatus = json["confirmStatus"].intValue
        couponAmount = json["couponAmount"].floatValue
        couponId = json["couponId"].intValue
        createTime = json["createTime"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        deliveryCompany = json["deliveryCompany"].stringValue
        deliverySn = json["deliverySn"].stringValue
        deliveryTime = json["deliveryTime"].stringValue
        discountAmount = json["discountAmount"].floatValue
        freightAmount = json["freightAmount"].floatValue
        growth = json["growth"].intValue
        id = json["id"].intValue
        integration = json["integration"].intValue
        integrationAmount = json["integrationAmount"].floatValue
        memberId = json["memberId"].intValue
        memberUsername = json["memberUsername"].stringValue
        modifyTime = json["modifyTime"].stringValue
        note = json["note"].stringValue
        for value in json["orderItemList"].arrayValue{
            orderItemList.append(OmsOrderItem(json: value))
        }
        orderSn = json["orderSn"].stringValue
        orderType = json["orderType"].intValue
        payAmount = json["payAmount"].floatValue
        payType = json["payType"].intValue
        paymentTime = json["paymentTime"].stringValue
        promotionAmount = json["promotionAmount"].floatValue
        promotionInfo = json["promotionInfo"].stringValue
        receiveTime = json["receiveTime"].stringValue
        receiverCity = json["receiverCity"].stringValue
        receiverDetailAddress = json["receiverDetailAddress"].stringValue
        receiverName = json["receiverName"].stringValue
        receiverPhone = json["receiverPhone"].stringValue
        receiverPostCode = json["receiverPostCode"].stringValue
        receiverProvince = json["receiverProvince"].stringValue
        receiverRegion = json["receiverRegion"].stringValue
        sourceType = json["sourceType"].intValue
        status = json["status"].intValue
        totalAmount = json["totalAmount"].floatValue
        useIntegration = json["useIntegration"].intValue
    }
}
public class OmsOrderItem: SGResponseItem {
    /// 优惠券优惠分解金额
    public var couponAmount:Float?
    /// 消费券分解金额
    public var discountAmount:Float?
    public var giftGrowth:Int?
    public var giftIntegration:Int?
    public var id:Int?
    /// 积分优惠分解金额
    public var integrationAmount:Float?
    /// 订单id
    public var orderId:Int?
    /// 订单编号
    public var orderSn:String?
    /// 商品销售属性:[{'key':'颜色','value':'颜色'},{'key':'容量','value':'4G'}]
    public var productAttr:String?
    public var productBrand:String?
    /// 商品分类id
    public var productCategoryId:Int?
    public var productId:Int?
    public var productName:String?
    public var productPic:String?
    /// 销售价格
    public var productPrice:Float?
    /// 购买数量
    public var productQuantity:Int?
    /// 商品sku条码
    public var productSkuCode:String?
    /// 商品sku编号
    public var productSkuId:Int?
    public var productSn:String?
    /// 商品促销分解金额
    public var promotionAmount:Float?
    /// 商品促销名称
    public var promotionName:String?
    /// 该商品经过优惠后的分解金额
    public var realAmount:Float?

    required convenience init(json:SKJSON) {
        self.init()
        couponAmount = json["couponAmount"].floatValue
        discountAmount = json["discountAmount"].floatValue
        giftGrowth = json["giftGrowth"].intValue
        giftIntegration = json["giftIntegration"].intValue
        id = json["id"].intValue
        integrationAmount = json["integrationAmount"].floatValue
        orderId = json["orderId"].intValue
        orderSn = json["orderSn"].stringValue
        productAttr = json["productAttr"].stringValue
        productBrand = json["productBrand"].stringValue
        productCategoryId = json["productCategoryId"].intValue
        productId = json["productId"].intValue
        productName = json["productName"].stringValue
        productPic = json["productPic"].stringValue
        productPrice = json["productPrice"].floatValue
        productQuantity = json["productQuantity"].intValue
        productSkuCode = json["productSkuCode"].stringValue
        productSkuId = json["productSkuId"].intValue
        productSn = json["productSn"].stringValue
        promotionAmount = json["promotionAmount"].floatValue
        promotionName = json["promotionName"].stringValue
        realAmount = json["realAmount"].floatValue
    }
}
public class OmsOrderReturnApplyParam: SGResponseItem {
    /// 描述
    public var description_str:String?
    /// 会员用户名
    public var memberUsername:String?
    /// 订单id
    public var orderId:Int?
    /// 订单编号
    public var orderSn:String?
    /// 商品销售属性：颜色：红色；尺码：xl;
    public var productAttr:String?
    /// 商品品牌
    public var productBrand:String?
    /// 退货数量
    public var productCount:Int?
    /// 退货商品id
    public var productId:Int?
    /// 商品名称
    public var productName:String?
    /// 商品图片
    public var productPic:String?
    /// 商品单价
    public var productPrice:Float?
    /// 商品实际支付单价
    public var productRealPrice:Float?
    /// 凭证图片，以逗号隔开
    public var proofPics:String?
    /// 原因
    public var reason:String?
    /// 退货人姓名
    public var returnName:String?
    /// 退货人电话
    public var returnPhone:String?

    required convenience init(json:SKJSON) {
        self.init()
        description_str = json["description_str"].stringValue
        memberUsername = json["memberUsername"].stringValue
        orderId = json["orderId"].intValue
        orderSn = json["orderSn"].stringValue
        productAttr = json["productAttr"].stringValue
        productBrand = json["productBrand"].stringValue
        productCount = json["productCount"].intValue
        productId = json["productId"].intValue
        productName = json["productName"].stringValue
        productPic = json["productPic"].stringValue
        productPrice = json["productPrice"].floatValue
        productRealPrice = json["productRealPrice"].floatValue
        proofPics = json["proofPics"].stringValue
        reason = json["reason"].stringValue
        returnName = json["returnName"].stringValue
        returnPhone = json["returnPhone"].stringValue
    }
}
public class OrderParam: SGResponseItem {
    /// 被选中的购物车商品ID
    public var cartIds:[Int] = []
    /// 优惠券ID
    public var couponId:Int?
    /// 收货地址ID
    public var memberReceiveAddressId:Int?
    /// 支付方式
    public var payType:Int?
    /// 使用的积分数
    public var useIntegration:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["cartIds"].arrayValue{
            cartIds.append(value.intValue)
        }
        couponId = json["couponId"].intValue
        memberReceiveAddressId = json["memberReceiveAddressId"].intValue
        payType = json["payType"].intValue
        useIntegration = json["useIntegration"].intValue
    }
}
public class PaymentParam: SGResponseItem {
    /// 支付类型 1:支付宝 2:微信
    public var payType:Int?
    /// 来源ID，如果是订单，则是订单ID
    public var sourceId:String?
    /// 来源类型 1:订单 2:礼包
    public var sourceType:Int?

    required convenience init(json:SKJSON) {
        self.init()
        payType = json["payType"].intValue
        sourceId = json["sourceId"].stringValue
        sourceType = json["sourceType"].intValue
    }
}
public class PmsBrand: SGResponseItem {
    /// 专区大图
    public var bigPic:String?
    /// 品牌故事
    public var brandStory:String?
    /// 是否为品牌制造商：0->不是；1->是
    public var factoryStatus:Int?
    /// 首字母
    public var firstLetter:String?
    public var id:Int?
    /// 品牌logo
    public var logo:String?
    public var name:String?
    /// 产品评论数量
    public var productCommentCount:Int?
    /// 产品数量
    public var productCount:Int?
    public var showStatus:Int?
    public var sort:Int?

    required convenience init(json:SKJSON) {
        self.init()
        bigPic = json["bigPic"].stringValue
        brandStory = json["brandStory"].stringValue
        factoryStatus = json["factoryStatus"].intValue
        firstLetter = json["firstLetter"].stringValue
        id = json["id"].intValue
        logo = json["logo"].stringValue
        name = json["name"].stringValue
        productCommentCount = json["productCommentCount"].intValue
        productCount = json["productCount"].intValue
        showStatus = json["showStatus"].intValue
        sort = json["sort"].intValue
    }
}
public class PmsPortalProductDetail: SGResponseItem {
    /// 商品品牌
    public var brand:PmsBrand?
    /// 商品可用优惠券
    public var couponList:[SmsCoupon] = []
    /// 商品信息
    public var product:PmsProduct?
    /// 商品属性与参数
    public var productAttributeList:[PmsProductAttribute] = []
    /// 手动录入的商品属性与参数值
    public var productAttributeValueList:[PmsProductAttributeValue] = []
    /// 商品满减价格设置
    public var productFullReductionList:[PmsProductFullReduction] = []
    /// 商品阶梯价格设置
    public var productLadderList:[PmsProductLadder] = []
    /// 商品的sku库存信息
    public var skuStockList:[PmsSkuStock] = []

    required convenience init(json:SKJSON) {
        self.init()
        brand = PmsBrand(json:json["brand"])
        for value in json["couponList"].arrayValue{
            couponList.append(SmsCoupon(json: value))
        }
        product = PmsProduct(json:json["product"])
        for value in json["productAttributeList"].arrayValue{
            productAttributeList.append(PmsProductAttribute(json: value))
        }
        for value in json["productAttributeValueList"].arrayValue{
            productAttributeValueList.append(PmsProductAttributeValue(json: value))
        }
        for value in json["productFullReductionList"].arrayValue{
            productFullReductionList.append(PmsProductFullReduction(json: value))
        }
        for value in json["productLadderList"].arrayValue{
            productLadderList.append(PmsProductLadder(json: value))
        }
        for value in json["skuStockList"].arrayValue{
            skuStockList.append(PmsSkuStock(json: value))
        }
    }
}
public class PmsProduct: SGResponseItem {
    /// 画册图片，连产品图片限制为5张，以逗号分割
    public var albumPics:String?
    public var brandId:Int?
    /// 品牌名称
    public var brandName:String?
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    /// 商品描述
    public var description_str:String?
    public var detailDesc:String?
    /// 产品详情网页内容
    public var detailHtml:String?
    /// 移动端网页详情
    public var detailMobileHtml:String?
    public var detailTitle:String?
    /// 折扣金额（可抵扣）
    public var discountAmount:Float?
    public var feightTemplateId:Int?
    /// 赠送的成长值
    public var giftGrowth:Int?
    /// 赠送的积分
    public var giftPoint:Int?
    public var id:Int?
    public var keywords:String?
    /// 库存预警值
    public var lowStock:Int?
    public var name:String?
    /// 新品状态:0->不是新品；1->新品
    public var newStatus:Int?
    public var note:String?
    /// 市场价
    public var originalPrice:Float?
    public var pic:String?
    /// 是否为预告商品：0->不是；1->是
    public var previewStatus:Int?
    public var price:Float?
    public var productAttributeCategoryId:Int?
    public var productCategoryId:Int?
    /// 商品分类名称
    public var productCategoryName:String?
    /// 货号
    public var productSn:String?
    /// 促销结束时间
    public var promotionEndTime:String?
    /// 活动限购数量
    public var promotionPerLimit:Int?
    /// 促销价格
    public var promotionPrice:Float?
    /// 促销开始时间
    public var promotionStartTime:String?
    /// 促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购
    public var promotionType:Int?
    /// 上架状态：0->下架；1->上架
    public var publishStatus:Int?
    /// 推荐状态；0->不推荐；1->推荐
    public var recommandStatus:Int?
    /// 销量
    public var sale:Int?
    /// 以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮
    public var serviceIds:String?
    /// 排序
    public var sort:Int?
    /// 库存
    public var stock:Int?
    /// 副标题
    public var subTitle:String?
    /// 单位
    public var unit:String?
    /// 限制使用的积分数
    public var usePointLimit:Int?
    /// 审核状态：0->未审核；1->审核通过
    public var verifyStatus:Int?
    /// 商品重量，默认为克
    public var weight:Float?

    required convenience init(json:SKJSON) {
        self.init()
        albumPics = json["albumPics"].stringValue
        brandId = json["brandId"].intValue
        brandName = json["brandName"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        description_str = json["description_str"].stringValue
        detailDesc = json["detailDesc"].stringValue
        detailHtml = json["detailHtml"].stringValue
        detailMobileHtml = json["detailMobileHtml"].stringValue
        detailTitle = json["detailTitle"].stringValue
        discountAmount = json["discountAmount"].floatValue
        feightTemplateId = json["feightTemplateId"].intValue
        giftGrowth = json["giftGrowth"].intValue
        giftPoint = json["giftPoint"].intValue
        id = json["id"].intValue
        keywords = json["keywords"].stringValue
        lowStock = json["lowStock"].intValue
        name = json["name"].stringValue
        newStatus = json["newStatus"].intValue
        note = json["note"].stringValue
        originalPrice = json["originalPrice"].floatValue
        pic = json["pic"].stringValue
        previewStatus = json["previewStatus"].intValue
        price = json["price"].floatValue
        productAttributeCategoryId = json["productAttributeCategoryId"].intValue
        productCategoryId = json["productCategoryId"].intValue
        productCategoryName = json["productCategoryName"].stringValue
        productSn = json["productSn"].stringValue
        promotionEndTime = json["promotionEndTime"].stringValue
        promotionPerLimit = json["promotionPerLimit"].intValue
        promotionPrice = json["promotionPrice"].floatValue
        promotionStartTime = json["promotionStartTime"].stringValue
        promotionType = json["promotionType"].intValue
        publishStatus = json["publishStatus"].intValue
        recommandStatus = json["recommandStatus"].intValue
        sale = json["sale"].intValue
        serviceIds = json["serviceIds"].stringValue
        sort = json["sort"].intValue
        stock = json["stock"].intValue
        subTitle = json["subTitle"].stringValue
        unit = json["unit"].stringValue
        usePointLimit = json["usePointLimit"].intValue
        verifyStatus = json["verifyStatus"].intValue
        weight = json["weight"].floatValue
    }
}
public class PmsProductAttribute: SGResponseItem {
    /// 分类筛选样式：1->普通；1->颜色
    public var filterType:Int?
    /// 是否支持手动新增；0->不支持；1->支持
    public var handAddStatus:Int?
    public var id:Int?
    /// 可选值列表，以逗号隔开
    public var inputList:String?
    /// 属性录入方式：0->手工录入；1->从列表中选取
    public var inputType:Int?
    public var name:String?
    public var productAttributeCategoryId:Int?
    /// 相同属性产品是否关联；0->不关联；1->关联
    public var relatedStatus:Int?
    /// 检索类型；0->不需要进行检索；1->关键字检索；2->范围检索
    public var searchType:Int?
    /// 属性选择类型：0->唯一；1->单选；2->多选
    public var selectType:Int?
    /// 排序字段：最高的可以单独上传图片
    public var sort:Int?
    /// 属性的类型；0->规格；1->参数
    public var type:Int?

    required convenience init(json:SKJSON) {
        self.init()
        filterType = json["filterType"].intValue
        handAddStatus = json["handAddStatus"].intValue
        id = json["id"].intValue
        inputList = json["inputList"].stringValue
        inputType = json["inputType"].intValue
        name = json["name"].stringValue
        productAttributeCategoryId = json["productAttributeCategoryId"].intValue
        relatedStatus = json["relatedStatus"].intValue
        searchType = json["searchType"].intValue
        selectType = json["selectType"].intValue
        sort = json["sort"].intValue
        type = json["type"].intValue
    }
}
public class PmsProductAttributeValue: SGResponseItem {
    public var id:Int?
    public var productAttributeId:Int?
    public var productId:Int?
    /// 手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开
    public var value:String?

    required convenience init(json:SKJSON) {
        self.init()
        id = json["id"].intValue
        productAttributeId = json["productAttributeId"].intValue
        productId = json["productId"].intValue
        value = json["value"].stringValue
    }
}
public class PmsProductCategory: SGResponseItem {
    /// 描述
    public var description_str:String?
    /// 图标
    public var icon:String?
    public var id:Int?
    public var keywords:String?
    /// 分类级别：0->1级；1->2级
    public var level:Int?
    public var name:String?
    /// 是否显示在导航栏：0->不显示；1->显示
    public var navStatus:Int?
    /// 上机分类的编号：0表示一级分类
    public var parentId:Int?
    public var productCount:Int?
    public var productUnit:String?
    /// 显示状态：0->不显示；1->显示
    public var showStatus:Int?
    public var sort:Int?

    required convenience init(json:SKJSON) {
        self.init()
        description_str = json["description_str"].stringValue
        icon = json["icon"].stringValue
        id = json["id"].intValue
        keywords = json["keywords"].stringValue
        level = json["level"].intValue
        name = json["name"].stringValue
        navStatus = json["navStatus"].intValue
        parentId = json["parentId"].intValue
        productCount = json["productCount"].intValue
        productUnit = json["productUnit"].stringValue
        showStatus = json["showStatus"].intValue
        sort = json["sort"].intValue
    }
}
public class PmsProductCategoryNode: SGResponseItem {
    public var children:[PmsProductCategoryNode] = []
    /// 描述
    public var description_str:String?
    /// 图标
    public var icon:String?
    public var id:Int?
    public var keywords:String?
    /// 分类级别：0->1级；1->2级
    public var level:Int?
    public var name:String?
    /// 是否显示在导航栏：0->不显示；1->显示
    public var navStatus:Int?
    /// 上机分类的编号：0表示一级分类
    public var parentId:Int?
    public var productCount:Int?
    public var productUnit:String?
    /// 显示状态：0->不显示；1->显示
    public var showStatus:Int?
    public var sort:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["children"].arrayValue{
            children.append(PmsProductCategoryNode(json: value))
        }
        description_str = json["description_str"].stringValue
        icon = json["icon"].stringValue
        id = json["id"].intValue
        keywords = json["keywords"].stringValue
        level = json["level"].intValue
        name = json["name"].stringValue
        navStatus = json["navStatus"].intValue
        parentId = json["parentId"].intValue
        productCount = json["productCount"].intValue
        productUnit = json["productUnit"].stringValue
        showStatus = json["showStatus"].intValue
        sort = json["sort"].intValue
    }
}
public class PmsProductFullReduction: SGResponseItem {
    public var fullPrice:Float?
    public var id:Int?
    public var productId:Int?
    public var reducePrice:Float?

    required convenience init(json:SKJSON) {
        self.init()
        fullPrice = json["fullPrice"].floatValue
        id = json["id"].intValue
        productId = json["productId"].intValue
        reducePrice = json["reducePrice"].floatValue
    }
}
public class PmsProductLadder: SGResponseItem {
    /// 满足的商品数量
    public var count:Int?
    /// 折扣
    public var discount:Float?
    public var id:Int?
    /// 折后价格
    public var price:Float?
    public var productId:Int?

    required convenience init(json:SKJSON) {
        self.init()
        count = json["count"].intValue
        discount = json["discount"].floatValue
        id = json["id"].intValue
        price = json["price"].floatValue
        productId = json["productId"].intValue
    }
}
public class PmsSkuStock: SGResponseItem {
    /// 成本价
    public var costPrice:Float?
    /// 折扣金额（可抵扣）
    public var discountAmount:Float?
    public var id:Int?
    /// 锁定库存
    public var lockStock:Int?
    /// 预警库存
    public var lowStock:Int?
    /// 展示图片
    public var pic:String?
    public var price:Float?
    public var productId:Int?
    /// 单品促销价格
    public var promotionPrice:Float?
    /// 销量
    public var sale:Int?
    /// sku编码
    public var skuCode:String?
    /// 商品销售属性，json格式
    public var spData:String?
    /// 库存
    public var stock:Int?

    required convenience init(json:SKJSON) {
        self.init()
        costPrice = json["costPrice"].floatValue
        discountAmount = json["discountAmount"].floatValue
        id = json["id"].intValue
        lockStock = json["lockStock"].intValue
        lowStock = json["lowStock"].intValue
        pic = json["pic"].stringValue
        price = json["price"].floatValue
        productId = json["productId"].intValue
        promotionPrice = json["promotionPrice"].floatValue
        sale = json["sale"].intValue
        skuCode = json["skuCode"].stringValue
        spData = json["spData"].stringValue
        stock = json["stock"].intValue
    }
}
public class SmsCoupon: SGResponseItem {
    /// 金额
    public var amount:Float?
    /// 优惠码
    public var code:String?
    /// 数量
    public var count:Int?
    /// 可以领取的日期
    public var enableTime:String?
    public var endTime:String?
    public var id:Int?
    /// 可领取的会员类型：0->无限时
    public var memberLevel:Int?
    /// 使用门槛；0表示无门槛
    public var minPoint:Float?
    public var name:String?
    /// 备注
    public var note:String?
    /// 每人限领张数
    public var perLimit:Int?
    /// 使用平台：0->全部；1->移动；2->PC
    public var platform:Int?
    /// 发行数量
    public var publishCount:Int?
    /// 领取数量
    public var receiveCount:Int?
    public var startTime:String?
    /// 优惠券类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券
    public var type:Int?
    /// 已使用数量
    public var useCount:Int?
    /// 使用类型：0->全场通用；1->指定分类；2->指定商品
    public var useType:Int?

    required convenience init(json:SKJSON) {
        self.init()
        amount = json["amount"].floatValue
        code = json["code"].stringValue
        count = json["count"].intValue
        enableTime = json["enableTime"].stringValue
        endTime = json["endTime"].stringValue
        id = json["id"].intValue
        memberLevel = json["memberLevel"].intValue
        minPoint = json["minPoint"].floatValue
        name = json["name"].stringValue
        note = json["note"].stringValue
        perLimit = json["perLimit"].intValue
        platform = json["platform"].intValue
        publishCount = json["publishCount"].intValue
        receiveCount = json["receiveCount"].intValue
        startTime = json["startTime"].stringValue
        type = json["type"].intValue
        useCount = json["useCount"].intValue
        useType = json["useType"].intValue
    }
}
public class SmsCouponHistory: SGResponseItem {
    public var couponCode:String?
    public var couponId:Int?
    public var createTime:String?
    /// 获取类型：0->后台赠送；1->主动获取
    public var getType:Int?
    public var id:Int?
    public var memberId:Int?
    /// 领取人昵称
    public var memberNickname:String?
    /// 订单编号
    public var orderId:Int?
    /// 订单号码
    public var orderSn:String?
    /// 使用状态：0->未使用；1->已使用；2->已过期
    public var useStatus:Int?
    /// 使用时间
    public var useTime:String?

    required convenience init(json:SKJSON) {
        self.init()
        couponCode = json["couponCode"].stringValue
        couponId = json["couponId"].intValue
        createTime = json["createTime"].stringValue
        getType = json["getType"].intValue
        id = json["id"].intValue
        memberId = json["memberId"].intValue
        memberNickname = json["memberNickname"].stringValue
        orderId = json["orderId"].intValue
        orderSn = json["orderSn"].stringValue
        useStatus = json["useStatus"].intValue
        useTime = json["useTime"].stringValue
    }
}
public class SmsCouponHistoryDetail: SGResponseItem {
    public var categoryRelationList:[SmsCouponProductCategoryRelation] = []
    public var coupon:SmsCoupon?
    public var couponCode:String?
    public var couponId:Int?
    public var createTime:String?
    /// 获取类型：0->后台赠送；1->主动获取
    public var getType:Int?
    public var id:Int?
    public var memberId:Int?
    /// 领取人昵称
    public var memberNickname:String?
    /// 订单编号
    public var orderId:Int?
    /// 订单号码
    public var orderSn:String?
    public var productRelationList:[SmsCouponProductRelation] = []
    /// 使用状态：0->未使用；1->已使用；2->已过期
    public var useStatus:Int?
    /// 使用时间
    public var useTime:String?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["categoryRelationList"].arrayValue{
            categoryRelationList.append(SmsCouponProductCategoryRelation(json: value))
        }
        coupon = SmsCoupon(json:json["coupon"])
        couponCode = json["couponCode"].stringValue
        couponId = json["couponId"].intValue
        createTime = json["createTime"].stringValue
        getType = json["getType"].intValue
        id = json["id"].intValue
        memberId = json["memberId"].intValue
        memberNickname = json["memberNickname"].stringValue
        orderId = json["orderId"].intValue
        orderSn = json["orderSn"].stringValue
        for value in json["productRelationList"].arrayValue{
            productRelationList.append(SmsCouponProductRelation(json: value))
        }
        useStatus = json["useStatus"].intValue
        useTime = json["useTime"].stringValue
    }
}
public class SmsCouponProductCategoryRelation: SGResponseItem {
    public var couponId:Int?
    public var id:Int?
    /// 父分类名称
    public var parentCategoryName:String?
    public var productCategoryId:Int?
    /// 产品分类名称
    public var productCategoryName:String?

    required convenience init(json:SKJSON) {
        self.init()
        couponId = json["couponId"].intValue
        id = json["id"].intValue
        parentCategoryName = json["parentCategoryName"].stringValue
        productCategoryId = json["productCategoryId"].intValue
        productCategoryName = json["productCategoryName"].stringValue
    }
}
public class SmsCouponProductRelation: SGResponseItem {
    public var couponId:Int?
    public var id:Int?
    public var productId:Int?
    /// 商品名称
    public var productName:String?
    /// 商品编码
    public var productSn:String?

    required convenience init(json:SKJSON) {
        self.init()
        couponId = json["couponId"].intValue
        id = json["id"].intValue
        productId = json["productId"].intValue
        productName = json["productName"].stringValue
        productSn = json["productSn"].stringValue
    }
}
public class SmsHomeAdvertise: SGResponseItem {
    /// 点击数
    public var clickCount:Int?
    public var endTime:String?
    public var id:Int?
    public var name:String?
    /// 备注
    public var note:String?
    /// 下单数
    public var orderCount:Int?
    public var pic:String?
    /// 排序
    public var sort:Int?
    public var startTime:String?
    /// 上下线状态：0->下线；1->上线
    public var status:Int?
    /// 轮播位置：0->PC首页轮播；1->app首页轮播
    public var type:Int?
    /// 链接地址
    public var url:String?

    required convenience init(json:SKJSON) {
        self.init()
        clickCount = json["clickCount"].intValue
        endTime = json["endTime"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        note = json["note"].stringValue
        orderCount = json["orderCount"].intValue
        pic = json["pic"].stringValue
        sort = json["sort"].intValue
        startTime = json["startTime"].stringValue
        status = json["status"].intValue
        type = json["type"].intValue
        url = json["url"].stringValue
    }
}
public class UmsIntegrationConsumeSetting: SGResponseItem {
    /// 是否可以和优惠券同用；0->不可以；1->可以
    public var couponStatus:Int?
    /// 每一元需要抵扣的积分数量
    public var deductionPerAmount:Int?
    public var id:Int?
    /// 每笔订单最高抵用百分比
    public var maxPercentPerOrder:Int?
    /// 每次使用积分最小单位100
    public var useUnit:Int?

    required convenience init(json:SKJSON) {
        self.init()
        couponStatus = json["couponStatus"].intValue
        deductionPerAmount = json["deductionPerAmount"].intValue
        id = json["id"].intValue
        maxPercentPerOrder = json["maxPercentPerOrder"].intValue
        useUnit = json["useUnit"].intValue
    }
}
public class UmsMemberInfo: SGResponseItem {
    /// 帮扶对象ID
    public var agHelpingId:Int?
    /// 帮扶对象名称
    public var agHelpingName:String?
    /// 生日
    public var birthday:String?
    /// 所做城市
    public var city:String?
    /// 佣金余额
    public var commissionBalance:Float?
    /// 注册时间
    public var createTime:String?
    /// 消费券
    public var discountBalance:Float?
    /// 性别：0->未知；1->男；2->女
    public var gender:Int?
    /// 成长值
    public var growth:Int?
    /// 历史积分数量
    public var historyIntegration:Int?
    /// 头像
    public var icon:String?
    public var id:Int?
    /// 积分
    public var integration:Int?
    /// 职业
    public var job:String?
    /// 剩余抽奖次数
    public var luckeyCount:Int?
    public var memberLevelId:Int?
    /// 昵称
    public var nickname:String?
    /// 密码
    public var password:String?
    /// 个性签名
    public var personalizedSignature:String?
    /// 手机号码
    public var phone:String?
    /// 邀请码
    public var shareCode:String?
    /// 分享地址
    public var shareUrl:String?
    /// 用户来源
    public var sourceType:Int?
    /// 帐号启用状态:0->禁用；1->启用
    public var status:Int?
    /// 邀请完整路径
    public var uplineMemberFullPath:String?
    /// 上级会员ID
    public var uplineMemberId:Int?
    /// 用户名
    public var username:String?

    required convenience init(json:SKJSON) {
        self.init()
        agHelpingId = json["agHelpingId"].intValue
        agHelpingName = json["agHelpingName"].stringValue
        birthday = json["birthday"].stringValue
        city = json["city"].stringValue
        commissionBalance = json["commissionBalance"].floatValue
        createTime = json["createTime"].stringValue
        discountBalance = json["discountBalance"].floatValue
        gender = json["gender"].intValue
        growth = json["growth"].intValue
        historyIntegration = json["historyIntegration"].intValue
        icon = json["icon"].stringValue
        id = json["id"].intValue
        integration = json["integration"].intValue
        job = json["job"].stringValue
        luckeyCount = json["luckeyCount"].intValue
        memberLevelId = json["memberLevelId"].intValue
        nickname = json["nickname"].stringValue
        password = json["password"].stringValue
        personalizedSignature = json["personalizedSignature"].stringValue
        phone = json["phone"].stringValue
        shareCode = json["shareCode"].stringValue
        shareUrl = json["shareUrl"].stringValue
        sourceType = json["sourceType"].intValue
        status = json["status"].intValue
        uplineMemberFullPath = json["uplineMemberFullPath"].stringValue
        uplineMemberId = json["uplineMemberId"].intValue
        username = json["username"].stringValue
    }
}
public class UmsMemberLevel: SGResponseItem {
    /// 每次评价获取的成长值
    public var commentGrowthPoint:Int?
    /// 是否为默认等级：0->不是；1->是
    public var defaultStatus:Int?
    /// 消费券金额
    public var discountAmount:Float?
    /// 消费券佣金配置
    public var discountCommissionConfig:String?
    /// 免运费标准
    public var freeFreightPoint:Float?
    public var growthPoint:Int?
    public var id:Int?
    public var name:String?
    public var note:String?
    /// 是否有生日特权
    public var priviledgeBirthday:Int?
    /// 是否有评论获奖励特权
    public var priviledgeComment:Int?
    /// 是否有免邮特权
    public var priviledgeFreeFreight:Int?
    /// 是否有会员价格特权
    public var priviledgeMemberPrice:Int?
    /// 是否有专享活动特权
    public var priviledgePromotion:Int?
    /// 是否有签到特权
    public var priviledgeSignIn:Int?
    /// 产品佣金配置
    public var productCommissionConfig:String?

    required convenience init(json:SKJSON) {
        self.init()
        commentGrowthPoint = json["commentGrowthPoint"].intValue
        defaultStatus = json["defaultStatus"].intValue
        discountAmount = json["discountAmount"].floatValue
        discountCommissionConfig = json["discountCommissionConfig"].stringValue
        freeFreightPoint = json["freeFreightPoint"].floatValue
        growthPoint = json["growthPoint"].intValue
        id = json["id"].intValue
        name = json["name"].stringValue
        note = json["note"].stringValue
        priviledgeBirthday = json["priviledgeBirthday"].intValue
        priviledgeComment = json["priviledgeComment"].intValue
        priviledgeFreeFreight = json["priviledgeFreeFreight"].intValue
        priviledgeMemberPrice = json["priviledgeMemberPrice"].intValue
        priviledgePromotion = json["priviledgePromotion"].intValue
        priviledgeSignIn = json["priviledgeSignIn"].intValue
        productCommissionConfig = json["productCommissionConfig"].stringValue
    }
}
public class UmsMemberReceiveAddress: SGResponseItem {
    /// 城市
    public var city:String?
    /// 是否为默认
    public var defaultStatus:Int?
    /// 详细地址(街道)
    public var detailAddress:String?
    public var id:Int?
    public var memberId:Int?
    /// 收货人名称
    public var name:String?
    public var phoneNumber:String?
    /// 邮政编码
    public var postCode:String?
    /// 省份/直辖市
    public var province:String?
    /// 区
    public var region:String?

    required convenience init(json:SKJSON) {
        self.init()
        city = json["city"].stringValue
        defaultStatus = json["defaultStatus"].intValue
        detailAddress = json["detailAddress"].stringValue
        id = json["id"].intValue
        memberId = json["memberId"].intValue
        name = json["name"].stringValue
        phoneNumber = json["phoneNumber"].stringValue
        postCode = json["postCode"].stringValue
        province = json["province"].stringValue
        region = json["region"].stringValue
    }
}
