class IncidentPdf
  include Prawn::View
  include WhatMonth
  def initialize(incident)
    @incident = incident
    generate_incident
  end
  def generate_incident
    header
    content
    footer
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

  def content
    transparent(1) do
      fill_color "A32921"
      fill_rectangle [65, 600], 200, 20
      fill_rectangle [440, 600], 100, 20
    end
    draw_text "Factura Nº", at: [0, 585]
    bounding_box([65, 600], width: 200, height: 20) do
      text "EQX027-2021", align: :center, valign: :center, character_spacing: 1, color: "FFFFFF"
      stroke_bounds
    end
    draw_text "Fecha", at: [400, 585]
    bounding_box([440, 600], width: 100, height: 20) do
      text "#{Time.now.strftime("%d/%m/%Y")}", align: :center, valign: :center, character_spacing: 1, color: "FFFFFF"
      stroke_bounds
    end
    move_down 50
    text "Cliente:  #{@incident.booking.flat.landlord.full_name}", leading: 2
    text "Dirección:  #{@incident.booking.flat.landlord.full_address}", leading: 2
    text "NIF:  #{@incident.booking.flat.landlord.cif}", leading: 2
    text "Vivienda:  #{@incident.booking.flat.full_address}"
    bounding_box([0, 440], width: 540, height: 200) do
      transparent(1) do
        fill_color "A32921"
        fill_rectangle [0, 200], 540, 20
      end
      bounding_box([0,200], width: 540, height: 20) do
        bounding_box([0,20], width: 300, height: 20) do
          text "CONCEPTO INCIDENCIA", character_spacing: 1, color: "FFFFFF", valign: :center, align: :center
        end
        bounding_box([420,20], width: 120, height: 20) do
          text "SUBTOTAL", character_spacing: 1, color: "FFFFFF", valign: :center, align: :center
        end
        stroke_bounds
      end
      move_down 10
      text "#{@incident.title}", indent_paragraphs: 5
      move_down 10
      text_box "#{@incident.description}", at: [5, 140], width: 350, height: 100
      text_box "120,00€", at: [390, 120], width: 140, height: 100, align: :right
      text_box "Honorarios de gestión", at:[5, 20], width: 350, height: 20
      text_box "30,00€", at: [390, 20], width: 140, height: 100, align: :right
      stroke_bounds
    end
    bounding_box([270, 220], width: 180, height: 120) do
      move_down 3
      text "SUBTOTAL", align: :right
      move_down 5
      text "IVA 21%", align: :right
      move_down 10
      text "TOTAL", align: :right, style: :bold
    end
    bounding_box([450, 220], width: 80, height: 120) do
      move_down 3
      text "150,00€", align: :right
      move_down 5
      text "31,50€", align: :right
      move_down 10
      text "181,50€", align: :right, style: :bold
    end
    bounding_box([0,160], width: 300, height: 60) do
      font_size 11
      text "La Caixa Nº 2100 0878 27 020043 3184", leading: 2
      text "IBAN ES6621000878270200433184", leading: 2
      text "SWIFT/BIC CAIXESBBXXX"
    end
  end
  def footer
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
end
