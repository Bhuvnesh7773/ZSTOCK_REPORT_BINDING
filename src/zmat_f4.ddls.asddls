@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material f4 Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zmat_f4 as select from I_StockQuantityCurrentValue_2( P_DisplayCurrency:'INR' ) as a
inner join I_ProductDescription_2 as b on ( b.Product  = a.Product and b.Language = 'E' )
{
@EndUserText.label: 'Product'
    key ltrim( a.Product , '0' ) as Product,
@EndUserText.label: 'Product Description'    
        b.ProductDescription
}
where ( a.ValuationAreaType = '1' and a.InventoryStockType = '01' )
group by
a.Product,
b.ProductDescription
