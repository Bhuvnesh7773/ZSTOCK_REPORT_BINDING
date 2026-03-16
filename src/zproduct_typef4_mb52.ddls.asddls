//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'F4 MB52'
//@Metadata.ignorePropagatedAnnotations: true
//define view entity ZPRODUCT_TYPEF4_MB52 as select from data_source_name
//{
//    
//}



@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Type F4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPRODUCT_TYPEF4_MB52 as select from I_StockQuantityCurrentValue_2( P_DisplayCurrency:'INR' ) as a
inner join I_ProductTypeText as b on ( b.ProductType = a.ProductType and b.Language = 'E' ) 
{
    @EndUserText.label: 'Product Type'
    key a.ProductType,
    @EndUserText.label: 'Product Type Text'
     b.MaterialTypeName 
    
}

where ( a.ValuationAreaType = '1' and a.InventoryStockType = '01' )
    and ( a.ProductType <> 'ZFRT' and    a.ProductType <> 'ZSFG' and  a.ProductType <> 'ZBYP' and   a.ProductType <> 'ZROH' )

//  and  a.ProductType <> 'ZFRT'  and   a.ProductType <> 'ZSFG' and   a.ProductType <> 'ZBYP'

group by
a.ProductType,
    b.MaterialTypeName
