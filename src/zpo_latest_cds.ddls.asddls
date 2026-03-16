@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO LATEST CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity Zpo_Latest_CDS as select from I_PurchaseOrderItemAPI01 as a
{
    key max( a.PurchaseOrder ) as PurchaseOrder,
        a.Material
}
where a.MaterialType = 'ZCAP'
group by
    a.Material
