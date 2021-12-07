import 'package:cached_network_image/cached_network_image.dart';
import 'package:configuration/utility/color_const.dart';
import 'package:configuration/utility/icon_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/attributes_product_local.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/description_model_local.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/image_model_local.dart';
import 'package:flutter_architecture/data/grocery/data_source/local/item_grocery_local.dart';
import 'package:flutter_architecture/presentation/detail_product.dart';
import 'package:flutter_architecture/presentation/home/controller/home_controller.dart';
import 'package:flutter_architecture/presentation/shop/widget/imag_slider.dart';
import 'package:flutter_architecture/style/font/font_constan.dart';
import 'package:flutter_architecture/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:configuration/utility/string_const.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return controller.isLoading? Center(child: CircularProgressIndicator(),):Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      IconConstant.LOGO,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: ColorConstant.text2,
                      ),
                      Text(
                        'Hà Nội, Việt Nam',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.text2)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    decoration: new InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: ColorConstant.text2,
                        ),
                        contentPadding: EdgeInsets.only(top: 8.h, left: 8.w),
                        fillColor: ColorConstant.card1,
                        filled: true,
                        constraints: BoxConstraints(maxHeight: 44.h),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          borderSide: BorderSide(
                              color: ColorConstant.activeColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          borderSide: BorderSide(color: Colors.white70, width: 1.0),
                        ),
                        hintText: 'Search in store',
                        hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ImageSlider(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Exclusive Offer',
                        style: TextStyle(
                            fontFamily: FontConstant.gilroy_bold,
                            fontSize: 24.sp,
                            color: ColorConstant.text3),
                      ),
                      Spacer(),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: ColorConstant.activeColor),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    width: 1.sw,
                    height: 0.34.sh,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          final data = controller.listItem[index];
                      return GestureDetector(
                        onTap: ()=>Get.to(()=>DetailProduct(productData: data,)),
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
                                imageUrl: "${StringConstant.link}${data.image}",
                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                              SizedBox(height: 34.h,),
                              Text('${data.descriptions!.first.name??'sss'}',
                                style: TextStyle(
                                    fontFamily: FontConstant.gilroy_bold  ,
                                    fontSize: 16.sp,
                                    color: ColorConstant.text3),),
                              SizedBox(height: 4.h,),
                              Text('${data.sku??'sss'}',
                                style: TextStyle(
                                    fontFamily: FontConstant.gilroy_medium ,
                                    fontSize: 16.sp,
                                    color: ColorConstant.stroke1),),
                              SizedBox(height: 12.h,),
                              Row(
                                children: [
                                  Text('đ ${data.price}',
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
                                          for(int i=0;i<data.images!.length;i++)
                                            {
                                                imageLocal.add(ImageModelLocal(image: data.images![i].image,
                                                id: data.images![i].id,productId: data.images![i].id));
                                            }
                                          if(data.attributes!.isNotEmpty)
                                            {
                                              for(int i= 0;i<data.attributes!.length;i++)
                                              {
                                                var dataAtt = data.attributes![i];
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
                                          for(int i=0;i<data.descriptions!.length;i++)
                                            {
                                              var desc = data.descriptions![i];
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
                                            status: data.status,
                                            sort: data.sort,
                                            id: data.id,
                                            image: data.image,
                                            width: data.width,
                                            height: data.height,
                                            cost: data.cost,
                                            alias: data.alias,
                                            attributes: attribute,
                                            brandId: data.brandId,
                                            descriptions: des,
                                            images: imageLocal,
                                            kind: data.kind,
                                            length: data.length,
                                            minimum: data.minimum,
                                            price: data.price,
                                            property: data.property,
                                            sku: data.sku,
                                            sold: data.sold,
                                            stock: data.stock,
                                            supplierId: data.supplierId,
                                            taxId: data.taxId,
                                            view: data.view,
                                            weight: data.weight
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
                    }),
                  ),
                  SizedBox(height: 30.h,),
                  Row(
                    children: [
                      Text(
                        'Groceries',
                        style: TextStyle(
                            fontFamily: FontConstant.gilroy_bold,
                            fontSize: 24.sp,
                            color: ColorConstant.text3),
                      ),
                      Spacer(),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: ColorConstant.activeColor),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    width: 1.sw,
                    height: 0.16.sh,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          final itemCategory = controller.listCategory[index];
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            height: 0.05.sh,
                            width: 0.8.sw,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                                border: Border.all(color: ColorConstant.stroke1.withOpacity(0.5))
                            ),
                            child:Row(children: [
                              CachedNetworkImage(
                                width: 0.23.sw,
                                height: 0.1.sh,
                                imageUrl: "${StringConstant.link}${itemCategory.image}",
                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                              SizedBox(width: 16.w,),
                              Expanded(
                                child: Text('${itemCategory.name}',style: TextStyle(fontFamily: FontConstant.gilroy_semibold,color: ColorConstant.text4,fontSize:
                                20.sp,),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                              )
                            ],),
                          );
                        }),
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    width: 1.sw,
                    height: 0.34.sh,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemBuilder: (context,index){
                          final data = controller.listItem[index];
                          return GestureDetector(
                            onTap: ()=>Get.to(()=>DetailProduct(productData: data)),
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
                                    imageUrl: "${StringConstant.link}${data.image}",
                                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                  SizedBox(height: 34.h,),
                                  Text('${data.descriptions!.first.name??'sss'}',
                                    style: TextStyle(
                                        fontFamily: FontConstant.gilroy_bold  ,
                                        fontSize: 16.sp,
                                        color: ColorConstant.text3),),
                                  SizedBox(height: 4.h,),
                                  Text('${data.sku??'0'}',
                                    style: TextStyle(
                                        fontFamily: FontConstant.gilroy_medium ,
                                        fontSize: 16.sp,
                                        color: ColorConstant.stroke1),),
                                  SizedBox(height: 12.h,),
                                  Row(
                                    children: [
                                      Text('\$4.99',
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
                                          onPressed: (){

                                          }, child: Icon(Icons.add,color: Colors.white,))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
