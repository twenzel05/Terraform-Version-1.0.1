provider "megaport" {
  environment           = "production"
  access_key            = "ej62iagd3csefajn3gag8a5ku"
  secret_key            = "1hpnnofkpjo0pj68nehs4jeoeecjq1ajq8aortk0rv0c0q1qptem"
  accept_purchase_terms = true
}

data "megaport_location" "dal_co1" {
  name = "Cologix DAL2"
}

resource "megaport_mve" "mve" {
  product_name           = "Megaport-Aruba-MVE"
  location_id            = data.megaport_location.dal_co1.id
  contract_term_months   = 1

  vendor_config = {
    vendor        = "aruba"
    product_size  = "SMALL"
    image_id      = 23
    account_name  = "Megaport-lab testbed"
    account_key   = "HIaFVxizkbN5kPInT20CNTdTa1euhKKG"
    system_tag    = "Megaport-Aruba-MVE"
  }
}
