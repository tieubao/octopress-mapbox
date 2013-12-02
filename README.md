octopress-mapbox
================

A mapbox plugin for octopress. Make sure you have a Mapbox account and have configured your Map.


Install
================

* Clone this repository
* Copy all files into your octopress directory
* Include `mapbox_head` in `source/_includes/head.html` (`{% include custom/mapbox_head.html %}`)
* Import `_mapbox.scss` to your `screen.scss`
* Add `mapbox_id` to `_config.xml`

Usage
================

{% mapbox lat long zoomLevel %}

For more information, just check out the [demo page](http://tieubao.22journeys.com).