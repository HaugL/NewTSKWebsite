Rails.configuration.stripe = {
  :publishable_key => 'pk_test_tHTRoomEEQUGkjUrtJa1LCgi',
  :secret_key      => 'sk_test_HUs8gN7gHsb4T8d3uDdPJlmo'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]