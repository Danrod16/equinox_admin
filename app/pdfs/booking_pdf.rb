class BookingPdf
  include Prawn::View
  include WhatMonth
  def initialize(language)
    #@booking = booking
    @language = language
    @date = Time.now
    check_booking_language
  end
  def check_booking_language
    if @language == "es"
      generate_booking_es
    else
      generate_booking_eng
    end
  end
  def generate_booking_es
    logo
    content_es
    footer_es
  end
  def generate_booking_eng
    logo
    content_eng
    footer_eng
  end
  def logo
    bounding_box([0, cursor], width: 535, height: 82) do
      image "app/assets/images/equinox_logo.png", at: [390, 82], width: 160
    end
  end
  def content_es
    text "En Barcelona #{@date.day} de #{month_in_es(@date.month)} de #{@date.year}"
    move_down 10
    default_leading 2
    text "<b>URBAN EQUINOX S.L.</b> con CIF Nº B66863614 y en su representación Adriana Romero Rule con número DNI 54894231Q, actuando en representación del propietario de la vivienda sita en #{"@booking.flat.address"} y como Comercializador ejerce la promoción de la vivienda en régimen de alquiler de temporada.",inline_format: true
    move_down 10
    text "<b>Documento de Reserva - Arrendamiento de vivienda</b>", inline_format: true, align: :center
    move_down 10
    text "<b>#{"@booking.tenant.first_name"} #{"@booking.tenant.last_name"}</b> de nacionalidad #{"NACIONALIDAD"} con #{"TIPO DE DOCUMENTO"} Nº #{"@booking.tenant.dni"} en adelante ARRENDATARIO abona la cantidad de <b>#{"MONTO DE LA RESERVA"}€</b> en concepto de reserva. Dicha reserva se ha transferido a la cuenta del propietario y se aplicará a la fianza pactada.", inline_format: true
    move_down 10
    text "1.  El contrato de alquiler inicia el #{"FECHA INICIO"} y finaliza el #{"FECHA FINAL"} período de obligado cumplimiento. El contrato tendrá una validez de #{"DURACION DEL CONTRATO"}."
    text "2.  Urban Equinox percibirá en concepto de honorarios por parte del ARRENDATARIO, <b>#{"HONORARIOS DE LA AGENCIA"}€</b> más IVA(21%), previa emisión y recepción de factura.", inline_format: true
    text "3.  La renta pactada es de <b>#{"PRECIO ALQUILER"}€</b> al mes + IVA. Los gastos de comunidad e IBI están incluidos en el importe de alquiler. Los consumos de agua, luz y gas corren por cuenta del ARRENDATARIO. La fianza legal <b>#{"TOTAL FIANZA"}€</b>. Al finalizar el contrato se pagará una limpieza del piso y el importe total será facturado y descontado de la fianza.", inline_format: true
    text "4.  Se cubre un importe por ITP(Impuesto de Transmisiones Patrimonionales) de <b>#{"ITP"}€</b>.", inline_format: true
    text "5.  En caso de no formalizarse el contrato por causa imputable al ARRENDATARIO durante los próximos 2 días hábiles, éste perderá el 100% de la cantidad entregada en concepto de reserva."
    text "6.  En caso de no formalizarse el contrato de arrendamiento por causa imputable al arrendador y/o durante los próximos 2 días hábiles. Urban Equinox S.L. en nombre del propietario devolverá la cantidad total pagada como reserva en un plazo de 5 días hábiles tras la comunicación de no aceptación de arrendamiento."
    move_down 10
    text "El presente documento de reserva ha sido pactado y negociado por las partes de forma expresa, individual, y detallada en todos sus puntos y para que así conste y en prueba de conformidad de cuanto antecede, las partes lo firma por duplicado ejemplar y a un solo efecto, en el lugar y fecha indicados en el encabezamiento."
    draw_text "AGENTE", at: [40, 120]
    draw_text "CLIENTE", at: [440, 120]
  end
  def content_eng
  end
  def footer_es
    bounding_box([0, 90], width: 535, height: 90) do
      image "app/assets/images/equinox_logo.png", position: :center, width: 108
      text "<b>INFORMACION DE PROTECCION DE DATOS</b>", inline_format: true, align: :center, size: 10
      font_size 8
      text "Servicios inmoniliarios Barcelona-Madrid España", inline_format: true, align: :center
      text "Calle Ronda Sant Pere 40,1-1 Barcelona     Tel.+34 93 140 26 20     Mov. +34 693 808 511     CIF B66863614     AICAT 7838", align: :center
    end
  end
  def footer_eng
    bounding_box([0, 90], width: 535, height: 90) do
      image "app/assets/images/equinox_logo.png", position: :center, width: 108
      text "<b>INFORMACION DE PROTECCION DE DATOS</b>", inline_format: true, align: :center, size: 10
      font_size 8
      text "Servicios inmoniliarios Barcelona-Madrid España", inline_format: true, align: :center
      text "Calle Ronda Sant Pere 40,1-1 Barcelona     Tel.+34 93 140 26 20     Mov. +34 693 808 511     CIF B66863614     AICAT 7838", align: :center
    end
  end
end
