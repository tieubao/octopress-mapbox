# Title: Mapbox Tag for Jekyll
# Authors:  Tieu Bao 
#           http://tieubao.22journeys.com/writing/
#           Ho Chi Minh, Vietnam
#
# Description: Easily output map provided by Mapbox
#
# Syntax {% mapbox lat long zoomLevel %}
#

module Jekyll

  class MapboxTag < Liquid::Tag

    @lat = nil
    @long = nil
    @zoomLevel = nil

    def initialize(tag_name, markup, tokens)
      if markup =~ /(-?\d{1,3}\.\d+)(\s+)(-?\d{1,3}\.\d+)(\s+)(\d+)(\s*)/i
        @lat=$1
        @long=$3
        @zoomLevel=$5
      end
      super
    end

    def render(context)
      output = super

      # mapbox_id = Jekyll.configuration({})['mapbox_id']

      config = context.registers[:site].config
      mapbox_id = config['mapbox_id']

      if @lat
        source = "<div id='map' style='height:420px'></div>"\
                 "<script type='text/javascript'>"\
                 "jQuery(document).ready(function() {"\
                 "L.mapbox.map('map', '#{mapbox_id}', {legendControl: true, shareControl: true}).setView([#{@lat}, #{@long}], #{@zoomLevel});"\
                 "});"\
                 "</script>"
        source
      else
        "Error processing input, expected syntax: {% mapbox lat long zoomLevel %}"
      end
    end
  end
end

Liquid::Template.register_tag('mapbox', Jekyll::MapboxTag)
