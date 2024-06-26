provider "megaport" {
  environment           = "production"
  access_key            = "ej62iagd3csefajn3gag8a5ku"
  secret_key            = "1hpnnofkpjo0pj68nehs4jeoeecjq1ajq8aortk0rv0c0q1qptem"
  accept_purchase_terms = true
}

data "megaport_location" "dal_c01" {
  name = "Cologix DAL2"
}

resource "megaport_mcr" "mcr" {
  product_name         = "Megaport MCR Example"
  port_speed           = 1000
  location_id          = data.megaport_location.dal_c01.id
  contract_term_months = 1

  prefix_filter_lists = [{
    description    = "Megaport Prefix Filter List"
    address_family = "IPv4"
    entries = [
      {
        action = "permit"
        prefix = "10.0.1.0/24"
        ge     = 24
        le     = 24
      },
      {
        action = "deny"
        prefix = "10.0.2.0/24"
        ge     = 24
        le     = 24
      }
    ]
  }]
}
