_ = require 'underscore'

module.exports =

  orderPaymentInfo: (orderId) ->
    orderPaymentInfo =
      container: 'orderPaymentInfo'
      key: orderId
      value:
        paymentMethod: 'Cash'
        paymentID: '7'

  shippingMethodMock: (zone, taxCategory) ->
    unique = new Date().getTime()
    shippingMethod =
      name: "S-#{unique}"
      zoneRates: [{
        zone:
          typeId: 'zone'
          id: zone.id
        shippingRates: [{
          price:
            currencyCode: 'EUR'
            centAmount: 99
          }]
        }]
      isDefault: false
      taxCategory:
        typeId: 'tax-category'
        id: taxCategory.id


  zoneMock: ->
    unique = new Date().getTime()
    zone =
      name: "Z-#{unique}"

  taxCategoryMock: ->
    unique = new Date().getTime()
    taxCategory =
      name: "TC-#{unique}"
      rates: [{
          name: "5%",
          amount: 0.05,
          includedInPrice: false,
          country: "DE",
          id: "jvzkDxzl"
        }]

  productTypeMock: ->
    unique = new Date().getTime()
    productType =
      name: "PT-#{unique}"
      description: 'bla'

  productMock: (productType) ->
    unique = new Date().getTime()
    product =
      productType:
        typeId: 'product-type'
        id: productType.id
      name:
        en: "P-#{unique}"
      slug:
        en: "p-#{unique}"
      masterVariant:
        sku: "sku-#{unique}"

  orderMock: (shippingMethod, product, taxCategory) ->
    unique = new Date().getTime()
    order =
      id: "order-#{unique}"
      orderState: 'Open'
      paymentState: 'Pending'
      shipmentState: 'Pending'

      lineItems: [ {
        productId: product.id
        name:
          de: 'foo'
        variant:
          id: 1
        taxRate:
          name: 'myTax'
          amount: 0.10
          includedInPrice: false
          country: 'DE'
        quantity: 1
        price:
          value:
            centAmount: 999
            currencyCode: 'EUR'
      } ]
      totalPrice:
        currencyCode: 'EUR'
        centAmount: 999
      returnInfo: []
      shippingInfo:
        shippingMethodName: 'UPS'
        price:
          currencyCode: 'EUR'
          centAmount: 99
        shippingRate:
          price:
            currencyCode: 'EUR'
            centAmount: 99
        taxRate: _.first taxCategory.rates
        taxCategory:
          typeId: 'tax-category'
          id: taxCategory.id
        shippingMethod:
          typeId: 'shipping-method'
          id: shippingMethod.id
