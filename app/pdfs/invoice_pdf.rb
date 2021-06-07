class InvoicePdf
  include Prawn::View
  include WhatMonth
  def initialize(language, invoice)
    @invoice = invoice
    @language = language
    check_invoice_language
  end
  def check_invoice_language
    if @language == "es"
      generate_invoice_es
    else
      generate_invoice_eng
    end
  end
  def generate_invoice_es
    header
    content_es
    footer_es
  end
  def generate_invoice_eng
    header
    content_eng
    footer_eng
  end
  def header
    bounding_box([0, cursor], width: 535, height: 82) do
      text "URBAN EQUINOX S.L."
      move_down 8
      text "CIF: B666863614", leading: 2
      text "CALLE DE MARIA CUBI 78-80 ESC D LOCAL 15", leading: 2
      text "08006 Barcelona - España"
      image "app/assets/images/equinox_logo.png", at: [390, 82], width: 160
    end
  end
  def content_es
    transparent(1) do
      fill_color "A32921"
      fill_rectangle [65, 600], 200, 20
      fill_rectangle [440, 600], 100, 20
    end
    draw_text "Factura Nº", at: [0, 585]
    bounding_box([65, 600], width: 200, height: 20) do
      text "EQ0#{@invoice.sequence}-#{@invoice.created_at.strftime('%Y')}", align: :center, valign: :center, character_spacing: 1, color: "FFFFFF"
      stroke_bounds
    end
    draw_text "Fecha", at: [400, 585]
    bounding_box([440, 600], width: 100, height: 20) do
      text "#{Time.now.strftime("%d/%m/%Y")}", align: :center, valign: :center, character_spacing: 1, color: "FFFFFF"
      stroke_bounds
    end
    move_down 60
    text "Cliente:  #{@invoice.booking.tenant.full_name}", leading: 2
    text "Dirección:  #{@invoice.booking.tenant.full_address}", leading: 2
    text "NIF:  #{@invoice.booking.tenant.id_number}"
    bounding_box([0, 440], width: 540, height: 100) do
      transparent(1) do
        fill_color "A32921"
        fill_rectangle [0, 100], 540, 20
      end
      bounding_box([0,100], width: 540, height: 20) do
        bounding_box([0,20], width: 300, height: 20) do
          text "CONCEPTO", character_spacing: 1, color: "FFFFFF", valign: :center, align: :center
        end
        bounding_box([420,20], width: 120, height: 20) do
          text "SUBTOTAL", character_spacing: 1, color: "FFFFFF", valign: :center, align: :center
        end
        stroke_bounds
      end
      text_box "Honorarios #{@invoice.booking.flat.full_address}", at: [5, 55], width: 350, height: 100
      text_box "#{@invoice.booking.rent} €", at: [390, 55], width: 140, height: 100, align: :right
      stroke_bounds
    end
    bounding_box([270, 320], width: 180, height: 120) do
      move_down 3
      text "SUBTOTAL", align: :right
      move_down 5
      text "IVA 21%", align: :right
      move_down 5
      text "Total Factura", align: :right, style: :bold
      move_down 10
      text "Suplidos, renta, fianza e ITP", align: :right
      move_down 5
      text "Anticipo", align: :right
      move_down 10
      text "TOTAL", align: :right, style: :bold
    end
    bounding_box([450, 320], width: 80, height: 120) do
      move_down 3
      text "#{@invoice.booking.rent} €", align: :right
      move_down 5
      text "#{@invoice.iva} €", align: :right
      move_down 5
      text "#{@invoice.rent_with_iva} €", align: :right, style: :bold
      move_down 10
      text "#{@invoice.suplidos} €", align: :right
      move_down 5
      text "#{@invoice.booking.deposit.token_payment} €", align: :right
      move_down 10
      text "#{@invoice.total} €", align: :right, style: :bold
    end
    bounding_box([0,160], width: 300, height: 60) do
      font_size 11
      text "La Caixa Nº 2100 0878 27 020043 3184", leading: 2
      text "IBAN ES6621000878270200433184", leading: 2
      text "SWIFT/BIC CAIXESBBXXX"
    end
  end

  def content_eng
  end

  def footer_es
    bounding_box([0, 100], width: 540, height: 100) do
      image "app/assets/images/equinox_logo.png", position: :center, width: 108
      font_size 8
      text "Servicios inmobiliarios Barcelona-Madrid España", inline_format: true, align: :center
      move_down 5
      text "Tel.+34 93 140 26 20     Mov. +34 693 808 511     info@equinoxuh.com", align: :center
      move_down 5
      text "Calle Ronda Sant Pere 40,1-1 Barcelona     CIF B66863614     AICAT 7838", align: :center
    end
  end

  def footer_eng
        bounding_box([0, 100], width: 540, height: 100) do
      image "app/assets/images/equinox_logo.png", position: :center, width: 108
      font_size 8
      text "Servicios inmobiliarios Barcelona-Madrid España", inline_format: true, align: :center
      move_down 5
      text "Tel.+34 93 140 26 20     Mov. +34 693 808 511     info@equinoxuh.com", align: :center
      move_down 5
      text "Calle Ronda Sant Pere 40,1-1 Barcelona     CIF B66863614     AICAT 7838", align: :center
    end
  end

  def color_rectangles
  end
end
