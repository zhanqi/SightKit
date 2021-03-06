//
//  AppModelDefines.swift
//
//
//  Created by SwaggerGenerator on 2021-03-06 09:17:39.839
//


import Foundation
import SightKit

public class CommonResult: SGResponseItem {
    /// 提示信息
    public var message:String?
    public var data:Any?
    /// 状态码
    public var code:Int?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        data = json["data"].object
        code = json["code"].intValue
    }
}
public class PmsProductAttribute: SGResponseItem {
    /// 是否支持手动新增；0->不支持；1->支持
    public var handAddStatus:Int?
    public var name:String?
    public var productAttributeCategoryId:Int?
    /// 检索类型；0->不需要进行检索；1->关键字检索；2->范围检索
    public var searchType:Int?
    public var id:Int?
    /// 分类筛选样式：1->普通；1->颜色
    public var filterType:Int?
    /// 属性录入方式：0->手工录入；1->从列表中选取
    public var inputType:Int?
    /// 相同属性产品是否关联；0->不关联；1->关联
    public var relatedStatus:Int?
    /// 排序字段：最高的可以单独上传图片
    public var sort:Int?
    /// 属性的类型；0->规格；1->参数
    public var type:Int?
    /// 属性选择类型：0->唯一；1->单选；2->多选
    public var selectType:Int?
    /// 可选值列表，以逗号隔开
    public var inputList:String?

    required convenience init(json:SKJSON) {
        self.init()
        handAddStatus = json["handAddStatus"].intValue
        name = json["name"].stringValue
        productAttributeCategoryId = json["productAttributeCategoryId"].intValue
        searchType = json["searchType"].intValue
        id = json["id"].intValue
        filterType = json["filterType"].intValue
        inputType = json["inputType"].intValue
        relatedStatus = json["relatedStatus"].intValue
        sort = json["sort"].intValue
        type = json["type"].intValue
        selectType = json["selectType"].intValue
        inputList = json["inputList"].stringValue
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
public class CommonResult_List_SmsCouponHistory: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:[SmsCouponHistory] = []

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(SmsCouponHistory(json: value))
        }
    }
}
public class CommonResult_CommonPage_OmsOrderDetail: SGResponseItem {
    /// 状态码
    public var code:Int?
    /// 提示信息
    public var message:String?
    public var data:CommonPage_OmsOrderDetail?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        message = json["message"].stringValue
        data = CommonPage_OmsOrderDetail(json:json["data"])
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
public class CommonResult_List_SmsCoupon: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:[SmsCoupon] = []

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(SmsCoupon(json: value))
        }
    }
}
public class MemberBrandAttention: SGResponseItem {
    public var brandCity:String?
    public var brandName:String?
    public var brandLogo:String?
    public var memberId:Int?
    public var id:String?
    public var memberNickname:String?
    public var createTime:String?
    public var memberIcon:String?
    public var brandId:Int?

    required convenience init(json:SKJSON) {
        self.init()
        brandCity = json["brandCity"].stringValue
        brandName = json["brandName"].stringValue
        brandLogo = json["brandLogo"].stringValue
        memberId = json["memberId"].intValue
        id = json["id"].stringValue
        memberNickname = json["memberNickname"].stringValue
        createTime = json["createTime"].stringValue
        memberIcon = json["memberIcon"].stringValue
        brandId = json["brandId"].intValue
    }
}
public class CommonPage_AgWithdrawal: SGResponseItem {
    /// 分页数据
    public var list:[AgWithdrawal] = []
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?
    /// 当前页码
    public var pageNum:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(AgWithdrawal(json: value))
        }
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
        pageNum = json["pageNum"].intValue
    }
}
public class OmsOrderItem: SGResponseItem {
    public var productPic:String?
    public var id:Int?
    public var productName:String?
    /// 商品销售属性:[{'key':'颜色','value':'颜色'},{'key':'容量','value':'4G'}]
    public var productAttr:String?
    /// 商品分类id
    public var productCategoryId:Int?
    /// 积分优惠分解金额
    public var integrationAmount:Float?
    public var productSn:String?
    public var giftIntegration:Int?
    /// 商品促销分解金额
    public var promotionAmount:Float?
    public var productId:Int?
    /// 优惠券优惠分解金额
    public var couponAmount:Float?
    public var giftGrowth:Int?
    /// 销售价格
    public var productPrice:Float?
    /// 商品sku条码
    public var productSkuCode:String?
    /// 商品sku编号
    public var productSkuId:Int?
    /// 订单id
    public var orderId:Int?
    public var productBrand:String?
    /// 该商品经过优惠后的分解金额
    public var realAmount:Float?
    /// 购买数量
    public var productQuantity:Int?
    /// 商品促销名称
    public var promotionName:String?
    /// 消费券分解金额
    public var discountAmount:Float?
    /// 订单编号
    public var orderSn:String?

    required convenience init(json:SKJSON) {
        self.init()
        productPic = json["productPic"].stringValue
        id = json["id"].intValue
        productName = json["productName"].stringValue
        productAttr = json["productAttr"].stringValue
        productCategoryId = json["productCategoryId"].intValue
        integrationAmount = json["integrationAmount"].floatValue
        productSn = json["productSn"].stringValue
        giftIntegration = json["giftIntegration"].intValue
        promotionAmount = json["promotionAmount"].floatValue
        productId = json["productId"].intValue
        couponAmount = json["couponAmount"].floatValue
        giftGrowth = json["giftGrowth"].intValue
        productPrice = json["productPrice"].floatValue
        productSkuCode = json["productSkuCode"].stringValue
        productSkuId = json["productSkuId"].intValue
        orderId = json["orderId"].intValue
        productBrand = json["productBrand"].stringValue
        realAmount = json["realAmount"].floatValue
        productQuantity = json["productQuantity"].intValue
        promotionName = json["promotionName"].stringValue
        discountAmount = json["discountAmount"].floatValue
        orderSn = json["orderSn"].stringValue
    }
}
public class UmsIntegrationConsumeSetting: SGResponseItem {
    public var id:Int?
    /// 每次使用积分最小单位100
    public var useUnit:Int?
    /// 每一元需要抵扣的积分数量
    public var deductionPerAmount:Int?
    /// 每笔订单最高抵用百分比
    public var maxPercentPerOrder:Int?
    /// 是否可以和优惠券同用；0->不可以；1->可以
    public var couponStatus:Int?

    required convenience init(json:SKJSON) {
        self.init()
        id = json["id"].intValue
        useUnit = json["useUnit"].intValue
        deductionPerAmount = json["deductionPerAmount"].intValue
        maxPercentPerOrder = json["maxPercentPerOrder"].intValue
        couponStatus = json["couponStatus"].intValue
    }
}
public class AgGift: SGResponseItem {
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    /// 画册图片，连产品图片限制为5张，以逗号分割
    public var albumPics:String?
    /// ID
    public var id:Int?
    /// 移动端网页详情
    public var detailMobileHtml:String?
    /// 图片
    public var pic:String?
    /// 名称
    public var name:String?
    /// 描述
    public var description_str:String?
    /// 销量
    public var sale:Int?
    /// 副标题
    public var subTitle:String?
    /// 排序
    public var sort:Int?
    /// 赠送消费券金额
    public var giftDiscountAmount:Float?
    /// 价格
    public var price:Float?
    /// 分润金额
    public var profit:Float?
    /// 上架状态：0->下架；1->上架
    public var publishStatus:Int?

    required convenience init(json:SKJSON) {
        self.init()
        deleteStatus = json["deleteStatus"].intValue
        albumPics = json["albumPics"].stringValue
        id = json["id"].intValue
        detailMobileHtml = json["detailMobileHtml"].stringValue
        pic = json["pic"].stringValue
        name = json["name"].stringValue
        description_str = json["description_str"].stringValue
        sale = json["sale"].intValue
        subTitle = json["subTitle"].stringValue
        sort = json["sort"].intValue
        giftDiscountAmount = json["giftDiscountAmount"].floatValue
        price = json["price"].floatValue
        profit = json["profit"].floatValue
        publishStatus = json["publishStatus"].intValue
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
public class CommonResult_List_UmsMemberReceiveAddress: SGResponseItem {
    /// 状态码
    public var code:Int?
    /// 提示信息
    public var message:String?
    public var data:[UmsMemberReceiveAddress] = []

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        message = json["message"].stringValue
        for value in json["data"].arrayValue{
            data.append(UmsMemberReceiveAddress(json: value))
        }
    }
}
public class MemberProductCollection: SGResponseItem {
    public var productPic:String?
    public var productPrice:String?
    public var productSubTitle:String?
    public var id:String?
    public var productId:Int?
    public var memberId:Int?
    public var productName:String?
    public var createTime:String?
    public var memberIcon:String?
    public var memberNickname:String?

    required convenience init(json:SKJSON) {
        self.init()
        productPic = json["productPic"].stringValue
        productPrice = json["productPrice"].stringValue
        productSubTitle = json["productSubTitle"].stringValue
        id = json["id"].stringValue
        productId = json["productId"].intValue
        memberId = json["memberId"].intValue
        productName = json["productName"].stringValue
        createTime = json["createTime"].stringValue
        memberIcon = json["memberIcon"].stringValue
        memberNickname = json["memberNickname"].stringValue
    }
}
public class CommonPage_AgCommission: SGResponseItem {
    /// 分页数据
    public var list:[AgCommission] = []
    /// 总页数
    public var totalPage:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 当前页码
    public var pageNum:Int?
    /// 总条数
    public var total:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["list"].arrayValue{
            list.append(AgCommission(json: value))
        }
        totalPage = json["totalPage"].intValue
        pageSize = json["pageSize"].intValue
        pageNum = json["pageNum"].intValue
        total = json["total"].intValue
    }
}
public class CommonResult_OmsOrderDetail: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:OmsOrderDetail?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = OmsOrderDetail(json:json["data"])
    }
}
public class CommonResult_List_PmsProduct: SGResponseItem {
    public var data:[PmsProduct] = []
    /// 状态码
    public var code:Int?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["data"].arrayValue{
            data.append(PmsProduct(json: value))
        }
        code = json["code"].intValue
        message = json["message"].stringValue
    }
}
public class CommonResult_PmsBrand: SGResponseItem {
    /// 状态码
    public var code:Int?
    /// 提示信息
    public var message:String?
    public var data:PmsBrand?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        message = json["message"].stringValue
        data = PmsBrand(json:json["data"])
    }
}
public class CommonResult_string: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:String?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = json["data"].stringValue
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
public class SmsCouponHistory: SGResponseItem {
    /// 订单编号
    public var orderId:Int?
    public var memberId:Int?
    /// 使用时间
    public var useTime:String?
    public var id:Int?
    public var couponCode:String?
    /// 获取类型：0->后台赠送；1->主动获取
    public var getType:Int?
    /// 领取人昵称
    public var memberNickname:String?
    public var createTime:String?
    /// 订单号码
    public var orderSn:String?
    /// 使用状态：0->未使用；1->已使用；2->已过期
    public var useStatus:Int?
    public var couponId:Int?

    required convenience init(json:SKJSON) {
        self.init()
        orderId = json["orderId"].intValue
        memberId = json["memberId"].intValue
        useTime = json["useTime"].stringValue
        id = json["id"].intValue
        couponCode = json["couponCode"].stringValue
        getType = json["getType"].intValue
        memberNickname = json["memberNickname"].stringValue
        createTime = json["createTime"].stringValue
        orderSn = json["orderSn"].stringValue
        useStatus = json["useStatus"].intValue
        couponId = json["couponId"].intValue
    }
}
public class CmsSubject: SGResponseItem {
    /// 关联产品数量
    public var productCount:Int?
    public var collectCount:Int?
    public var content:String?
    public var id:Int?
    /// 画册图片用逗号分割
    public var albumPics:String?
    /// 专题分类名称
    public var categoryName:String?
    /// 专题主图
    public var pic:String?
    public var description_str:String?
    public var title:String?
    public var categoryId:Int?
    public var readCount:Int?
    /// 转发数
    public var forwardCount:Int?
    public var createTime:String?
    public var recommendStatus:Int?
    public var commentCount:Int?
    /// 显示状态：0->不显示；1->显示
    public var showStatus:Int?

    required convenience init(json:SKJSON) {
        self.init()
        productCount = json["productCount"].intValue
        collectCount = json["collectCount"].intValue
        content = json["content"].stringValue
        id = json["id"].intValue
        albumPics = json["albumPics"].stringValue
        categoryName = json["categoryName"].stringValue
        pic = json["pic"].stringValue
        description_str = json["description_str"].stringValue
        title = json["title"].stringValue
        categoryId = json["categoryId"].intValue
        readCount = json["readCount"].intValue
        forwardCount = json["forwardCount"].intValue
        createTime = json["createTime"].stringValue
        recommendStatus = json["recommendStatus"].intValue
        commentCount = json["commentCount"].intValue
        showStatus = json["showStatus"].intValue
    }
}
public class CommonResult_CommonPage_MemberReadHistory: SGResponseItem {
    /// 状态码
    public var code:Int?
    /// 提示信息
    public var message:String?
    public var data:CommonPage_MemberReadHistory?

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        message = json["message"].stringValue
        data = CommonPage_MemberReadHistory(json:json["data"])
    }
}
public class CartProduct: SGResponseItem {
    /// 市场价
    public var originalPrice:Float?
    /// 上架状态：0->下架；1->上架
    public var publishStatus:Int?
    /// 促销开始时间
    public var promotionStartTime:String?
    /// 商品描述
    public var description_str:String?
    /// 促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购
    public var promotionType:Int?
    /// 赠送的成长值
    public var giftGrowth:Int?
    public var price:Float?
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    /// 促销结束时间
    public var promotionEndTime:String?
    /// 库存
    public var stock:Int?
    public var feightTemplateId:Int?
    /// 审核状态：0->未审核；1->审核通过
    public var verifyStatus:Int?
    public var productAttributeCategoryId:Int?
    /// 移动端网页详情
    public var detailMobileHtml:String?
    /// 销量
    public var sale:Int?
    public var id:Int?
    /// 商品分类名称
    public var productCategoryName:String?
    /// 货号
    public var productSn:String?
    /// 推荐状态；0->不推荐；1->推荐
    public var recommandStatus:Int?
    public var keywords:String?
    /// 副标题
    public var subTitle:String?
    /// 赠送的积分
    public var giftPoint:Int?
    public var detailDesc:String?
    /// 排序
    public var sort:Int?
    public var skuStockList:[PmsSkuStock] = []
    /// 产品详情网页内容
    public var detailHtml:String?
    /// 画册图片，连产品图片限制为5张，以逗号分割
    public var albumPics:String?
    public var productCategoryId:Int?
    /// 库存预警值
    public var lowStock:Int?
    /// 新品状态:0->不是新品；1->新品
    public var newStatus:Int?
    public var productAttributeList:[PmsProductAttribute] = []
    /// 单位
    public var unit:String?
    public var brandId:Int?
    /// 活动限购数量
    public var promotionPerLimit:Int?
    /// 限制使用的积分数
    public var usePointLimit:Int?
    /// 促销价格
    public var promotionPrice:Float?
    public var name:String?
    /// 是否为预告商品：0->不是；1->是
    public var previewStatus:Int?
    /// 以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮
    public var serviceIds:String?
    public var detailTitle:String?
    /// 品牌名称
    public var brandName:String?
    public var pic:String?
    /// 折扣金额（可抵扣）
    public var discountAmount:Float?
    /// 商品重量，默认为克
    public var weight:Float?
    public var note:String?

    required convenience init(json:SKJSON) {
        self.init()
        originalPrice = json["originalPrice"].floatValue
        publishStatus = json["publishStatus"].intValue
        promotionStartTime = json["promotionStartTime"].stringValue
        description_str = json["description_str"].stringValue
        promotionType = json["promotionType"].intValue
        giftGrowth = json["giftGrowth"].intValue
        price = json["price"].floatValue
        deleteStatus = json["deleteStatus"].intValue
        promotionEndTime = json["promotionEndTime"].stringValue
        stock = json["stock"].intValue
        feightTemplateId = json["feightTemplateId"].intValue
        verifyStatus = json["verifyStatus"].intValue
        productAttributeCategoryId = json["productAttributeCategoryId"].intValue
        detailMobileHtml = json["detailMobileHtml"].stringValue
        sale = json["sale"].intValue
        id = json["id"].intValue
        productCategoryName = json["productCategoryName"].stringValue
        productSn = json["productSn"].stringValue
        recommandStatus = json["recommandStatus"].intValue
        keywords = json["keywords"].stringValue
        subTitle = json["subTitle"].stringValue
        giftPoint = json["giftPoint"].intValue
        detailDesc = json["detailDesc"].stringValue
        sort = json["sort"].intValue
        for value in json["skuStockList"].arrayValue{
            skuStockList.append(PmsSkuStock(json: value))
        }
        detailHtml = json["detailHtml"].stringValue
        albumPics = json["albumPics"].stringValue
        productCategoryId = json["productCategoryId"].intValue
        lowStock = json["lowStock"].intValue
        newStatus = json["newStatus"].intValue
        for value in json["productAttributeList"].arrayValue{
            productAttributeList.append(PmsProductAttribute(json: value))
        }
        unit = json["unit"].stringValue
        brandId = json["brandId"].intValue
        promotionPerLimit = json["promotionPerLimit"].intValue
        usePointLimit = json["usePointLimit"].intValue
        promotionPrice = json["promotionPrice"].floatValue
        name = json["name"].stringValue
        previewStatus = json["previewStatus"].intValue
        serviceIds = json["serviceIds"].stringValue
        detailTitle = json["detailTitle"].stringValue
        brandName = json["brandName"].stringValue
        pic = json["pic"].stringValue
        discountAmount = json["discountAmount"].floatValue
        weight = json["weight"].floatValue
        note = json["note"].stringValue
    }
}
public class CartPromotionItem: SGResponseItem {
    public var promotionMessage:String?
    public var productBrand:String?
    /// 是否删除
    public var deleteStatus:Int?
    /// 会员昵称
    public var memberNickname:String?
    /// 修改时间
    public var modifyDate:String?
    public var integration:Int?
    /// 商品主图
    public var productPic:String?
    public var productSn:String?
    /// 购买数量
    public var quantity:Int?
    public var reduceAmount:Float?
    public var memberId:Int?
    public var productId:Int?
    public var realStock:Int?
    /// 商品sku条码
    public var productSkuCode:String?
    /// 商品销售属性:[{'key':'颜色','value':'颜色'},{'key':'容量','value':'4G'}]
    public var productAttr:String?
    /// 商品名称
    public var productName:String?
    public var productSkuId:Int?
    /// 商品分类
    public var productCategoryId:Int?
    /// 添加到购物车的价格
    public var price:Float?
    public var discountAmount:Float?
    public var growth:Int?
    public var id:Int?
    /// 创建时间
    public var createDate:String?
    /// 商品副标题（卖点）
    public var productSubTitle:String?

    required convenience init(json:SKJSON) {
        self.init()
        promotionMessage = json["promotionMessage"].stringValue
        productBrand = json["productBrand"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        memberNickname = json["memberNickname"].stringValue
        modifyDate = json["modifyDate"].stringValue
        integration = json["integration"].intValue
        productPic = json["productPic"].stringValue
        productSn = json["productSn"].stringValue
        quantity = json["quantity"].intValue
        reduceAmount = json["reduceAmount"].floatValue
        memberId = json["memberId"].intValue
        productId = json["productId"].intValue
        realStock = json["realStock"].intValue
        productSkuCode = json["productSkuCode"].stringValue
        productAttr = json["productAttr"].stringValue
        productName = json["productName"].stringValue
        productSkuId = json["productSkuId"].intValue
        productCategoryId = json["productCategoryId"].intValue
        price = json["price"].floatValue
        discountAmount = json["discountAmount"].floatValue
        growth = json["growth"].intValue
        id = json["id"].intValue
        createDate = json["createDate"].stringValue
        productSubTitle = json["productSubTitle"].stringValue
    }
}
public class OmsCartItem: SGResponseItem {
    public var productBrand:String?
    /// 是否删除
    public var deleteStatus:Int?
    /// 会员昵称
    public var memberNickname:String?
    /// 修改时间
    public var modifyDate:String?
    /// 商品主图
    public var productPic:String?
    public var productSn:String?
    /// 购买数量
    public var quantity:Int?
    public var memberId:Int?
    public var productId:Int?
    /// 商品sku条码
    public var productSkuCode:String?
    /// 商品销售属性:[{'key':'颜色','value':'颜色'},{'key':'容量','value':'4G'}]
    public var productAttr:String?
    /// 商品名称
    public var productName:String?
    public var productSkuId:Int?
    /// 商品分类
    public var productCategoryId:Int?
    /// 添加到购物车的价格
    public var price:Float?
    public var id:Int?
    /// 创建时间
    public var createDate:String?
    /// 商品副标题（卖点）
    public var productSubTitle:String?

    required convenience init(json:SKJSON) {
        self.init()
        productBrand = json["productBrand"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        memberNickname = json["memberNickname"].stringValue
        modifyDate = json["modifyDate"].stringValue
        productPic = json["productPic"].stringValue
        productSn = json["productSn"].stringValue
        quantity = json["quantity"].intValue
        memberId = json["memberId"].intValue
        productId = json["productId"].intValue
        productSkuCode = json["productSkuCode"].stringValue
        productAttr = json["productAttr"].stringValue
        productName = json["productName"].stringValue
        productSkuId = json["productSkuId"].intValue
        productCategoryId = json["productCategoryId"].intValue
        price = json["price"].floatValue
        id = json["id"].intValue
        createDate = json["createDate"].stringValue
        productSubTitle = json["productSubTitle"].stringValue
    }
}
public class PmsProductCategory: SGResponseItem {
    public var id:Int?
    public var productCount:Int?
    public var productUnit:String?
    /// 分类级别：0->1级；1->2级
    public var level:Int?
    public var name:String?
    /// 描述
    public var description_str:String?
    /// 是否显示在导航栏：0->不显示；1->显示
    public var navStatus:Int?
    /// 图标
    public var icon:String?
    /// 显示状态：0->不显示；1->显示
    public var showStatus:Int?
    /// 上机分类的编号：0表示一级分类
    public var parentId:Int?
    public var sort:Int?
    public var keywords:String?

    required convenience init(json:SKJSON) {
        self.init()
        id = json["id"].intValue
        productCount = json["productCount"].intValue
        productUnit = json["productUnit"].stringValue
        level = json["level"].intValue
        name = json["name"].stringValue
        description_str = json["description_str"].stringValue
        navStatus = json["navStatus"].intValue
        icon = json["icon"].stringValue
        showStatus = json["showStatus"].intValue
        parentId = json["parentId"].intValue
        sort = json["sort"].intValue
        keywords = json["keywords"].stringValue
    }
}
public class CommonResult_CommonPage_PmsProduct: SGResponseItem {
    public var data:CommonPage_PmsProduct?
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?

    required convenience init(json:SKJSON) {
        self.init()
        data = CommonPage_PmsProduct(json:json["data"])
        message = json["message"].stringValue
        code = json["code"].intValue
    }
}
public class AgHelping: SGResponseItem {
    /// 现就业状态
    public var workState:String?
    /// 年龄
    public var age:Int?
    /// 政治面貌
    public var zzmm:String?
    /// 低保/低保边缘
    public var dbby:String?
    /// 学历
    public var xl:String?
    /// 伤残等级
    public var scdj:String?
    /// 性别 1:男 2:女
    public var sex:Int?
    /// 民族
    public var mz:String?
    /// 家庭基本情况
    public var homeInfo:String?
    /// 所在部队
    public var ssbd:String?
    /// 人员类别
    public var type:String?
    public var name:String?
    /// 困难原因
    public var knReason:String?
    /// 身份证
    public var idCard:String?
    /// 推荐单位
    public var tjdw:String?
    /// 家庭住址
    public var homeAddress:String?
    /// 街道
    public var jd:String?
    /// 军龄
    public var jage:Int?
    /// 是否显示1:显示 0:不显示
    public var viewState:Int?
    public var id:Int?
    /// 退役时间
    public var tysj:String?
    /// 联系电话
    public var tel:String?
    /// 伤残证号
    public var sczh:String?

    required convenience init(json:SKJSON) {
        self.init()
        workState = json["workState"].stringValue
        age = json["age"].intValue
        zzmm = json["zzmm"].stringValue
        dbby = json["dbby"].stringValue
        xl = json["xl"].stringValue
        scdj = json["scdj"].stringValue
        sex = json["sex"].intValue
        mz = json["mz"].stringValue
        homeInfo = json["homeInfo"].stringValue
        ssbd = json["ssbd"].stringValue
        type = json["type"].stringValue
        name = json["name"].stringValue
        knReason = json["knReason"].stringValue
        idCard = json["idCard"].stringValue
        tjdw = json["tjdw"].stringValue
        homeAddress = json["homeAddress"].stringValue
        jd = json["jd"].stringValue
        jage = json["jage"].intValue
        viewState = json["viewState"].intValue
        id = json["id"].intValue
        tysj = json["tysj"].stringValue
        tel = json["tel"].stringValue
        sczh = json["sczh"].stringValue
    }
}
public class CommonResult_List_PmsBrand: SGResponseItem {
    public var data:[PmsBrand] = []
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["data"].arrayValue{
            data.append(PmsBrand(json: value))
        }
        message = json["message"].stringValue
        code = json["code"].intValue
    }
}
public class CommonPage_AgGift: SGResponseItem {
    /// 总页数
    public var totalPage:Int?
    /// 当前页码
    public var pageNum:Int?
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 分页数据
    public var list:[AgGift] = []

    required convenience init(json:SKJSON) {
        self.init()
        totalPage = json["totalPage"].intValue
        pageNum = json["pageNum"].intValue
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        for value in json["list"].arrayValue{
            list.append(AgGift(json: value))
        }
    }
}
public class UmsMemberInfo: SGResponseItem {
    /// 个性签名
    public var personalizedSignature:String?
    /// 历史积分数量
    public var historyIntegration:Int?
    /// 成长值
    public var growth:Int?
    /// 消费券
    public var discountBalance:Float?
    public var id:Int?
    /// 上级会员ID
    public var uplineMemberId:Int?
    /// 生日
    public var birthday:String?
    /// 密码
    public var password:String?
    /// 邀请码
    public var shareCode:String?
    /// 性别：0->未知；1->男；2->女
    public var gender:Int?
    /// 手机号码
    public var phone:String?
    /// 职业
    public var job:String?
    /// 分享地址
    public var shareUrl:String?
    /// 头像
    public var icon:String?
    /// 所做城市
    public var city:String?
    /// 帐号启用状态:0->禁用；1->启用
    public var status:Int?
    /// 剩余抽奖次数
    public var luckeyCount:Int?
    /// 邀请完整路径
    public var uplineMemberFullPath:String?
    /// 帮扶对象名称
    public var agHelpingName:String?
    public var memberLevelId:Int?
    /// 昵称
    public var nickname:String?
    /// 用户名
    public var username:String?
    /// 用户来源
    public var sourceType:Int?
    /// 佣金余额
    public var commissionBalance:Float?
    /// 积分
    public var integration:Int?
    /// 注册时间
    public var createTime:String?
    /// 帮扶对象ID
    public var agHelpingId:Int?

    required convenience init(json:SKJSON) {
        self.init()
        personalizedSignature = json["personalizedSignature"].stringValue
        historyIntegration = json["historyIntegration"].intValue
        growth = json["growth"].intValue
        discountBalance = json["discountBalance"].floatValue
        id = json["id"].intValue
        uplineMemberId = json["uplineMemberId"].intValue
        birthday = json["birthday"].stringValue
        password = json["password"].stringValue
        shareCode = json["shareCode"].stringValue
        gender = json["gender"].intValue
        phone = json["phone"].stringValue
        job = json["job"].stringValue
        shareUrl = json["shareUrl"].stringValue
        icon = json["icon"].stringValue
        city = json["city"].stringValue
        status = json["status"].intValue
        luckeyCount = json["luckeyCount"].intValue
        uplineMemberFullPath = json["uplineMemberFullPath"].stringValue
        agHelpingName = json["agHelpingName"].stringValue
        memberLevelId = json["memberLevelId"].intValue
        nickname = json["nickname"].stringValue
        username = json["username"].stringValue
        sourceType = json["sourceType"].intValue
        commissionBalance = json["commissionBalance"].floatValue
        integration = json["integration"].intValue
        createTime = json["createTime"].stringValue
        agHelpingId = json["agHelpingId"].intValue
    }
}
public class CommonResult_List_PmsProductCategoryNode: SGResponseItem {
    /// 状态码
    public var code:Int?
    /// 提示信息
    public var message:String?
    public var data:[PmsProductCategoryNode] = []

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        message = json["message"].stringValue
        for value in json["data"].arrayValue{
            data.append(PmsProductCategoryNode(json: value))
        }
    }
}
public class AgWithdrawal: SGResponseItem {
    /// ID
    public var id:Int?
    /// 账号
    public var account:String?
    /// 状态 0:审核中 1:已完成
    public var status:Int?
    /// 创建时间
    public var createTime:String?
    /// 支行信息
    public var bankBranch:String?
    /// 会员ID
    public var memberId:Int?
    /// 类型 1:银行卡 2:支付宝
    public var type:Int?
    /// 金额
    public var amount:Float?
    /// 银行卡号
    public var bankNo:String?
    /// 修改时间
    public var updateTime:String?
    /// 银行名称
    public var bankName:String?
    /// 真实姓名
    public var realName:String?

    required convenience init(json:SKJSON) {
        self.init()
        id = json["id"].intValue
        account = json["account"].stringValue
        status = json["status"].intValue
        createTime = json["createTime"].stringValue
        bankBranch = json["bankBranch"].stringValue
        memberId = json["memberId"].intValue
        type = json["type"].intValue
        amount = json["amount"].floatValue
        bankNo = json["bankNo"].stringValue
        updateTime = json["updateTime"].stringValue
        bankName = json["bankName"].stringValue
        realName = json["realName"].stringValue
    }
}
public class CommonPage_object: SGResponseItem {
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 当前页码
    public var pageNum:Int?
    /// 分页数据
    public var list:[Any] = []
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        pageNum = json["pageNum"].intValue
        for value in json["list"].arrayValue{
            list.append(value.object)
        }
        totalPage = json["totalPage"].intValue
    }
}
public class OmsOrderReturnApplyParam: SGResponseItem {
    /// 商品品牌
    public var productBrand:String?
    /// 原因
    public var reason:String?
    /// 退货人电话
    public var returnPhone:String?
    /// 商品实际支付单价
    public var productRealPrice:Float?
    /// 商品图片
    public var productPic:String?
    /// 描述
    public var description_str:String?
    /// 退货数量
    public var productCount:Int?
    /// 退货商品id
    public var productId:Int?
    /// 商品销售属性：颜色：红色；尺码：xl;
    public var productAttr:String?
    /// 商品单价
    public var productPrice:Float?
    /// 商品名称
    public var productName:String?
    /// 退货人姓名
    public var returnName:String?
    /// 订单编号
    public var orderSn:String?
    /// 订单id
    public var orderId:Int?
    /// 会员用户名
    public var memberUsername:String?
    /// 凭证图片，以逗号隔开
    public var proofPics:String?

    required convenience init(json:SKJSON) {
        self.init()
        productBrand = json["productBrand"].stringValue
        reason = json["reason"].stringValue
        returnPhone = json["returnPhone"].stringValue
        productRealPrice = json["productRealPrice"].floatValue
        productPic = json["productPic"].stringValue
        description_str = json["description_str"].stringValue
        productCount = json["productCount"].intValue
        productId = json["productId"].intValue
        productAttr = json["productAttr"].stringValue
        productPrice = json["productPrice"].floatValue
        productName = json["productName"].stringValue
        returnName = json["returnName"].stringValue
        orderSn = json["orderSn"].stringValue
        orderId = json["orderId"].intValue
        memberUsername = json["memberUsername"].stringValue
        proofPics = json["proofPics"].stringValue
    }
}
public class CommonResult_MemberBrandAttention: SGResponseItem {
    public var data:MemberBrandAttention?
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?

    required convenience init(json:SKJSON) {
        self.init()
        data = MemberBrandAttention(json:json["data"])
        message = json["message"].stringValue
        code = json["code"].intValue
    }
}
public class PmsProduct: SGResponseItem {
    /// 排序
    public var sort:Int?
    public var name:String?
    public var id:Int?
    /// 移动端网页详情
    public var detailMobileHtml:String?
    /// 库存预警值
    public var lowStock:Int?
    public var pic:String?
    /// 促销开始时间
    public var promotionStartTime:String?
    public var detailDesc:String?
    /// 货号
    public var productSn:String?
    /// 商品重量，默认为克
    public var weight:Float?
    /// 促销价格
    public var promotionPrice:Float?
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    public var brandId:Int?
    /// 品牌名称
    public var brandName:String?
    /// 库存
    public var stock:Int?
    /// 促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购
    public var promotionType:Int?
    /// 赠送的成长值
    public var giftGrowth:Int?
    /// 折扣金额（可抵扣）
    public var discountAmount:Float?
    /// 产品详情网页内容
    public var detailHtml:String?
    /// 审核状态：0->未审核；1->审核通过
    public var verifyStatus:Int?
    /// 促销结束时间
    public var promotionEndTime:String?
    public var productAttributeCategoryId:Int?
    public var detailTitle:String?
    /// 副标题
    public var subTitle:String?
    /// 商品分类名称
    public var productCategoryName:String?
    /// 推荐状态；0->不推荐；1->推荐
    public var recommandStatus:Int?
    /// 赠送的积分
    public var giftPoint:Int?
    /// 画册图片，连产品图片限制为5张，以逗号分割
    public var albumPics:String?
    /// 是否为预告商品：0->不是；1->是
    public var previewStatus:Int?
    public var price:Float?
    /// 限制使用的积分数
    public var usePointLimit:Int?
    /// 商品描述
    public var description_str:String?
    public var feightTemplateId:Int?
    /// 以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮
    public var serviceIds:String?
    public var productCategoryId:Int?
    /// 上架状态：0->下架；1->上架
    public var publishStatus:Int?
    /// 新品状态:0->不是新品；1->新品
    public var newStatus:Int?
    public var keywords:String?
    public var note:String?
    /// 活动限购数量
    public var promotionPerLimit:Int?
    /// 市场价
    public var originalPrice:Float?
    /// 销量
    public var sale:Int?
    /// 单位
    public var unit:String?

    required convenience init(json:SKJSON) {
        self.init()
        sort = json["sort"].intValue
        name = json["name"].stringValue
        id = json["id"].intValue
        detailMobileHtml = json["detailMobileHtml"].stringValue
        lowStock = json["lowStock"].intValue
        pic = json["pic"].stringValue
        promotionStartTime = json["promotionStartTime"].stringValue
        detailDesc = json["detailDesc"].stringValue
        productSn = json["productSn"].stringValue
        weight = json["weight"].floatValue
        promotionPrice = json["promotionPrice"].floatValue
        deleteStatus = json["deleteStatus"].intValue
        brandId = json["brandId"].intValue
        brandName = json["brandName"].stringValue
        stock = json["stock"].intValue
        promotionType = json["promotionType"].intValue
        giftGrowth = json["giftGrowth"].intValue
        discountAmount = json["discountAmount"].floatValue
        detailHtml = json["detailHtml"].stringValue
        verifyStatus = json["verifyStatus"].intValue
        promotionEndTime = json["promotionEndTime"].stringValue
        productAttributeCategoryId = json["productAttributeCategoryId"].intValue
        detailTitle = json["detailTitle"].stringValue
        subTitle = json["subTitle"].stringValue
        productCategoryName = json["productCategoryName"].stringValue
        recommandStatus = json["recommandStatus"].intValue
        giftPoint = json["giftPoint"].intValue
        albumPics = json["albumPics"].stringValue
        previewStatus = json["previewStatus"].intValue
        price = json["price"].floatValue
        usePointLimit = json["usePointLimit"].intValue
        description_str = json["description_str"].stringValue
        feightTemplateId = json["feightTemplateId"].intValue
        serviceIds = json["serviceIds"].stringValue
        productCategoryId = json["productCategoryId"].intValue
        publishStatus = json["publishStatus"].intValue
        newStatus = json["newStatus"].intValue
        keywords = json["keywords"].stringValue
        note = json["note"].stringValue
        promotionPerLimit = json["promotionPerLimit"].intValue
        originalPrice = json["originalPrice"].floatValue
        sale = json["sale"].intValue
        unit = json["unit"].stringValue
    }
}
public class HomeFlashPromotion: SGResponseItem {
    public var endTime:String?
    public var productList:[FlashPromotionProduct] = []
    public var nextStartTime:String?
    public var startTime:String?
    public var nextEndTime:String?

    required convenience init(json:SKJSON) {
        self.init()
        endTime = json["endTime"].stringValue
        for value in json["productList"].arrayValue{
            productList.append(FlashPromotionProduct(json: value))
        }
        nextStartTime = json["nextStartTime"].stringValue
        startTime = json["startTime"].stringValue
        nextEndTime = json["nextEndTime"].stringValue
    }
}
public class PmsPortalProductDetail: SGResponseItem {
    /// 商品信息
    public var product:PmsProduct?
    /// 商品满减价格设置
    public var productFullReductionList:[PmsProductFullReduction] = []
    /// 手动录入的商品属性与参数值
    public var productAttributeValueList:[PmsProductAttributeValue] = []
    /// 商品品牌
    public var brand:PmsBrand?
    /// 商品属性与参数
    public var productAttributeList:[PmsProductAttribute] = []
    /// 商品的sku库存信息
    public var skuStockList:[PmsSkuStock] = []
    /// 商品阶梯价格设置
    public var productLadderList:[PmsProductLadder] = []
    /// 商品可用优惠券
    public var couponList:[SmsCoupon] = []

    required convenience init(json:SKJSON) {
        self.init()
        product = PmsProduct(json:json["product"])
        for value in json["productFullReductionList"].arrayValue{
            productFullReductionList.append(PmsProductFullReduction(json: value))
        }
        for value in json["productAttributeValueList"].arrayValue{
            productAttributeValueList.append(PmsProductAttributeValue(json: value))
        }
        brand = PmsBrand(json:json["brand"])
        for value in json["productAttributeList"].arrayValue{
            productAttributeList.append(PmsProductAttribute(json: value))
        }
        for value in json["skuStockList"].arrayValue{
            skuStockList.append(PmsSkuStock(json: value))
        }
        for value in json["productLadderList"].arrayValue{
            productLadderList.append(PmsProductLadder(json: value))
        }
        for value in json["couponList"].arrayValue{
            couponList.append(SmsCoupon(json: value))
        }
    }
}
public class CommonResult_long: SGResponseItem {
    /// 提示信息
    public var message:String?
    public var data:Int?
    /// 状态码
    public var code:Int?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        data = json["data"].intValue
        code = json["code"].intValue
    }
}
public class PmsProductCategoryNode: SGResponseItem {
    /// 显示状态：0->不显示；1->显示
    public var showStatus:Int?
    /// 描述
    public var description_str:String?
    /// 分类级别：0->1级；1->2级
    public var level:Int?
    public var children:[PmsProductCategoryNode] = []
    /// 是否显示在导航栏：0->不显示；1->显示
    public var navStatus:Int?
    public var productCount:Int?
    public var name:String?
    /// 图标
    public var icon:String?
    /// 上机分类的编号：0表示一级分类
    public var parentId:Int?
    public var sort:Int?
    public var productUnit:String?
    public var id:Int?
    public var keywords:String?

    required convenience init(json:SKJSON) {
        self.init()
        showStatus = json["showStatus"].intValue
        description_str = json["description_str"].stringValue
        level = json["level"].intValue
        for value in json["children"].arrayValue{
            children.append(PmsProductCategoryNode(json: value))
        }
        navStatus = json["navStatus"].intValue
        productCount = json["productCount"].intValue
        name = json["name"].stringValue
        icon = json["icon"].stringValue
        parentId = json["parentId"].intValue
        sort = json["sort"].intValue
        productUnit = json["productUnit"].stringValue
        id = json["id"].intValue
        keywords = json["keywords"].stringValue
    }
}
public class FlashPromotionProduct: SGResponseItem {
    public var keywords:String?
    /// 上架状态：0->下架；1->上架
    public var publishStatus:Int?
    public var name:String?
    public var id:Int?
    /// 移动端网页详情
    public var detailMobileHtml:String?
    public var pic:String?
    /// 库存预警值
    public var lowStock:Int?
    /// 促销开始时间
    public var promotionStartTime:String?
    public var detailDesc:String?
    /// 货号
    public var productSn:String?
    public var brandId:Int?
    /// 促销价格
    public var promotionPrice:Float?
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    public var flashPromotionLimit:Int?
    /// 商品重量，默认为克
    public var weight:Float?
    /// 品牌名称
    public var brandName:String?
    public var productAttributeCategoryId:Int?
    /// 促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购
    public var promotionType:Int?
    /// 赠送的成长值
    public var giftGrowth:Int?
    /// 折扣金额（可抵扣）
    public var discountAmount:Float?
    /// 产品详情网页内容
    public var detailHtml:String?
    /// 审核状态：0->未审核；1->审核通过
    public var verifyStatus:Int?
    /// 库存
    public var stock:Int?
    /// 促销结束时间
    public var promotionEndTime:String?
    public var detailTitle:String?
    /// 推荐状态；0->不推荐；1->推荐
    public var recommandStatus:Int?
    /// 商品分类名称
    public var productCategoryName:String?
    /// 副标题
    public var subTitle:String?
    /// 赠送的积分
    public var giftPoint:Int?
    /// 画册图片，连产品图片限制为5张，以逗号分割
    public var albumPics:String?
    public var price:Float?
    /// 是否为预告商品：0->不是；1->是
    public var previewStatus:Int?
    /// 限制使用的积分数
    public var usePointLimit:Int?
    /// 商品描述
    public var description_str:String?
    public var feightTemplateId:Int?
    public var flashPromotionPrice:Float?
    public var productCategoryId:Int?
    /// 以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮
    public var serviceIds:String?
    /// 销量
    public var sale:Int?
    /// 新品状态:0->不是新品；1->新品
    public var newStatus:Int?
    /// 活动限购数量
    public var promotionPerLimit:Int?
    public var note:String?
    /// 排序
    public var sort:Int?
    /// 市场价
    public var originalPrice:Float?
    public var flashPromotionCount:Int?
    /// 单位
    public var unit:String?

    required convenience init(json:SKJSON) {
        self.init()
        keywords = json["keywords"].stringValue
        publishStatus = json["publishStatus"].intValue
        name = json["name"].stringValue
        id = json["id"].intValue
        detailMobileHtml = json["detailMobileHtml"].stringValue
        pic = json["pic"].stringValue
        lowStock = json["lowStock"].intValue
        promotionStartTime = json["promotionStartTime"].stringValue
        detailDesc = json["detailDesc"].stringValue
        productSn = json["productSn"].stringValue
        brandId = json["brandId"].intValue
        promotionPrice = json["promotionPrice"].floatValue
        deleteStatus = json["deleteStatus"].intValue
        flashPromotionLimit = json["flashPromotionLimit"].intValue
        weight = json["weight"].floatValue
        brandName = json["brandName"].stringValue
        productAttributeCategoryId = json["productAttributeCategoryId"].intValue
        promotionType = json["promotionType"].intValue
        giftGrowth = json["giftGrowth"].intValue
        discountAmount = json["discountAmount"].floatValue
        detailHtml = json["detailHtml"].stringValue
        verifyStatus = json["verifyStatus"].intValue
        stock = json["stock"].intValue
        promotionEndTime = json["promotionEndTime"].stringValue
        detailTitle = json["detailTitle"].stringValue
        recommandStatus = json["recommandStatus"].intValue
        productCategoryName = json["productCategoryName"].stringValue
        subTitle = json["subTitle"].stringValue
        giftPoint = json["giftPoint"].intValue
        albumPics = json["albumPics"].stringValue
        price = json["price"].floatValue
        previewStatus = json["previewStatus"].intValue
        usePointLimit = json["usePointLimit"].intValue
        description_str = json["description_str"].stringValue
        feightTemplateId = json["feightTemplateId"].intValue
        flashPromotionPrice = json["flashPromotionPrice"].floatValue
        productCategoryId = json["productCategoryId"].intValue
        serviceIds = json["serviceIds"].stringValue
        sale = json["sale"].intValue
        newStatus = json["newStatus"].intValue
        promotionPerLimit = json["promotionPerLimit"].intValue
        note = json["note"].stringValue
        sort = json["sort"].intValue
        originalPrice = json["originalPrice"].floatValue
        flashPromotionCount = json["flashPromotionCount"].intValue
        unit = json["unit"].stringValue
    }
}
public class CommonResult_List_OmsCartItem: SGResponseItem {
    public var data:[OmsCartItem] = []
    /// 状态码
    public var code:Int?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["data"].arrayValue{
            data.append(OmsCartItem(json: value))
        }
        code = json["code"].intValue
        message = json["message"].stringValue
    }
}
public class MemberReadHistory: SGResponseItem {
    public var id:String?
    public var createTime:String?
    public var memberNickname:String?
    public var productName:String?
    public var productSubTitle:String?
    public var memberIcon:String?
    public var memberId:Int?
    public var productPrice:String?
    public var productId:Int?
    public var productPic:String?

    required convenience init(json:SKJSON) {
        self.init()
        id = json["id"].stringValue
        createTime = json["createTime"].stringValue
        memberNickname = json["memberNickname"].stringValue
        productName = json["productName"].stringValue
        productSubTitle = json["productSubTitle"].stringValue
        memberIcon = json["memberIcon"].stringValue
        memberId = json["memberId"].intValue
        productPrice = json["productPrice"].stringValue
        productId = json["productId"].intValue
        productPic = json["productPic"].stringValue
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
public class CommonResult_CommonPage_MemberProductCollection: SGResponseItem {
    /// 提示信息
    public var message:String?
    public var data:CommonPage_MemberProductCollection?
    /// 状态码
    public var code:Int?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        data = CommonPage_MemberProductCollection(json:json["data"])
        code = json["code"].intValue
    }
}
public class PmsProductLadder: SGResponseItem {
    public var id:Int?
    /// 满足的商品数量
    public var count:Int?
    /// 折后价格
    public var price:Float?
    /// 折扣
    public var discount:Float?
    public var productId:Int?

    required convenience init(json:SKJSON) {
        self.init()
        id = json["id"].intValue
        count = json["count"].intValue
        price = json["price"].floatValue
        discount = json["discount"].floatValue
        productId = json["productId"].intValue
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
public class UmsMemberLevel: SGResponseItem {
    /// 是否有会员价格特权
    public var priviledgeMemberPrice:Int?
    /// 是否有评论获奖励特权
    public var priviledgeComment:Int?
    public var note:String?
    /// 是否有免邮特权
    public var priviledgeFreeFreight:Int?
    /// 是否为默认等级：0->不是；1->是
    public var defaultStatus:Int?
    public var name:String?
    /// 免运费标准
    public var freeFreightPoint:Float?
    /// 是否有生日特权
    public var priviledgeBirthday:Int?
    /// 消费券佣金配置
    public var discountCommissionConfig:String?
    /// 产品佣金配置
    public var productCommissionConfig:String?
    public var growthPoint:Int?
    /// 消费券金额
    public var discountAmount:Float?
    /// 每次评价获取的成长值
    public var commentGrowthPoint:Int?
    /// 是否有签到特权
    public var priviledgeSignIn:Int?
    /// 是否有专享活动特权
    public var priviledgePromotion:Int?
    public var id:Int?

    required convenience init(json:SKJSON) {
        self.init()
        priviledgeMemberPrice = json["priviledgeMemberPrice"].intValue
        priviledgeComment = json["priviledgeComment"].intValue
        note = json["note"].stringValue
        priviledgeFreeFreight = json["priviledgeFreeFreight"].intValue
        defaultStatus = json["defaultStatus"].intValue
        name = json["name"].stringValue
        freeFreightPoint = json["freeFreightPoint"].floatValue
        priviledgeBirthday = json["priviledgeBirthday"].intValue
        discountCommissionConfig = json["discountCommissionConfig"].stringValue
        productCommissionConfig = json["productCommissionConfig"].stringValue
        growthPoint = json["growthPoint"].intValue
        discountAmount = json["discountAmount"].floatValue
        commentGrowthPoint = json["commentGrowthPoint"].intValue
        priviledgeSignIn = json["priviledgeSignIn"].intValue
        priviledgePromotion = json["priviledgePromotion"].intValue
        id = json["id"].intValue
    }
}
public class UmsMemberReceiveAddress: SGResponseItem {
    public var id:Int?
    public var phoneNumber:String?
    /// 是否为默认
    public var defaultStatus:Int?
    /// 城市
    public var city:String?
    /// 省份/直辖市
    public var province:String?
    public var memberId:Int?
    /// 邮政编码
    public var postCode:String?
    /// 收货人名称
    public var name:String?
    /// 详细地址(街道)
    public var detailAddress:String?
    /// 区
    public var region:String?

    required convenience init(json:SKJSON) {
        self.init()
        id = json["id"].intValue
        phoneNumber = json["phoneNumber"].stringValue
        defaultStatus = json["defaultStatus"].intValue
        city = json["city"].stringValue
        province = json["province"].stringValue
        memberId = json["memberId"].intValue
        postCode = json["postCode"].stringValue
        name = json["name"].stringValue
        detailAddress = json["detailAddress"].stringValue
        region = json["region"].stringValue
    }
}
public class SmsCoupon: SGResponseItem {
    public var startTime:String?
    /// 已使用数量
    public var useCount:Int?
    /// 可以领取的日期
    public var enableTime:String?
    /// 发行数量
    public var publishCount:Int?
    /// 优惠码
    public var code:String?
    public var endTime:String?
    /// 备注
    public var note:String?
    /// 金额
    public var amount:Float?
    /// 数量
    public var count:Int?
    /// 领取数量
    public var receiveCount:Int?
    /// 使用平台：0->全部；1->移动；2->PC
    public var platform:Int?
    /// 优惠券类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券
    public var type:Int?
    /// 每人限领张数
    public var perLimit:Int?
    public var name:String?
    public var id:Int?
    /// 使用类型：0->全场通用；1->指定分类；2->指定商品
    public var useType:Int?
    /// 使用门槛；0表示无门槛
    public var minPoint:Float?
    /// 可领取的会员类型：0->无限时
    public var memberLevel:Int?

    required convenience init(json:SKJSON) {
        self.init()
        startTime = json["startTime"].stringValue
        useCount = json["useCount"].intValue
        enableTime = json["enableTime"].stringValue
        publishCount = json["publishCount"].intValue
        code = json["code"].stringValue
        endTime = json["endTime"].stringValue
        note = json["note"].stringValue
        amount = json["amount"].floatValue
        count = json["count"].intValue
        receiveCount = json["receiveCount"].intValue
        platform = json["platform"].intValue
        type = json["type"].intValue
        perLimit = json["perLimit"].intValue
        name = json["name"].stringValue
        id = json["id"].intValue
        useType = json["useType"].intValue
        minPoint = json["minPoint"].floatValue
        memberLevel = json["memberLevel"].intValue
    }
}
public class ConfirmOrderResult: SGResponseItem {
    public var cartPromotionItemList:[CartPromotionItem] = []
    public var calcAmount:CalcAmount?
    public var couponHistoryDetailList:[SmsCouponHistoryDetail] = []
    public var memberReceiveAddressList:[UmsMemberReceiveAddress] = []
    public var integrationConsumeSetting:UmsIntegrationConsumeSetting?
    public var memberIntegration:Int?
    public var discountBalance:Float?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["cartPromotionItemList"].arrayValue{
            cartPromotionItemList.append(CartPromotionItem(json: value))
        }
        calcAmount = CalcAmount(json:json["calcAmount"])
        for value in json["couponHistoryDetailList"].arrayValue{
            couponHistoryDetailList.append(SmsCouponHistoryDetail(json: value))
        }
        for value in json["memberReceiveAddressList"].arrayValue{
            memberReceiveAddressList.append(UmsMemberReceiveAddress(json: value))
        }
        integrationConsumeSetting = UmsIntegrationConsumeSetting(json:json["integrationConsumeSetting"])
        memberIntegration = json["memberIntegration"].intValue
        discountBalance = json["discountBalance"].floatValue
    }
}
public class CommonPage_MemberReadHistory: SGResponseItem {
    /// 当前页码
    public var pageNum:Int?
    /// 总条数
    public var total:Int?
    /// 分页数据
    public var list:[MemberReadHistory] = []
    /// 总页数
    public var totalPage:Int?
    /// 每页数量
    public var pageSize:Int?

    required convenience init(json:SKJSON) {
        self.init()
        pageNum = json["pageNum"].intValue
        total = json["total"].intValue
        for value in json["list"].arrayValue{
            list.append(MemberReadHistory(json: value))
        }
        totalPage = json["totalPage"].intValue
        pageSize = json["pageSize"].intValue
    }
}
public class PmsSkuStock: SGResponseItem {
    /// sku编码
    public var skuCode:String?
    /// 预警库存
    public var lowStock:Int?
    public var productId:Int?
    /// 商品销售属性，json格式
    public var spData:String?
    /// 单品促销价格
    public var promotionPrice:Float?
    /// 展示图片
    public var pic:String?
    public var price:Float?
    /// 销量
    public var sale:Int?
    /// 折扣金额（可抵扣）
    public var discountAmount:Float?
    /// 锁定库存
    public var lockStock:Int?
    public var id:Int?
    /// 成本价
    public var costPrice:Float?
    /// 库存
    public var stock:Int?

    required convenience init(json:SKJSON) {
        self.init()
        skuCode = json["skuCode"].stringValue
        lowStock = json["lowStock"].intValue
        productId = json["productId"].intValue
        spData = json["spData"].stringValue
        promotionPrice = json["promotionPrice"].floatValue
        pic = json["pic"].stringValue
        price = json["price"].floatValue
        sale = json["sale"].intValue
        discountAmount = json["discountAmount"].floatValue
        lockStock = json["lockStock"].intValue
        id = json["id"].intValue
        costPrice = json["costPrice"].floatValue
        stock = json["stock"].intValue
    }
}
public class SmsCouponHistoryDetail: SGResponseItem {
    public var couponCode:String?
    /// 领取人昵称
    public var memberNickname:String?
    public var categoryRelationList:[SmsCouponProductCategoryRelation] = []
    /// 使用时间
    public var useTime:String?
    public var createTime:String?
    public var memberId:Int?
    public var coupon:SmsCoupon?
    /// 使用状态：0->未使用；1->已使用；2->已过期
    public var useStatus:Int?
    public var productRelationList:[SmsCouponProductRelation] = []
    /// 订单号码
    public var orderSn:String?
    /// 订单编号
    public var orderId:Int?
    public var id:Int?
    public var couponId:Int?
    /// 获取类型：0->后台赠送；1->主动获取
    public var getType:Int?

    required convenience init(json:SKJSON) {
        self.init()
        couponCode = json["couponCode"].stringValue
        memberNickname = json["memberNickname"].stringValue
        for value in json["categoryRelationList"].arrayValue{
            categoryRelationList.append(SmsCouponProductCategoryRelation(json: value))
        }
        useTime = json["useTime"].stringValue
        createTime = json["createTime"].stringValue
        memberId = json["memberId"].intValue
        coupon = SmsCoupon(json:json["coupon"])
        useStatus = json["useStatus"].intValue
        for value in json["productRelationList"].arrayValue{
            productRelationList.append(SmsCouponProductRelation(json: value))
        }
        orderSn = json["orderSn"].stringValue
        orderId = json["orderId"].intValue
        id = json["id"].intValue
        couponId = json["couponId"].intValue
        getType = json["getType"].intValue
    }
}
public class OmsOrderDetail: SGResponseItem {
    public var orderItemList:[OmsOrderItem] = []
    /// 可以活动的成长值
    public var growth:Int?
    /// 订单id
    public var id:Int?
    /// 收货人电话
    public var receiverPhone:String?
    /// 评价时间
    public var commentTime:String?
    /// 收票人电话
    public var billReceiverPhone:String?
    /// 发票内容
    public var billContent:String?
    /// 发票类型：0->不开发票；1->电子发票；2->纸质发票
    public var billType:Int?
    /// 收票人邮箱
    public var billReceiverEmail:String?
    /// 支付时间
    public var paymentTime:String?
    /// 省份/直辖市
    public var receiverProvince:String?
    /// 删除状态：0->未删除；1->已删除
    public var deleteStatus:Int?
    /// 确认收货状态：0->未确认；1->已确认
    public var confirmStatus:Int?
    /// 发货时间
    public var deliveryTime:String?
    /// 促销优化金额（促销价、满减、阶梯价）
    public var promotionAmount:Float?
    /// 区
    public var receiverRegion:String?
    /// 管理员后台调整订单使用的折扣金额
    public var discountAmount:Float?
    /// 发票抬头
    public var billHeader:String?
    /// 优惠券抵扣金额
    public var couponAmount:Float?
    /// 积分抵扣金额
    public var integrationAmount:Float?
    /// 确认收货时间
    public var receiveTime:String?
    /// 详细地址
    public var receiverDetailAddress:String?
    /// 下单时使用的积分
    public var useIntegration:Int?
    /// 收货人姓名
    public var receiverName:String?
    /// 订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单
    public var status:Int?
    /// 物流单号
    public var deliverySn:String?
    /// 订单编号
    public var orderSn:String?
    public var couponId:Int?
    /// 订单类型：0->正常订单；1->秒杀订单
    public var orderType:Int?
    /// 城市
    public var receiverCity:String?
    /// 支付方式：0->未支付；1->支付宝；2->微信
    public var payType:Int?
    /// 用户帐号
    public var memberUsername:String?
    /// 自动确认时间（天）
    public var autoConfirmDay:Int?
    /// 修改时间
    public var modifyTime:String?
    /// 活动信息
    public var promotionInfo:String?
    /// 物流公司(配送方式)
    public var deliveryCompany:String?
    /// 应付金额（实际支付金额）
    public var payAmount:Float?
    /// 订单来源：0->PC订单；1->app订单
    public var sourceType:Int?
    /// 订单总金额
    public var totalAmount:Float?
    /// 运费金额
    public var freightAmount:Float?
    /// 订单备注
    public var note:String?
    /// 可以获得的积分
    public var integration:Int?
    /// 收货人邮编
    public var receiverPostCode:String?
    /// 提交时间
    public var createTime:String?
    public var memberId:Int?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["orderItemList"].arrayValue{
            orderItemList.append(OmsOrderItem(json: value))
        }
        growth = json["growth"].intValue
        id = json["id"].intValue
        receiverPhone = json["receiverPhone"].stringValue
        commentTime = json["commentTime"].stringValue
        billReceiverPhone = json["billReceiverPhone"].stringValue
        billContent = json["billContent"].stringValue
        billType = json["billType"].intValue
        billReceiverEmail = json["billReceiverEmail"].stringValue
        paymentTime = json["paymentTime"].stringValue
        receiverProvince = json["receiverProvince"].stringValue
        deleteStatus = json["deleteStatus"].intValue
        confirmStatus = json["confirmStatus"].intValue
        deliveryTime = json["deliveryTime"].stringValue
        promotionAmount = json["promotionAmount"].floatValue
        receiverRegion = json["receiverRegion"].stringValue
        discountAmount = json["discountAmount"].floatValue
        billHeader = json["billHeader"].stringValue
        couponAmount = json["couponAmount"].floatValue
        integrationAmount = json["integrationAmount"].floatValue
        receiveTime = json["receiveTime"].stringValue
        receiverDetailAddress = json["receiverDetailAddress"].stringValue
        useIntegration = json["useIntegration"].intValue
        receiverName = json["receiverName"].stringValue
        status = json["status"].intValue
        deliverySn = json["deliverySn"].stringValue
        orderSn = json["orderSn"].stringValue
        couponId = json["couponId"].intValue
        orderType = json["orderType"].intValue
        receiverCity = json["receiverCity"].stringValue
        payType = json["payType"].intValue
        memberUsername = json["memberUsername"].stringValue
        autoConfirmDay = json["autoConfirmDay"].intValue
        modifyTime = json["modifyTime"].stringValue
        promotionInfo = json["promotionInfo"].stringValue
        deliveryCompany = json["deliveryCompany"].stringValue
        payAmount = json["payAmount"].floatValue
        sourceType = json["sourceType"].intValue
        totalAmount = json["totalAmount"].floatValue
        freightAmount = json["freightAmount"].floatValue
        note = json["note"].stringValue
        integration = json["integration"].intValue
        receiverPostCode = json["receiverPostCode"].stringValue
        createTime = json["createTime"].stringValue
        memberId = json["memberId"].intValue
    }
}
public class SmsHomeAdvertise: SGResponseItem {
    public var id:Int?
    /// 链接地址
    public var url:String?
    public var pic:String?
    /// 备注
    public var note:String?
    /// 点击数
    public var clickCount:Int?
    /// 轮播位置：0->PC首页轮播；1->app首页轮播
    public var type:Int?
    /// 排序
    public var sort:Int?
    public var endTime:String?
    public var name:String?
    public var startTime:String?
    /// 上下线状态：0->下线；1->上线
    public var status:Int?
    /// 下单数
    public var orderCount:Int?

    required convenience init(json:SKJSON) {
        self.init()
        id = json["id"].intValue
        url = json["url"].stringValue
        pic = json["pic"].stringValue
        note = json["note"].stringValue
        clickCount = json["clickCount"].intValue
        type = json["type"].intValue
        sort = json["sort"].intValue
        endTime = json["endTime"].stringValue
        name = json["name"].stringValue
        startTime = json["startTime"].stringValue
        status = json["status"].intValue
        orderCount = json["orderCount"].intValue
    }
}
public class CommonResult_ConfirmOrderResult: SGResponseItem {
    public var data:ConfirmOrderResult?
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?

    required convenience init(json:SKJSON) {
        self.init()
        data = ConfirmOrderResult(json:json["data"])
        message = json["message"].stringValue
        code = json["code"].intValue
    }
}
public class CommonResult_List_CmsSubject: SGResponseItem {
    /// 状态码
    public var code:Int?
    /// 提示信息
    public var message:String?
    public var data:[CmsSubject] = []

    required convenience init(json:SKJSON) {
        self.init()
        code = json["code"].intValue
        message = json["message"].stringValue
        for value in json["data"].arrayValue{
            data.append(CmsSubject(json: value))
        }
    }
}
public class CommonResult_CommonPage_AgCommission: SGResponseItem {
    public var data:CommonPage_AgCommission?
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?

    required convenience init(json:SKJSON) {
        self.init()
        data = CommonPage_AgCommission(json:json["data"])
        message = json["message"].stringValue
        code = json["code"].intValue
    }
}
public class CommonPage_AgHelping: SGResponseItem {
    /// 当前页码
    public var pageNum:Int?
    /// 分页数据
    public var list:[AgHelping] = []
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        pageNum = json["pageNum"].intValue
        for value in json["list"].arrayValue{
            list.append(AgHelping(json: value))
        }
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonPage_MemberProductCollection: SGResponseItem {
    /// 当前页码
    public var pageNum:Int?
    /// 分页数据
    public var list:[MemberProductCollection] = []
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        pageNum = json["pageNum"].intValue
        for value in json["list"].arrayValue{
            list.append(MemberProductCollection(json: value))
        }
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class PmsProductAttributeValue: SGResponseItem {
    public var productAttributeId:Int?
    public var productId:Int?
    public var id:Int?
    /// 手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开
    public var value:String?

    required convenience init(json:SKJSON) {
        self.init()
        productAttributeId = json["productAttributeId"].intValue
        productId = json["productId"].intValue
        id = json["id"].intValue
        value = json["value"].stringValue
    }
}
public class CommonResult_List_SmsCouponHistoryDetail: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:[SmsCouponHistoryDetail] = []

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(SmsCouponHistoryDetail(json: value))
        }
    }
}
public class CommonResult_CommonPage_AgHelping: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:CommonPage_AgHelping?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = CommonPage_AgHelping(json:json["data"])
    }
}
public class CommonResult_UmsMemberReceiveAddress: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:UmsMemberReceiveAddress?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = UmsMemberReceiveAddress(json:json["data"])
    }
}
public class CommonPage_MemberBrandAttention: SGResponseItem {
    /// 当前页码
    public var pageNum:Int?
    /// 总条数
    public var total:Int?
    /// 分页数据
    public var list:[MemberBrandAttention] = []
    /// 每页数量
    public var pageSize:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        pageNum = json["pageNum"].intValue
        total = json["total"].intValue
        for value in json["list"].arrayValue{
            list.append(MemberBrandAttention(json: value))
        }
        pageSize = json["pageSize"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class CommonResult_List_PmsProductCategory: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:[PmsProductCategory] = []

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(PmsProductCategory(json: value))
        }
    }
}
public class PmsProductFullReduction: SGResponseItem {
    public var reducePrice:Float?
    public var productId:Int?
    public var id:Int?
    public var fullPrice:Float?

    required convenience init(json:SKJSON) {
        self.init()
        reducePrice = json["reducePrice"].floatValue
        productId = json["productId"].intValue
        id = json["id"].intValue
        fullPrice = json["fullPrice"].floatValue
    }
}
public class HomeContentResult: SGResponseItem {
    public var homeFlashPromotion:HomeFlashPromotion?
    public var brandList:[PmsBrand] = []
    public var hotProductList:[PmsProduct] = []
    public var advertiseList:[SmsHomeAdvertise] = []
    public var newProductList:[PmsProduct] = []
    public var subjectList:[CmsSubject] = []

    required convenience init(json:SKJSON) {
        self.init()
        homeFlashPromotion = HomeFlashPromotion(json:json["homeFlashPromotion"])
        for value in json["brandList"].arrayValue{
            brandList.append(PmsBrand(json: value))
        }
        for value in json["hotProductList"].arrayValue{
            hotProductList.append(PmsProduct(json: value))
        }
        for value in json["advertiseList"].arrayValue{
            advertiseList.append(SmsHomeAdvertise(json: value))
        }
        for value in json["newProductList"].arrayValue{
            newProductList.append(PmsProduct(json: value))
        }
        for value in json["subjectList"].arrayValue{
            subjectList.append(CmsSubject(json: value))
        }
    }
}
public class CommonResult_CommonPage_AgWithdrawal: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:CommonPage_AgWithdrawal?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = CommonPage_AgWithdrawal(json:json["data"])
    }
}
public class CalcAmount: SGResponseItem {
    public var discountAmount:Float?
    public var payAmount:Float?
    public var freightAmount:Float?
    public var totalAmount:Float?
    public var promotionAmount:Float?

    required convenience init(json:SKJSON) {
        self.init()
        discountAmount = json["discountAmount"].floatValue
        payAmount = json["payAmount"].floatValue
        freightAmount = json["freightAmount"].floatValue
        totalAmount = json["totalAmount"].floatValue
        promotionAmount = json["promotionAmount"].floatValue
    }
}
public class PmsBrand: SGResponseItem {
    /// 是否为品牌制造商：0->不是；1->是
    public var factoryStatus:Int?
    /// 品牌故事
    public var brandStory:String?
    /// 专区大图
    public var bigPic:String?
    public var showStatus:Int?
    public var sort:Int?
    /// 品牌logo
    public var logo:String?
    /// 产品数量
    public var productCount:Int?
    /// 首字母
    public var firstLetter:String?
    public var id:Int?
    /// 产品评论数量
    public var productCommentCount:Int?
    public var name:String?

    required convenience init(json:SKJSON) {
        self.init()
        factoryStatus = json["factoryStatus"].intValue
        brandStory = json["brandStory"].stringValue
        bigPic = json["bigPic"].stringValue
        showStatus = json["showStatus"].intValue
        sort = json["sort"].intValue
        logo = json["logo"].stringValue
        productCount = json["productCount"].intValue
        firstLetter = json["firstLetter"].stringValue
        id = json["id"].intValue
        productCommentCount = json["productCommentCount"].intValue
        name = json["name"].stringValue
    }
}
public class CommonResult_List_UmsMemberLevel: SGResponseItem {
    public var data:[UmsMemberLevel] = []
    /// 状态码
    public var code:Int?
    /// 提示信息
    public var message:String?

    required convenience init(json:SKJSON) {
        self.init()
        for value in json["data"].arrayValue{
            data.append(UmsMemberLevel(json: value))
        }
        code = json["code"].intValue
        message = json["message"].stringValue
    }
}
public class CommonResult_CommonPage_object: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:CommonPage_object?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = CommonPage_object(json:json["data"])
    }
}
public class CommonResult_CommonPage_MemberBrandAttention: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:CommonPage_MemberBrandAttention?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = CommonPage_MemberBrandAttention(json:json["data"])
    }
}
public class CommonResult_CartProduct: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:CartProduct?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = CartProduct(json:json["data"])
    }
}
public class CommonResult_List_CartPromotionItem: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:[CartPromotionItem] = []

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        for value in json["data"].arrayValue{
            data.append(CartPromotionItem(json: value))
        }
    }
}
public class CommonResult_object: SGResponseItem {
    public var data:Any?
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?

    required convenience init(json:SKJSON) {
        self.init()
        data = json["data"].object
        message = json["message"].stringValue
        code = json["code"].intValue
    }
}
public class AgWithdrawalApply: SGResponseItem {
    /// 支行信息
    public var bankBranch:String?
    /// 类型 1:银行卡 2:支付宝
    public var type:Int?
    /// 金额
    public var amount:Float?
    /// 真实姓名
    public var realName:String?
    /// 账号
    public var account:String?
    /// 银行名称
    public var bankName:String?
    /// 银行卡号
    public var bankNo:String?

    required convenience init(json:SKJSON) {
        self.init()
        bankBranch = json["bankBranch"].stringValue
        type = json["type"].intValue
        amount = json["amount"].floatValue
        realName = json["realName"].stringValue
        account = json["account"].stringValue
        bankName = json["bankName"].stringValue
        bankNo = json["bankNo"].stringValue
    }
}
public class OrderParam: SGResponseItem {
    /// 使用的积分数
    public var useIntegration:Int?
    /// 支付方式
    public var payType:Int?
    /// 优惠券ID
    public var couponId:Int?
    /// 被选中的购物车商品ID
    public var cartIds:[Int] = []
    /// 收货地址ID
    public var memberReceiveAddressId:Int?

    required convenience init(json:SKJSON) {
        self.init()
        useIntegration = json["useIntegration"].intValue
        payType = json["payType"].intValue
        couponId = json["couponId"].intValue
        for value in json["cartIds"].arrayValue{
            cartIds.append(value.intValue)
        }
        memberReceiveAddressId = json["memberReceiveAddressId"].intValue
    }
}
public class CommonPage_OmsOrderDetail: SGResponseItem {
    /// 当前页码
    public var pageNum:Int?
    /// 总条数
    public var total:Int?
    /// 分页数据
    public var list:[OmsOrderDetail] = []
    /// 每页数量
    public var pageSize:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        pageNum = json["pageNum"].intValue
        total = json["total"].intValue
        for value in json["list"].arrayValue{
            list.append(OmsOrderDetail(json: value))
        }
        pageSize = json["pageSize"].intValue
        totalPage = json["totalPage"].intValue
    }
}
public class AgCommission: SGResponseItem {
    /// 订单会员ID
    public var orderMemberId:Int?
    /// 状态0:待结算 1:已结算
    public var status:Int?
    /// 佣金率
    public var commissionRate:Float?
    /// 深度
    public var depth:Int?
    /// 创建时间
    public var createTime:String?
    /// 会员ID
    public var memberId:Int?
    /// 佣金
    public var commission:Float?
    /// 0: 直推 1:团队
    public var type:Int?
    /// 名称
    public var name:String?
    /// 来源：1->订单 2->消费券
    public var sourceType:Int?
    /// 来源ID
    public var sourceId:String?
    public var id:Int?
    /// 订单金额
    public var orderAmount:Float?

    required convenience init(json:SKJSON) {
        self.init()
        orderMemberId = json["orderMemberId"].intValue
        status = json["status"].intValue
        commissionRate = json["commissionRate"].floatValue
        depth = json["depth"].intValue
        createTime = json["createTime"].stringValue
        memberId = json["memberId"].intValue
        commission = json["commission"].floatValue
        type = json["type"].intValue
        name = json["name"].stringValue
        sourceType = json["sourceType"].intValue
        sourceId = json["sourceId"].stringValue
        id = json["id"].intValue
        orderAmount = json["orderAmount"].floatValue
    }
}
public class CommonResult_MemberProductCollection: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:MemberProductCollection?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = MemberProductCollection(json:json["data"])
    }
}
public class CommonResult_PmsPortalProductDetail: SGResponseItem {
    /// 提示信息
    public var message:String?
    /// 状态码
    public var code:Int?
    public var data:PmsPortalProductDetail?

    required convenience init(json:SKJSON) {
        self.init()
        message = json["message"].stringValue
        code = json["code"].intValue
        data = PmsPortalProductDetail(json:json["data"])
    }
}
public class SmsCouponProductRelation: SGResponseItem {
    public var productId:Int?
    public var id:Int?
    /// 商品名称
    public var productName:String?
    public var couponId:Int?
    /// 商品编码
    public var productSn:String?

    required convenience init(json:SKJSON) {
        self.init()
        productId = json["productId"].intValue
        id = json["id"].intValue
        productName = json["productName"].stringValue
        couponId = json["couponId"].intValue
        productSn = json["productSn"].stringValue
    }
}
public class PaymentParam: SGResponseItem {
    /// 来源类型 1:订单 2:礼包
    public var sourceType:Int?
    /// 支付类型 1:支付宝 2:微信
    public var payType:Int?
    /// 来源ID，如果是订单，则是订单ID
    public var sourceId:String?

    required convenience init(json:SKJSON) {
        self.init()
        sourceType = json["sourceType"].intValue
        payType = json["payType"].intValue
        sourceId = json["sourceId"].stringValue
    }
}
public class SmsCouponProductCategoryRelation: SGResponseItem {
    /// 产品分类名称
    public var productCategoryName:String?
    public var couponId:Int?
    public var id:Int?
    /// 父分类名称
    public var parentCategoryName:String?
    public var productCategoryId:Int?

    required convenience init(json:SKJSON) {
        self.init()
        productCategoryName = json["productCategoryName"].stringValue
        couponId = json["couponId"].intValue
        id = json["id"].intValue
        parentCategoryName = json["parentCategoryName"].stringValue
        productCategoryId = json["productCategoryId"].intValue
    }
}
public class CommonPage_PmsProduct: SGResponseItem {
    /// 每页数量
    public var pageSize:Int?
    /// 总条数
    public var total:Int?
    /// 分页数据
    public var list:[PmsProduct] = []
    /// 当前页码
    public var pageNum:Int?
    /// 总页数
    public var totalPage:Int?

    required convenience init(json:SKJSON) {
        self.init()
        pageSize = json["pageSize"].intValue
        total = json["total"].intValue
        for value in json["list"].arrayValue{
            list.append(PmsProduct(json: value))
        }
        pageNum = json["pageNum"].intValue
        totalPage = json["totalPage"].intValue
    }
}
