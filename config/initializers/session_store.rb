Rails.application.config.session_store :cookie_store, key: '_myapp_session', domain: :all, tld_length: 2

    # {
    #   production: '.avenist.com',
    #   development: /(.+\.)?lvh.me/
    # }.fetch(Rails.env.to_sym, :all)
