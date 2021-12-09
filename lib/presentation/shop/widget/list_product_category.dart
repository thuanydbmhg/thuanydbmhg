import 'package:cached_network_image/cached_network_image.dart';
import 'package:configuration/utility/color_const.dart';
import 'package:configuration/utility/string_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/attributes_product_local.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/description_model_local.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/image_model_local.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/item_grocery_local.dart';
import 'package:flutter_architecture/presentation/home/controller/home_controller.dart';
import 'package:flutter_architecture/presentation/shop/widget/empty_widget.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../detail_product.dart';
class ListProductCategory extends StatelessWidget {
  String title;
   ListProductCategory({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(title,style: TextStyle(
          fontFamily: FontConstant.gilroy_semibold,
          color: ColorConstant.textColor,
          fontSize: 18.sp
        ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios,size: 24.sp,color: ColorConstant.textColor,),
        ),
        elevation: 0,
      ),
      body:  GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.listItemSearch.isEmpty) {
            return Center(child: EmptyWidget());
          } else {
            return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              controller:  ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: controller.listItemSearch.map(( value) {
                return GestureDetector(
                  onTap: ()=>Get.to(()=>DetailProduct(productData: value)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    height: 0.29.sh,
                    width: 0.415.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        border: Border.all(color: ColorConstant.stroke1.withOpacity(0.5))
                    ),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 34.h,),
                        CachedNetworkImage(
                          width: 0.23.sw,
                          height: 0.1.sh,
                          imageUrl: "${StringConstant.link}${value.image}",
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        SizedBox(height: 34.h,),
                        Text('${value.descriptions!.first.name??'sss'}',
                          style: TextStyle(
                              fontFamily: FontConstant.gilroy_bold  ,
                              fontSize: 16.sp,
                              color: ColorConstant.text3),),
                        SizedBox(height: 4.h,),
                        Text('${value.sku??'0'}',
                          style: TextStyle(
                              fontFamily: FontConstant.gilroy_medium ,
                              fontSize: 16.sp,
                              color: ColorConstant.stroke1),),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text('đ ${value.price}',
                              style: TextStyle(
                                  fontFamily: FontConstant.gilroy_bold  ,
                                  fontSize: 16.sp,
                                  color: ColorConstant.text3),),
                            Spacer(),
                            TextButton(
                                style: TextButton.styleFrom(
                                    elevation: 8,
                                    backgroundColor: ColorConstant.activeColor,
                                    maximumSize: Size(45.w, 45.h),
                                    minimumSize: Size(45.w, 45.h),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(18.r))
                                    )
                                ),
                                onPressed: () async {
                                  List<ImageModelLocal> imageLocal =[];
                                  List<DesCriptionModelLocal> des =[];
                                  List<AttributesProductLocal> attribute =[];
                                  for(int i=0;i<value.images!.length;i++)
                                  {
                                    imageLocal.add(ImageModelLocal(image: value.images![i].image,
                                        id: value.images![i].id,productId: value.images![i].id));
                                  }
                                  if(value.attributes!.isNotEmpty)
                                  {
                                    for(int i= 0;i<value.attributes!.length;i++)
                                    {
                                      var dataAtt = value.attributes![i];
                                      attribute.add(AttributesProductLocal(
                                          productId: dataAtt.productId,
                                          id: dataAtt.id,
                                          name: dataAtt.name,
                                          addPrice: dataAtt.addPrice,
                                          attributeGroupId: dataAtt.attributeGroupId,
                                          sort: dataAtt.sort,
                                          status: dataAtt.status
                                      ));
                                    }
                                  }
                                  for(int i=0;i<value.descriptions!.length;i++)
                                  {
                                    var desc = value.descriptions![i];
                                    des.add(DesCriptionModelLocal(
                                        name: desc.name,
                                        productId: desc.productId,
                                        content: desc.content,
                                        description: desc.description,
                                        keyword: desc.keyword,
                                        lang: desc.lang
                                    ));
                                  }
                                  await controller.addToCart(ItemGroceryLocal(
                                      status: value.status,
                                      sort: value.sort,
                                      id: value.id,
                                      image: value.image,
                                      width: value.width,
                                      height: value.height,
                                      cost: value.cost,
                                      alias: value.alias,
                                      attributes: attribute,
                                      brandId: value.brandId,
                                      descriptions: des,
                                      images: imageLocal,
                                      kind: value.kind,
                                      length: value.length,
                                      minimum: value.minimum,
                                      price: value.price,
                                      property: value.property,
                                      sku: value.sku,
                                      sold: value.sold,
                                      stock: value.stock,
                                      supplierId: value.supplierId,
                                      taxId: value.taxId,
                                      view: value.view,
                                      weight: value.weight
                                  ));
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Item add to cart"),
                                  ));
                                }, child: Icon(Icons.add,color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
          }
        }
      ),
    );
  }
}
