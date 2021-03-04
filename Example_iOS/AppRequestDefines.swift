//
//  AppRequestDefines.swift
//
//
//  Created by SwaggerGenerator on 2021-03-04 14:41:55.430
//


import Foundation
import SightKit

func sgRequest(item:SGCommonUrlProtocol,result:@escaping ((SKResult)->Void)){
    let rq = SKRq().wUrl(hostUrl + item.url).wMethod(item.method)
    for element in item.paramMap.values {
        if let value = element.value , let  position = SKParamPosition.init(rawValue:element.paramPosition.rawValue) {
            rq.wParam(key: element.name, value: value, position: position)
        }
    }
    rq.resume(result)
}

public extension SGUrl.agent_commission_list_get {
    static func rq(pageNum:Int?,pageSize:Int?,status:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_commission_list_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        item.paramMap["status"]?.value = status
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.agent_czb365_post {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_czb365_post()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.agent_gift_buy_post {
    static func rq(giftOrderParam:AgGiftOrderParam?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_gift_buy_post()
        item.paramMap["giftOrderParam"]?.value = giftOrderParam
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.agent_gift_list_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_gift_list_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.agent_helping_list_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_helping_list_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.agent_level_list_get {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_level_list_get()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.agent_subline_member_list_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_subline_member_list_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.agent_team_cnt_post {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_team_cnt_post()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.agent_withdrawal_apply_post {
    static func rq(withdrawalApplyParam:AgWithdrawalApply?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_withdrawal_apply_post()
        item.paramMap["withdrawalApplyParam"]?.value = withdrawalApplyParam
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.agent_withdrawal_list_get {
    static func rq(pageNum:Int?,pageSize:Int?,status:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.agent_withdrawal_list_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        item.paramMap["status"]?.value = status
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.brand_detail_get {
    static func rq(brandId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.brand_detail_get()
        item.paramMap["brandId"]?.value = brandId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.brand_productList_get {
    static func rq(brandId:Int?,pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.brand_productList_get()
        item.paramMap["brandId"]?.value = brandId
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.brand_recommendList_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.brand_recommendList_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_alipay_delete {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_alipay_delete()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_alipay_get {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_alipay_get()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_alipay_head {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_alipay_head()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_alipay_options {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_alipay_options()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_alipay_patch {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_alipay_patch()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_alipay_post {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_alipay_post()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_alipay_put {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_alipay_put()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_test_paySuccess_delete {
    static func rq(key:String?,tradeNo:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_test_paySuccess_delete()
        item.paramMap["key"]?.value = key
        item.paramMap["tradeNo"]?.value = tradeNo
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_test_paySuccess_get {
    static func rq(key:String?,tradeNo:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_test_paySuccess_get()
        item.paramMap["key"]?.value = key
        item.paramMap["tradeNo"]?.value = tradeNo
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_test_paySuccess_head {
    static func rq(key:String?,tradeNo:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_test_paySuccess_head()
        item.paramMap["key"]?.value = key
        item.paramMap["tradeNo"]?.value = tradeNo
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_test_paySuccess_options {
    static func rq(key:String?,tradeNo:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_test_paySuccess_options()
        item.paramMap["key"]?.value = key
        item.paramMap["tradeNo"]?.value = tradeNo
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_test_paySuccess_patch {
    static func rq(key:String?,tradeNo:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_test_paySuccess_patch()
        item.paramMap["key"]?.value = key
        item.paramMap["tradeNo"]?.value = tradeNo
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_test_paySuccess_post {
    static func rq(key:String?,tradeNo:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_test_paySuccess_post()
        item.paramMap["key"]?.value = key
        item.paramMap["tradeNo"]?.value = tradeNo
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.callback_test_paySuccess_put {
    static func rq(key:String?,tradeNo:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.callback_test_paySuccess_put()
        item.paramMap["key"]?.value = key
        item.paramMap["tradeNo"]?.value = tradeNo
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.cart_add_post {
    static func rq(cartItem:OmsCartItem?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.cart_add_post()
        item.paramMap["cartItem"]?.value = cartItem
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.cart_clear_post {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.cart_clear_post()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.cart_delete_post {
    static func rq(ids:[Int]?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.cart_delete_post()
        item.paramMap["ids"]?.value = ids
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.cart_getProduct_get {
    static func rq(productId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.cart_getProduct_get()
        item.paramMap["productId"]?.value = productId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.cart_list_get {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.cart_list_get()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.cart_list_promotion_get {
    static func rq(cartIds:[Int]?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.cart_list_promotion_get()
        item.paramMap["cartIds"]?.value = cartIds
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.cart_update_attr_post {
    static func rq(cartItem:OmsCartItem?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.cart_update_attr_post()
        item.paramMap["cartItem"]?.value = cartItem
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.cart_update_quantity_get {
    static func rq(id:Int?,quantity:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.cart_update_quantity_get()
        item.paramMap["id"]?.value = id
        item.paramMap["quantity"]?.value = quantity
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.home_content_get {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.home_content_get()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.home_hotProductList_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.home_hotProductList_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.home_newProductList_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.home_newProductList_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.home_productCateList_get {
    static func rq(parentId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.home_productCateList_get()
        item.paramMap["parentId"]?.value = parentId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.home_recommendProductList_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.home_recommendProductList_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.home_share_get {
    static func rq(code:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.home_share_get()
        item.paramMap["code"]?.value = code
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.home_subjectList_get {
    static func rq(cateId:Int?,pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.home_subjectList_get()
        item.paramMap["cateId"]?.value = cateId
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.home_version_check_get {
    static func rq(platform:Int?,version:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.home_version_check_get()
        item.paramMap["platform"]?.value = platform
        item.paramMap["version"]?.value = version
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_address_add_post {
    static func rq(address:UmsMemberReceiveAddress?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_address_add_post()
        item.paramMap["address"]?.value = address
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_address_delete_post {
    static func rq(id:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_address_delete_post()
        item.paramMap["id"]?.value = id
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_address_list_get {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_address_list_get()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_address_update_post {
    static func rq(address:UmsMemberReceiveAddress?,id:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_address_update_post()
        item.paramMap["address"]?.value = address
        item.paramMap["id"]?.value = id
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_address_get {
    static func rq(id:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_address_get()
        item.paramMap["id"]?.value = id
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_attention_add_post {
    static func rq(memberBrandAttention:MemberBrandAttention?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_attention_add_post()
        item.paramMap["memberBrandAttention"]?.value = memberBrandAttention
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_attention_clear_post {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_attention_clear_post()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_attention_delete_post {
    static func rq(brandId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_attention_delete_post()
        item.paramMap["brandId"]?.value = brandId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_attention_detail_get {
    static func rq(brandId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_attention_detail_get()
        item.paramMap["brandId"]?.value = brandId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_attention_list_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_attention_list_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_coupon_add_post {
    static func rq(couponId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_coupon_add_post()
        item.paramMap["couponId"]?.value = couponId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_coupon_list_get {
    static func rq(useStatus:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_coupon_list_get()
        item.paramMap["useStatus"]?.value = useStatus
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_coupon_list_cart_get {
    static func rq(type:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_coupon_list_cart_get()
        item.paramMap["type"]?.value = type
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_coupon_listByProduct_get {
    static func rq(productId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_coupon_listByProduct_get()
        item.paramMap["productId"]?.value = productId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_coupon_listHistory_get {
    static func rq(useStatus:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_coupon_listHistory_get()
        item.paramMap["useStatus"]?.value = useStatus
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_productCollection_add_post {
    static func rq(productCollection:MemberProductCollection?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_productCollection_add_post()
        item.paramMap["productCollection"]?.value = productCollection
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_productCollection_clear_post {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_productCollection_clear_post()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_productCollection_delete_post {
    static func rq(productId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_productCollection_delete_post()
        item.paramMap["productId"]?.value = productId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_productCollection_detail_get {
    static func rq(productId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_productCollection_detail_get()
        item.paramMap["productId"]?.value = productId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_productCollection_list_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_productCollection_list_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_readHistory_clear_post {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_readHistory_clear_post()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_readHistory_create_post {
    static func rq(memberReadHistory:MemberReadHistory?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_readHistory_create_post()
        item.paramMap["memberReadHistory"]?.value = memberReadHistory
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_readHistory_delete_post {
    static func rq(ids:[String]?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_readHistory_delete_post()
        item.paramMap["ids"]?.value = ids
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.member_readHistory_list_get {
    static func rq(pageNum:Int?,pageSize:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.member_readHistory_list_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.order_cancelOrder_post {
    static func rq(orderId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.order_cancelOrder_post()
        item.paramMap["orderId"]?.value = orderId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.order_cancelTimeOutOrder_post {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.order_cancelTimeOutOrder_post()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.order_cancelUserOrder_post {
    static func rq(orderId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.order_cancelUserOrder_post()
        item.paramMap["orderId"]?.value = orderId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.order_confirmReceiveOrder_post {
    static func rq(orderId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.order_confirmReceiveOrder_post()
        item.paramMap["orderId"]?.value = orderId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.order_deleteOrder_post {
    static func rq(orderId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.order_deleteOrder_post()
        item.paramMap["orderId"]?.value = orderId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.order_detail_get {
    static func rq(orderId:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.order_detail_get()
        item.paramMap["orderId"]?.value = orderId
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.order_generateConfirmOrder_post {
    static func rq(confirmOrderParam:ConfirmOrderParam?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.order_generateConfirmOrder_post()
        item.paramMap["confirmOrderParam"]?.value = confirmOrderParam
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.order_generateOrder_post {
    static func rq(orderParam:OrderParam?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.order_generateOrder_post()
        item.paramMap["orderParam"]?.value = orderParam
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.order_list_get {
    static func rq(pageNum:Int?,pageSize:Int?,status:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.order_list_get()
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        item.paramMap["status"]?.value = status
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.payment_generatePaymentInfo_post {
    static func rq(paymentParam:PaymentParam?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.payment_generatePaymentInfo_post()
        item.paramMap["paymentParam"]?.value = paymentParam
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.product_categoryTreeList_get {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.product_categoryTreeList_get()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.product_detail_get {
    static func rq(id:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.product_detail_get()
        item.paramMap["id"]?.value = id
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.product_search_get {
    static func rq(brandId:Int?,keyword:String?,pageNum:Int?,pageSize:Int?,productCategoryId:Int?,sort:Int?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.product_search_get()
        item.paramMap["brandId"]?.value = brandId
        item.paramMap["keyword"]?.value = keyword
        item.paramMap["pageNum"]?.value = pageNum
        item.paramMap["pageSize"]?.value = pageSize
        item.paramMap["productCategoryId"]?.value = productCategoryId
        item.paramMap["sort"]?.value = sort
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.returnApply_create_post {
    static func rq(returnApply:OmsOrderReturnApplyParam?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.returnApply_create_post()
        item.paramMap["returnApply"]?.value = returnApply
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.sso_getAuthCode_get {
    static func rq(telephone:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.sso_getAuthCode_get()
        item.paramMap["telephone"]?.value = telephone
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.sso_info_get {
    static func rq(name:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.sso_info_get()
        item.paramMap["name"]?.value = name
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.sso_login_post {
    static func rq(password:String?,telephone:String?,username:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.sso_login_post()
        item.paramMap["password"]?.value = password
        item.paramMap["telephone"]?.value = telephone
        item.paramMap["username"]?.value = username
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.sso_refreshToken_get {
    static func rq(result:@escaping ((SKResult)->Void)){
        let item = SGUrl.sso_refreshToken_get()
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.sso_register_post {
    static func rq(authCode:String?,password:String?,shareCode:String?,telephone:String?,username:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.sso_register_post()
        item.paramMap["authCode"]?.value = authCode
        item.paramMap["password"]?.value = password
        item.paramMap["shareCode"]?.value = shareCode
        item.paramMap["telephone"]?.value = telephone
        item.paramMap["username"]?.value = username
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.sso_updatePassword_post {
    static func rq(authCode:String?,password:String?,telephone:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.sso_updatePassword_post()
        item.paramMap["authCode"]?.value = authCode
        item.paramMap["password"]?.value = password
        item.paramMap["telephone"]?.value = telephone
        sgRequest(item: item, result: result)
    }
}
public extension SGUrl.sso_updatePhone_post {
    static func rq(authCode:String?,telephone:String?,result:@escaping ((SKResult)->Void)){
        let item = SGUrl.sso_updatePhone_post()
        item.paramMap["authCode"]?.value = authCode
        item.paramMap["telephone"]?.value = telephone
        sgRequest(item: item, result: result)
    }
}
