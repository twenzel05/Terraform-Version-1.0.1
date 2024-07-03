provider "megaport" {
  environment           = "production"
  access_key            = "ej62iagd3csefajn3gag8a5ku"
  secret_key            = "1hpnnofkpjo0pj68nehs4jeoeecjq1ajq8aortk0rv0c0q1qptem"
  accept_purchase_terms = true
}

data "megaport_location" "dal_tx1" {
  name = "Digital Realty DAL1"
}

resource "megaport_mve" "mve" {
  product_name           = "Megaport-Cisco FTDv-MVE"
  location_id            = data.megaport_location.dal_tx1.id
  contract_term_months   = 1

  vendor_config = {
    vendor        = "Cisco"
    product_size  = "Medium"
    image_id      = 67
    account_name  = "Megaport-lab testbed"
    admin_password   = "Mtyonahrocks1!"
    manage_locally    = "yes"
  }
}
