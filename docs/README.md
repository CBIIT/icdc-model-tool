<link rel='stylesheet' href="assets/style.css">
<link rel='stylesheet' href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"  src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>
<script type="text/javascript" src="assets/actions.js"></script>

[![Build Status](https://travis-ci.org/CBIIT/icdc-model-tool.svg?branch=master)](https://travis-ci.org/CBIIT/icdc-model-tool)

# Integrated Canine Data Commons Data Model

[View model on GitHub Pages](https://cbiit.github.io/icdc-model-tool/)




Zoom to Node: <select id="node_select">
  <option value="">Zoom to Node</option>
</select>
<div id="model"></div>

<p>
<a href="./model-desc/icdc-model-tool.svg">SVG file (in view above)</a>
<p>
<a href="./model-desc">Additional model files</a>
<div id='graph' style='display:off;'>
<svg width="4012pt" height="3058pt"
 viewBox="0.00 0.00 4012.00 3058.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 3054)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-3054 4008,-3054 4008,4 -4,4"/>
<!-- vital_signs -->
<g id="node1" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M523,-1923C523,-1923 810,-1923 810,-1923 816,-1923 822,-1929 822,-1935 822,-1935 822,-2233 822,-2233 822,-2239 816,-2245 810,-2245 810,-2245 523,-2245 523,-2245 517,-2245 511,-2239 511,-2233 511,-2233 511,-1935 511,-1935 511,-1929 517,-1923 523,-1923"/>
<text text-anchor="middle" x="557.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="604,-1923 604,-2245 "/>
<text text-anchor="middle" x="614.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="625,-1923 625,-2245 "/>
<text text-anchor="middle" x="713" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="625,-2222 801,-2222 "/>
<text text-anchor="middle" x="713" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="625,-2199 801,-2199 "/>
<text text-anchor="middle" x="713" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="625,-2176 801,-2176 "/>
<text text-anchor="middle" x="713" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="625,-2153 801,-2153 "/>
<text text-anchor="middle" x="713" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="625,-2130 801,-2130 "/>
<text text-anchor="middle" x="713" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="625,-2107 801,-2107 "/>
<text text-anchor="middle" x="713" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="625,-2084 801,-2084 "/>
<text text-anchor="middle" x="713" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="625,-2061 801,-2061 "/>
<text text-anchor="middle" x="713" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="625,-2038 801,-2038 "/>
<text text-anchor="middle" x="713" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="625,-2015 801,-2015 "/>
<text text-anchor="middle" x="713" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="625,-1992 801,-1992 "/>
<text text-anchor="middle" x="713" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="625,-1969 801,-1969 "/>
<text text-anchor="middle" x="713" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="625,-1946 801,-1946 "/>
<text text-anchor="middle" x="713" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="801,-1923 801,-2245 "/>
<text text-anchor="middle" x="811.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node16" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1307,-1595C1307,-1595 1482,-1595 1482,-1595 1488,-1595 1494,-1601 1494,-1607 1494,-1607 1494,-1629 1494,-1629 1494,-1635 1488,-1641 1482,-1641 1482,-1641 1307,-1641 1307,-1641 1301,-1641 1295,-1635 1295,-1629 1295,-1629 1295,-1607 1295,-1607 1295,-1601 1301,-1595 1307,-1595"/>
<text text-anchor="middle" x="1318.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1342,-1595 1342,-1641 "/>
<text text-anchor="middle" x="1352.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1363,-1595 1363,-1641 "/>
<text text-anchor="middle" x="1418" y="-1625.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1363,-1618 1473,-1618 "/>
<text text-anchor="middle" x="1418" y="-1602.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1473,-1595 1473,-1641 "/>
<text text-anchor="middle" x="1483.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge8" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M721.0163,-1922.8998C746.5993,-1868.449 782.3217,-1811.7105 830.5,-1773 848.8423,-1758.2622 1136.3361,-1683.5985 1293.5805,-1643.5205"/>
<polygon fill="#000000" stroke="#000000" points="1294.4555,-1646.9095 1303.2823,-1641.0495 1292.7278,-1640.126 1294.4555,-1646.9095"/>
<text text-anchor="middle" x="951.5" y="-1743.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event -->
<g id="node2" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1569,-668.5C1569,-668.5 1964,-668.5 1964,-668.5 1970,-668.5 1976,-674.5 1976,-680.5 1976,-680.5 1976,-1047.5 1976,-1047.5 1976,-1053.5 1970,-1059.5 1964,-1059.5 1964,-1059.5 1569,-1059.5 1569,-1059.5 1563,-1059.5 1557,-1053.5 1557,-1047.5 1557,-1047.5 1557,-680.5 1557,-680.5 1557,-674.5 1563,-668.5 1569,-668.5"/>
<text text-anchor="middle" x="1617" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1677,-668.5 1677,-1059.5 "/>
<text text-anchor="middle" x="1687.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1698,-668.5 1698,-1059.5 "/>
<text text-anchor="middle" x="1826.5" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1698,-1036.5 1955,-1036.5 "/>
<text text-anchor="middle" x="1826.5" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1698,-1013.5 1955,-1013.5 "/>
<text text-anchor="middle" x="1826.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1698,-990.5 1955,-990.5 "/>
<text text-anchor="middle" x="1826.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1698,-967.5 1955,-967.5 "/>
<text text-anchor="middle" x="1826.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1698,-944.5 1955,-944.5 "/>
<text text-anchor="middle" x="1826.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1698,-921.5 1955,-921.5 "/>
<text text-anchor="middle" x="1826.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1698,-898.5 1955,-898.5 "/>
<text text-anchor="middle" x="1826.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1698,-875.5 1955,-875.5 "/>
<text text-anchor="middle" x="1826.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1698,-852.5 1955,-852.5 "/>
<text text-anchor="middle" x="1826.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1698,-829.5 1955,-829.5 "/>
<text text-anchor="middle" x="1826.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1698,-806.5 1955,-806.5 "/>
<text text-anchor="middle" x="1826.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1698,-783.5 1955,-783.5 "/>
<text text-anchor="middle" x="1826.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1698,-760.5 1955,-760.5 "/>
<text text-anchor="middle" x="1826.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1698,-737.5 1955,-737.5 "/>
<text text-anchor="middle" x="1826.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1698,-714.5 1955,-714.5 "/>
<text text-anchor="middle" x="1826.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1698,-691.5 1955,-691.5 "/>
<text text-anchor="middle" x="1826.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1955,-668.5 1955,-1059.5 "/>
<text text-anchor="middle" x="1965.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge20" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1976.2046,-891.2761C1987.376,-884.5862 1994,-875.4941 1994,-864 1994,-855.7386 1990.5781,-848.7181 1984.5052,-842.9385"/>
<polygon fill="#000000" stroke="#000000" points="1986.3073,-839.9155 1976.2046,-836.7239 1982.1119,-845.519 1986.3073,-839.9155"/>
<text text-anchor="middle" x="2010" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- case -->
<g id="node12" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M2062,-1111.5C2062,-1111.5 2281,-1111.5 2281,-1111.5 2287,-1111.5 2293,-1117.5 2293,-1123.5 2293,-1123.5 2293,-1191.5 2293,-1191.5 2293,-1197.5 2287,-1203.5 2281,-1203.5 2281,-1203.5 2062,-1203.5 2062,-1203.5 2056,-1203.5 2050,-1197.5 2050,-1191.5 2050,-1191.5 2050,-1123.5 2050,-1123.5 2050,-1117.5 2056,-1111.5 2062,-1111.5"/>
<text text-anchor="middle" x="2074.5" y="-1153.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="2099,-1111.5 2099,-1203.5 "/>
<text text-anchor="middle" x="2109.5" y="-1153.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2120,-1111.5 2120,-1203.5 "/>
<text text-anchor="middle" x="2196" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="2120,-1180.5 2272,-1180.5 "/>
<text text-anchor="middle" x="2196" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="2120,-1157.5 2272,-1157.5 "/>
<text text-anchor="middle" x="2196" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="2120,-1134.5 2272,-1134.5 "/>
<text text-anchor="middle" x="2196" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2272,-1111.5 2272,-1203.5 "/>
<text text-anchor="middle" x="2282.5" y="-1153.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge39" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1948.256,-1059.6033C1963.2978,-1071.6597 1978.7803,-1082.957 1994.5,-1093 2008.6693,-1102.0525 2024.2858,-1110.0703 2040.1969,-1117.104"/>
<polygon fill="#000000" stroke="#000000" points="2039.0204,-1120.4077 2049.5904,-1121.132 2041.7791,-1113.9742 2039.0204,-1120.4077"/>
<text text-anchor="middle" x="2021.5" y="-1081.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent -->
<g id="node21" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1629.5,-559C1629.5,-559 1855.5,-559 1855.5,-559 1861.5,-559 1867.5,-565 1867.5,-571 1867.5,-571 1867.5,-593 1867.5,-593 1867.5,-599 1861.5,-605 1855.5,-605 1855.5,-605 1629.5,-605 1629.5,-605 1623.5,-605 1617.5,-599 1617.5,-593 1617.5,-593 1617.5,-571 1617.5,-571 1617.5,-565 1623.5,-559 1629.5,-559"/>
<text text-anchor="middle" x="1646" y="-578.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1674.5,-559 1674.5,-605 "/>
<text text-anchor="middle" x="1685" y="-578.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1695.5,-559 1695.5,-605 "/>
<text text-anchor="middle" x="1771" y="-589.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1695.5,-582 1846.5,-582 "/>
<text text-anchor="middle" x="1771" y="-566.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1846.5,-559 1846.5,-605 "/>
<text text-anchor="middle" x="1857" y="-578.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge16" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1749.8312,-668.1416C1748.1357,-648.2196 1746.5875,-630.0287 1745.3553,-615.55"/>
<polygon fill="#000000" stroke="#000000" points="1748.8129,-614.9017 1744.4774,-605.2346 1741.8381,-615.4954 1748.8129,-614.9017"/>
<text text-anchor="middle" x="1778.5" y="-638.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- lab_exam -->
<g id="node3" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1367.5,-2066C1367.5,-2066 1427.5,-2066 1427.5,-2066 1433.5,-2066 1439.5,-2072 1439.5,-2078 1439.5,-2078 1439.5,-2090 1439.5,-2090 1439.5,-2096 1433.5,-2102 1427.5,-2102 1427.5,-2102 1367.5,-2102 1367.5,-2102 1361.5,-2102 1355.5,-2096 1355.5,-2090 1355.5,-2090 1355.5,-2078 1355.5,-2078 1355.5,-2072 1361.5,-2066 1367.5,-2066"/>
<text text-anchor="middle" x="1397.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge10" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1397.3824,-2065.7322C1396.9307,-1995.5634 1395.3028,-1742.7088 1394.7143,-1651.2822"/>
<polygon fill="#000000" stroke="#000000" points="1398.2138,-1651.1802 1394.6494,-1641.203 1391.2139,-1651.2254 1398.2138,-1651.1802"/>
<text text-anchor="middle" x="1423.5" y="-1743.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam -->
<g id="node4" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1827.5,-1992C1827.5,-1992 2143.5,-1992 2143.5,-1992 2149.5,-1992 2155.5,-1998 2155.5,-2004 2155.5,-2004 2155.5,-2164 2155.5,-2164 2155.5,-2170 2149.5,-2176 2143.5,-2176 2143.5,-2176 1827.5,-2176 1827.5,-2176 1821.5,-2176 1815.5,-2170 1815.5,-2164 1815.5,-2164 1815.5,-2004 1815.5,-2004 1815.5,-1998 1821.5,-1992 1827.5,-1992"/>
<text text-anchor="middle" x="1876.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1937.5,-1992 1937.5,-2176 "/>
<text text-anchor="middle" x="1948" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1958.5,-1992 1958.5,-2176 "/>
<text text-anchor="middle" x="2046.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1958.5,-2153 2134.5,-2153 "/>
<text text-anchor="middle" x="2046.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1958.5,-2130 2134.5,-2130 "/>
<text text-anchor="middle" x="2046.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1958.5,-2107 2134.5,-2107 "/>
<text text-anchor="middle" x="2046.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1958.5,-2084 2134.5,-2084 "/>
<text text-anchor="middle" x="2046.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1958.5,-2061 2134.5,-2061 "/>
<text text-anchor="middle" x="2046.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1958.5,-2038 2134.5,-2038 "/>
<text text-anchor="middle" x="2046.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1958.5,-2015 2134.5,-2015 "/>
<text text-anchor="middle" x="2046.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2134.5,-1992 2134.5,-2176 "/>
<text text-anchor="middle" x="2145" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge12" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1952.4048,-1991.9248C1923.4611,-1923.1714 1875.2264,-1831.3811 1806.5,-1773 1719.4834,-1699.0819 1593.7125,-1658.65 1504.0567,-1637.7947"/>
<polygon fill="#000000" stroke="#000000" points="1504.658,-1634.3421 1494.1301,-1635.5311 1503.1016,-1641.1669 1504.658,-1634.3421"/>
<text text-anchor="middle" x="1806.5" y="-1743.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- enrollment -->
<g id="node28" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2245,-1514.5C2245,-1514.5 2594,-1514.5 2594,-1514.5 2600,-1514.5 2606,-1520.5 2606,-1526.5 2606,-1526.5 2606,-1709.5 2606,-1709.5 2606,-1715.5 2600,-1721.5 2594,-1721.5 2594,-1721.5 2245,-1721.5 2245,-1721.5 2239,-1721.5 2233,-1715.5 2233,-1709.5 2233,-1709.5 2233,-1526.5 2233,-1526.5 2233,-1520.5 2239,-1514.5 2245,-1514.5"/>
<text text-anchor="middle" x="2280.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2328,-1514.5 2328,-1721.5 "/>
<text text-anchor="middle" x="2338.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2349,-1514.5 2349,-1721.5 "/>
<text text-anchor="middle" x="2467" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2349,-1698.5 2585,-1698.5 "/>
<text text-anchor="middle" x="2467" y="-1683.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2349,-1675.5 2585,-1675.5 "/>
<text text-anchor="middle" x="2467" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2349,-1652.5 2585,-1652.5 "/>
<text text-anchor="middle" x="2467" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2349,-1629.5 2585,-1629.5 "/>
<text text-anchor="middle" x="2467" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2349,-1606.5 2585,-1606.5 "/>
<text text-anchor="middle" x="2467" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2349,-1583.5 2585,-1583.5 "/>
<text text-anchor="middle" x="2467" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2349,-1560.5 2585,-1560.5 "/>
<text text-anchor="middle" x="2467" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2349,-1537.5 2585,-1537.5 "/>
<text text-anchor="middle" x="2467" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2585,-1514.5 2585,-1721.5 "/>
<text text-anchor="middle" x="2595.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge35" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2023.447,-1991.9163C2054.2147,-1925.3734 2102.5909,-1836.4073 2164.5,-1773 2182.4721,-1754.593 2203.0663,-1737.495 2224.5892,-1721.8908"/>
<polygon fill="#000000" stroke="#000000" points="2226.7666,-1724.637 2232.88,-1715.9838 2222.7047,-1718.9359 2226.7666,-1724.637"/>
<text text-anchor="middle" x="2249.5" y="-1743.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- disease_extent -->
<g id="node5" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M1469.5,-1934.5C1469.5,-1934.5 1785.5,-1934.5 1785.5,-1934.5 1791.5,-1934.5 1797.5,-1940.5 1797.5,-1946.5 1797.5,-1946.5 1797.5,-2221.5 1797.5,-2221.5 1797.5,-2227.5 1791.5,-2233.5 1785.5,-2233.5 1785.5,-2233.5 1469.5,-2233.5 1469.5,-2233.5 1463.5,-2233.5 1457.5,-2227.5 1457.5,-2221.5 1457.5,-2221.5 1457.5,-1946.5 1457.5,-1946.5 1457.5,-1940.5 1463.5,-1934.5 1469.5,-1934.5"/>
<text text-anchor="middle" x="1519" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1580.5,-1934.5 1580.5,-2233.5 "/>
<text text-anchor="middle" x="1591" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1601.5,-1934.5 1601.5,-2233.5 "/>
<text text-anchor="middle" x="1689" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2210.5 1776.5,-2210.5 "/>
<text text-anchor="middle" x="1689" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2187.5 1776.5,-2187.5 "/>
<text text-anchor="middle" x="1689" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2164.5 1776.5,-2164.5 "/>
<text text-anchor="middle" x="1689" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2141.5 1776.5,-2141.5 "/>
<text text-anchor="middle" x="1689" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2118.5 1776.5,-2118.5 "/>
<text text-anchor="middle" x="1689" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2095.5 1776.5,-2095.5 "/>
<text text-anchor="middle" x="1689" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2072.5 1776.5,-2072.5 "/>
<text text-anchor="middle" x="1689" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2049.5 1776.5,-2049.5 "/>
<text text-anchor="middle" x="1689" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2026.5 1776.5,-2026.5 "/>
<text text-anchor="middle" x="1689" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1601.5,-2003.5 1776.5,-2003.5 "/>
<text text-anchor="middle" x="1689" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1601.5,-1980.5 1776.5,-1980.5 "/>
<text text-anchor="middle" x="1689" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1601.5,-1957.5 1776.5,-1957.5 "/>
<text text-anchor="middle" x="1689" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1776.5,-1934.5 1776.5,-2233.5 "/>
<text text-anchor="middle" x="1787" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge7" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1552.6554,-1934.3108C1502.1078,-1833.2156 1439.5113,-1708.0227 1410.5664,-1650.1329"/>
<polygon fill="#000000" stroke="#000000" points="1413.6558,-1648.4852 1406.0531,-1641.1062 1407.3948,-1651.6158 1413.6558,-1648.4852"/>
<text text-anchor="middle" x="1484.5" y="-1743.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample -->
<g id="node6" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M852,-1773.5C852,-1773.5 1275,-1773.5 1275,-1773.5 1281,-1773.5 1287,-1779.5 1287,-1785.5 1287,-1785.5 1287,-2382.5 1287,-2382.5 1287,-2388.5 1281,-2394.5 1275,-2394.5 1275,-2394.5 852,-2394.5 852,-2394.5 846,-2394.5 840,-2388.5 840,-2382.5 840,-2382.5 840,-1785.5 840,-1785.5 840,-1779.5 846,-1773.5 852,-1773.5"/>
<text text-anchor="middle" x="874" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="908,-1773.5 908,-2394.5 "/>
<text text-anchor="middle" x="918.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="929,-1773.5 929,-2394.5 "/>
<text text-anchor="middle" x="1097.5" y="-2379.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="929,-2371.5 1266,-2371.5 "/>
<text text-anchor="middle" x="1097.5" y="-2356.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="929,-2348.5 1266,-2348.5 "/>
<text text-anchor="middle" x="1097.5" y="-2333.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="929,-2325.5 1266,-2325.5 "/>
<text text-anchor="middle" x="1097.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">volume_of_tumor</text>
<polyline fill="none" stroke="#000000" points="929,-2302.5 1266,-2302.5 "/>
<text text-anchor="middle" x="1097.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="929,-2279.5 1266,-2279.5 "/>
<text text-anchor="middle" x="1097.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="929,-2256.5 1266,-2256.5 "/>
<text text-anchor="middle" x="1097.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">summarized_sample_type</text>
<polyline fill="none" stroke="#000000" points="929,-2233.5 1266,-2233.5 "/>
<text text-anchor="middle" x="1097.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="929,-2210.5 1266,-2210.5 "/>
<text text-anchor="middle" x="1097.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_chronology</text>
<polyline fill="none" stroke="#000000" points="929,-2187.5 1266,-2187.5 "/>
<text text-anchor="middle" x="1097.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="929,-2164.5 1266,-2164.5 "/>
<text text-anchor="middle" x="1097.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="929,-2141.5 1266,-2141.5 "/>
<text text-anchor="middle" x="1097.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="929,-2118.5 1266,-2118.5 "/>
<text text-anchor="middle" x="1097.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_sample_type</text>
<polyline fill="none" stroke="#000000" points="929,-2095.5 1266,-2095.5 "/>
<text text-anchor="middle" x="1097.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="929,-2072.5 1266,-2072.5 "/>
<text text-anchor="middle" x="1097.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="929,-2049.5 1266,-2049.5 "/>
<text text-anchor="middle" x="1097.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_sample_origin</text>
<polyline fill="none" stroke="#000000" points="929,-2026.5 1266,-2026.5 "/>
<text text-anchor="middle" x="1097.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="929,-2003.5 1266,-2003.5 "/>
<text text-anchor="middle" x="1097.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_preservation</text>
<polyline fill="none" stroke="#000000" points="929,-1980.5 1266,-1980.5 "/>
<text text-anchor="middle" x="1097.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="929,-1957.5 1266,-1957.5 "/>
<text text-anchor="middle" x="1097.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="929,-1934.5 1266,-1934.5 "/>
<text text-anchor="middle" x="1097.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="929,-1911.5 1266,-1911.5 "/>
<text text-anchor="middle" x="1097.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="929,-1888.5 1266,-1888.5 "/>
<text text-anchor="middle" x="1097.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">molecular_subtype</text>
<polyline fill="none" stroke="#000000" points="929,-1865.5 1266,-1865.5 "/>
<text text-anchor="middle" x="1097.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="929,-1842.5 1266,-1842.5 "/>
<text text-anchor="middle" x="1097.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_grade</text>
<polyline fill="none" stroke="#000000" points="929,-1819.5 1266,-1819.5 "/>
<text text-anchor="middle" x="1097.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="929,-1796.5 1266,-1796.5 "/>
<text text-anchor="middle" x="1097.5" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1266,-1773.5 1266,-2394.5 "/>
<text text-anchor="middle" x="1276.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge21" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1287.0955,-2124.79C1298.3572,-2114.6592 1305,-2101.0625 1305,-2084 1305,-2070.8032 1301.0262,-2059.6797 1294.0151,-2050.6295"/>
<polygon fill="#000000" stroke="#000000" points="1296.4756,-2048.136 1287.0955,-2043.21 1291.3563,-2052.9103 1296.4756,-2048.136"/>
<text text-anchor="middle" x="1321" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge43" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1069.684,-1773.1241C1071.9566,-1761.8854 1074.5498,-1750.8119 1077.5,-1740 1141.8836,-1504.0508 1155.7039,-1418.6077 1337.5,-1255 1366.3948,-1228.9961 1380.706,-1231.0952 1418.5,-1222 1532.8009,-1194.4931 1856.0598,-1173.8905 2039.7216,-1164.0048"/>
<polygon fill="#000000" stroke="#000000" points="2039.9165,-1167.4995 2049.7151,-1163.47 2039.5424,-1160.5095 2039.9165,-1167.4995"/>
<text text-anchor="middle" x="1184.5" y="-1484.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge9" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1284.0518,-1773.4951C1320.0087,-1722.873 1352.0529,-1677.7593 1372.2438,-1649.3336"/>
<polygon fill="#000000" stroke="#000000" points="1375.1831,-1651.2394 1378.1205,-1641.0599 1369.4762,-1647.1858 1375.1831,-1651.2394"/>
<text text-anchor="middle" x="1334.5" y="-1743.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- image -->
<g id="node7" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1919.5,-2928C1919.5,-2928 1955.5,-2928 1955.5,-2928 1961.5,-2928 1967.5,-2934 1967.5,-2940 1967.5,-2940 1967.5,-2952 1967.5,-2952 1967.5,-2958 1961.5,-2964 1955.5,-2964 1955.5,-2964 1919.5,-2964 1919.5,-2964 1913.5,-2964 1907.5,-2958 1907.5,-2952 1907.5,-2952 1907.5,-2940 1907.5,-2940 1907.5,-2934 1913.5,-2928 1919.5,-2928"/>
<text text-anchor="middle" x="1937.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node15" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1921.5,-2754.5C1921.5,-2754.5 1953.5,-2754.5 1953.5,-2754.5 1959.5,-2754.5 1965.5,-2760.5 1965.5,-2766.5 1965.5,-2766.5 1965.5,-2778.5 1965.5,-2778.5 1965.5,-2784.5 1959.5,-2790.5 1953.5,-2790.5 1953.5,-2790.5 1921.5,-2790.5 1921.5,-2790.5 1915.5,-2790.5 1909.5,-2784.5 1909.5,-2778.5 1909.5,-2778.5 1909.5,-2766.5 1909.5,-2766.5 1909.5,-2760.5 1915.5,-2754.5 1921.5,-2754.5"/>
<text text-anchor="middle" x="1937.5" y="-2768.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge15" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1937.5,-2927.7604C1937.5,-2897.5622 1937.5,-2836.9545 1937.5,-2801.0457"/>
<polygon fill="#000000" stroke="#000000" points="1941.0001,-2800.7555 1937.5,-2790.7556 1934.0001,-2800.7556 1941.0001,-2800.7555"/>
<text text-anchor="middle" x="1968" y="-2812.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- follow_up -->
<g id="node8" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M2893.5,-1255.5C2893.5,-1255.5 3225.5,-1255.5 3225.5,-1255.5 3231.5,-1255.5 3237.5,-1261.5 3237.5,-1267.5 3237.5,-1267.5 3237.5,-1450.5 3237.5,-1450.5 3237.5,-1456.5 3231.5,-1462.5 3225.5,-1462.5 3225.5,-1462.5 2893.5,-1462.5 2893.5,-1462.5 2887.5,-1462.5 2881.5,-1456.5 2881.5,-1450.5 2881.5,-1450.5 2881.5,-1267.5 2881.5,-1267.5 2881.5,-1261.5 2887.5,-1255.5 2893.5,-1255.5"/>
<text text-anchor="middle" x="2924" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2966.5,-1255.5 2966.5,-1462.5 "/>
<text text-anchor="middle" x="2977" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2987.5,-1255.5 2987.5,-1462.5 "/>
<text text-anchor="middle" x="3102" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2987.5,-1439.5 3216.5,-1439.5 "/>
<text text-anchor="middle" x="3102" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2987.5,-1416.5 3216.5,-1416.5 "/>
<text text-anchor="middle" x="3102" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2987.5,-1393.5 3216.5,-1393.5 "/>
<text text-anchor="middle" x="3102" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2987.5,-1370.5 3216.5,-1370.5 "/>
<text text-anchor="middle" x="3102" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2987.5,-1347.5 3216.5,-1347.5 "/>
<text text-anchor="middle" x="3102" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2987.5,-1324.5 3216.5,-1324.5 "/>
<text text-anchor="middle" x="3102" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2987.5,-1301.5 3216.5,-1301.5 "/>
<text text-anchor="middle" x="3102" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2987.5,-1278.5 3216.5,-1278.5 "/>
<text text-anchor="middle" x="3102" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="3216.5,-1255.5 3216.5,-1462.5 "/>
<text text-anchor="middle" x="3227" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge44" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2933.6225,-1255.4389C2912.5493,-1242.2393 2890.1444,-1230.4223 2867.5,-1222 2767.3436,-1184.7481 2475.5884,-1168.2248 2303.2598,-1161.54"/>
<polygon fill="#000000" stroke="#000000" points="2303.2322,-1158.0365 2293.1059,-1161.1522 2302.965,-1165.0314 2303.2322,-1158.0365"/>
<text text-anchor="middle" x="2923.5" y="-1225.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node9" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2185.5,-1785C2185.5,-1785 2641.5,-1785 2641.5,-1785 2647.5,-1785 2653.5,-1791 2653.5,-1797 2653.5,-1797 2653.5,-2371 2653.5,-2371 2653.5,-2377 2647.5,-2383 2641.5,-2383 2641.5,-2383 2185.5,-2383 2185.5,-2383 2179.5,-2383 2173.5,-2377 2173.5,-2371 2173.5,-2371 2173.5,-1797 2173.5,-1797 2173.5,-1791 2179.5,-1785 2185.5,-1785"/>
<text text-anchor="middle" x="2231" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2288.5,-1785 2288.5,-2383 "/>
<text text-anchor="middle" x="2299" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2309.5,-1785 2309.5,-2383 "/>
<text text-anchor="middle" x="2471" y="-2367.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2360 2632.5,-2360 "/>
<text text-anchor="middle" x="2471" y="-2344.8" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2337 2632.5,-2337 "/>
<text text-anchor="middle" x="2471" y="-2321.8" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2314 2632.5,-2314 "/>
<text text-anchor="middle" x="2471" y="-2298.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2291 2632.5,-2291 "/>
<text text-anchor="middle" x="2471" y="-2275.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2268 2632.5,-2268 "/>
<text text-anchor="middle" x="2471" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2245 2632.5,-2245 "/>
<text text-anchor="middle" x="2471" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2222 2632.5,-2222 "/>
<text text-anchor="middle" x="2471" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2199 2632.5,-2199 "/>
<text text-anchor="middle" x="2471" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2176 2632.5,-2176 "/>
<text text-anchor="middle" x="2471" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2153 2632.5,-2153 "/>
<text text-anchor="middle" x="2471" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2130 2632.5,-2130 "/>
<text text-anchor="middle" x="2471" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2107 2632.5,-2107 "/>
<text text-anchor="middle" x="2471" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2084 2632.5,-2084 "/>
<text text-anchor="middle" x="2471" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2061 2632.5,-2061 "/>
<text text-anchor="middle" x="2471" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2038 2632.5,-2038 "/>
<text text-anchor="middle" x="2471" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2309.5,-2015 2632.5,-2015 "/>
<text text-anchor="middle" x="2471" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2309.5,-1992 2632.5,-1992 "/>
<text text-anchor="middle" x="2471" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2309.5,-1969 2632.5,-1969 "/>
<text text-anchor="middle" x="2471" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2309.5,-1946 2632.5,-1946 "/>
<text text-anchor="middle" x="2471" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2309.5,-1923 2632.5,-1923 "/>
<text text-anchor="middle" x="2471" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2309.5,-1900 2632.5,-1900 "/>
<text text-anchor="middle" x="2471" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2309.5,-1877 2632.5,-1877 "/>
<text text-anchor="middle" x="2471" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2309.5,-1854 2632.5,-1854 "/>
<text text-anchor="middle" x="2471" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2309.5,-1831 2632.5,-1831 "/>
<text text-anchor="middle" x="2471" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2309.5,-1808 2632.5,-1808 "/>
<text text-anchor="middle" x="2471" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2632.5,-1785 2632.5,-2383 "/>
<text text-anchor="middle" x="2643" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge22" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M2653.7384,-2123.6057C2664.9387,-2113.6082 2671.5,-2100.4063 2671.5,-2084 2671.5,-2071.3108 2667.575,-2060.5384 2660.6144,-2051.6829"/>
<polygon fill="#000000" stroke="#000000" points="2663.1465,-2049.2665 2653.7384,-2044.3943 2658.0547,-2054.0701 2663.1465,-2049.2665"/>
<text text-anchor="middle" x="2687.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge36" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2417.3508,-1784.9205C2417.587,-1766.5727 2417.8156,-1748.8209 2418.0299,-1732.1741"/>
<polygon fill="#000000" stroke="#000000" points="2421.5324,-1732.0007 2418.1615,-1721.9565 2414.533,-1731.9106 2421.5324,-1732.0007"/>
<text text-anchor="middle" x="2467.5" y="-1743.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- diagnosis -->
<g id="node10" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2690,-2413.5C2690,-2413.5 3033,-2413.5 3033,-2413.5 3039,-2413.5 3045,-2419.5 3045,-2425.5 3045,-2425.5 3045,-2723.5 3045,-2723.5 3045,-2729.5 3039,-2735.5 3033,-2735.5 3033,-2735.5 2690,-2735.5 2690,-2735.5 2684,-2735.5 2678,-2729.5 2678,-2723.5 2678,-2723.5 2678,-2425.5 2678,-2425.5 2678,-2419.5 2684,-2413.5 2690,-2413.5"/>
<text text-anchor="middle" x="2720" y="-2570.8" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2762,-2413.5 2762,-2735.5 "/>
<text text-anchor="middle" x="2772.5" y="-2570.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2783,-2413.5 2783,-2735.5 "/>
<text text-anchor="middle" x="2903.5" y="-2720.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2783,-2712.5 3024,-2712.5 "/>
<text text-anchor="middle" x="2903.5" y="-2697.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2783,-2689.5 3024,-2689.5 "/>
<text text-anchor="middle" x="2903.5" y="-2674.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2783,-2666.5 3024,-2666.5 "/>
<text text-anchor="middle" x="2903.5" y="-2651.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2783,-2643.5 3024,-2643.5 "/>
<text text-anchor="middle" x="2903.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2783,-2620.5 3024,-2620.5 "/>
<text text-anchor="middle" x="2903.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2783,-2597.5 3024,-2597.5 "/>
<text text-anchor="middle" x="2903.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2783,-2574.5 3024,-2574.5 "/>
<text text-anchor="middle" x="2903.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2783,-2551.5 3024,-2551.5 "/>
<text text-anchor="middle" x="2903.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2783,-2528.5 3024,-2528.5 "/>
<text text-anchor="middle" x="2903.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2783,-2505.5 3024,-2505.5 "/>
<text text-anchor="middle" x="2903.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2783,-2482.5 3024,-2482.5 "/>
<text text-anchor="middle" x="2903.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2783,-2459.5 3024,-2459.5 "/>
<text text-anchor="middle" x="2903.5" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2783,-2436.5 3024,-2436.5 "/>
<text text-anchor="middle" x="2903.5" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="3024,-2413.5 3024,-2735.5 "/>
<text text-anchor="middle" x="3034.5" y="-2570.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge45" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M3045.2951,-2498.78C3087.2185,-2472.3878 3126.4598,-2438.2314 3150.5,-2395 3284.8504,-2153.3981 3270.1116,-2022.228 3150.5,-1773 3070.8839,-1607.1084 2667.6838,-1340.0283 2504.5,-1255 2441.7469,-1222.302 2366.4712,-1199.0829 2303.3773,-1183.5284"/>
<polygon fill="#000000" stroke="#000000" points="2303.9028,-1180.0544 2293.3595,-1181.0975 2302.2521,-1186.857 2303.9028,-1180.0544"/>
<text text-anchor="middle" x="3143.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_arm -->
<g id="node11" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1993,-403.5C1993,-403.5 2362,-403.5 2362,-403.5 2368,-403.5 2374,-409.5 2374,-415.5 2374,-415.5 2374,-483.5 2374,-483.5 2374,-489.5 2368,-495.5 2362,-495.5 2362,-495.5 1993,-495.5 1993,-495.5 1987,-495.5 1981,-489.5 1981,-483.5 1981,-483.5 1981,-415.5 1981,-415.5 1981,-409.5 1987,-403.5 1993,-403.5"/>
<text text-anchor="middle" x="2027" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="2073,-403.5 2073,-495.5 "/>
<text text-anchor="middle" x="2083.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2094,-403.5 2094,-495.5 "/>
<text text-anchor="middle" x="2223.5" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="2094,-472.5 2353,-472.5 "/>
<text text-anchor="middle" x="2223.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="2094,-449.5 2353,-449.5 "/>
<text text-anchor="middle" x="2223.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2094,-426.5 2353,-426.5 "/>
<text text-anchor="middle" x="2223.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_id</text>
<polyline fill="none" stroke="#000000" points="2353,-403.5 2353,-495.5 "/>
<text text-anchor="middle" x="2363.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node26" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M3070.5,-190.5C3070.5,-190.5 3350.5,-190.5 3350.5,-190.5 3356.5,-190.5 3362.5,-196.5 3362.5,-202.5 3362.5,-202.5 3362.5,-339.5 3362.5,-339.5 3362.5,-345.5 3356.5,-351.5 3350.5,-351.5 3350.5,-351.5 3070.5,-351.5 3070.5,-351.5 3064.5,-351.5 3058.5,-345.5 3058.5,-339.5 3058.5,-339.5 3058.5,-202.5 3058.5,-202.5 3058.5,-196.5 3064.5,-190.5 3070.5,-190.5"/>
<text text-anchor="middle" x="3086.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="3114.5,-190.5 3114.5,-351.5 "/>
<text text-anchor="middle" x="3125" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3135.5,-190.5 3135.5,-351.5 "/>
<text text-anchor="middle" x="3238.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="3135.5,-328.5 3341.5,-328.5 "/>
<text text-anchor="middle" x="3238.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="3135.5,-305.5 3341.5,-305.5 "/>
<text text-anchor="middle" x="3238.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="3135.5,-282.5 3341.5,-282.5 "/>
<text text-anchor="middle" x="3238.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="3135.5,-259.5 3341.5,-259.5 "/>
<text text-anchor="middle" x="3238.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="3135.5,-236.5 3341.5,-236.5 "/>
<text text-anchor="middle" x="3238.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="3135.5,-213.5 3341.5,-213.5 "/>
<text text-anchor="middle" x="3238.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="3341.5,-190.5 3341.5,-351.5 "/>
<text text-anchor="middle" x="3352" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge31" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2374.2309,-415.5054C2569.6649,-381.7348 2865.8,-330.5634 3048.2124,-299.0429"/>
<polygon fill="#000000" stroke="#000000" points="3048.9061,-302.475 3058.1641,-297.3233 3047.7141,-295.5772 3048.9061,-302.475"/>
<text text-anchor="middle" x="2672" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge25" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2049.541,-1151.4239C1955.0145,-1144.0474 1834.5681,-1127.9215 1800.5,-1093 1793.2903,-1085.6097 1787.1852,-1077.3969 1782.0355,-1068.6009"/>
<polygon fill="#000000" stroke="#000000" points="1785.0218,-1066.7645 1777.1988,-1059.6195 1778.8587,-1070.0835 1785.0218,-1066.7645"/>
<text text-anchor="middle" x="1869.5" y="-1081.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- case&#45;&gt;study_arm -->
<g id="edge33" class="edge">
<title>case&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2171.8914,-1111.3193C2172.9501,-986.388 2175.8684,-642.0314 2177.0219,-505.9204"/>
<polygon fill="#000000" stroke="#000000" points="2180.5234,-505.7434 2177.1084,-495.7141 2173.5236,-505.684 2180.5234,-505.7434"/>
<text text-anchor="middle" x="2224" y="-638.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- off_study -->
<g id="node17" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2212,-760.5C2212,-760.5 2627,-760.5 2627,-760.5 2633,-760.5 2639,-766.5 2639,-772.5 2639,-772.5 2639,-955.5 2639,-955.5 2639,-961.5 2633,-967.5 2627,-967.5 2627,-967.5 2212,-967.5 2212,-967.5 2206,-967.5 2200,-961.5 2200,-955.5 2200,-955.5 2200,-772.5 2200,-772.5 2200,-766.5 2206,-760.5 2212,-760.5"/>
<text text-anchor="middle" x="2241.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2283,-760.5 2283,-967.5 "/>
<text text-anchor="middle" x="2293.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2304,-760.5 2304,-967.5 "/>
<text text-anchor="middle" x="2461" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2304,-944.5 2618,-944.5 "/>
<text text-anchor="middle" x="2461" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2304,-921.5 2618,-921.5 "/>
<text text-anchor="middle" x="2461" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2304,-898.5 2618,-898.5 "/>
<text text-anchor="middle" x="2461" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2304,-875.5 2618,-875.5 "/>
<text text-anchor="middle" x="2461" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2304,-852.5 2618,-852.5 "/>
<text text-anchor="middle" x="2461" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2304,-829.5 2618,-829.5 "/>
<text text-anchor="middle" x="2461" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2304,-806.5 2618,-806.5 "/>
<text text-anchor="middle" x="2461" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2304,-783.5 2618,-783.5 "/>
<text text-anchor="middle" x="2461" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2618,-760.5 2618,-967.5 "/>
<text text-anchor="middle" x="2628.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge18" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M2210.5228,-1111.3178C2241.2756,-1074.9228 2285.4644,-1022.6268 2325.2939,-975.4898"/>
<polygon fill="#000000" stroke="#000000" points="2328.1215,-977.5664 2331.9023,-967.6691 2322.7747,-973.0484 2328.1215,-977.5664"/>
<text text-anchor="middle" x="2292" y="-1081.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- off_treatment -->
<g id="node18" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M2669,-772C2669,-772 3116,-772 3116,-772 3122,-772 3128,-778 3128,-784 3128,-784 3128,-944 3128,-944 3128,-950 3122,-956 3116,-956 3116,-956 2669,-956 2669,-956 2663,-956 2657,-950 2657,-944 2657,-944 2657,-784 2657,-784 2657,-778 2663,-772 2669,-772"/>
<text text-anchor="middle" x="2714.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="2772,-772 2772,-956 "/>
<text text-anchor="middle" x="2782.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2793,-772 2793,-956 "/>
<text text-anchor="middle" x="2950" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2793,-933 3107,-933 "/>
<text text-anchor="middle" x="2950" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2793,-910 3107,-910 "/>
<text text-anchor="middle" x="2950" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2793,-887 3107,-887 "/>
<text text-anchor="middle" x="2950" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2793,-864 3107,-864 "/>
<text text-anchor="middle" x="2950" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2793,-841 3107,-841 "/>
<text text-anchor="middle" x="2950" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2793,-818 3107,-818 "/>
<text text-anchor="middle" x="2950" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2793,-795 3107,-795 "/>
<text text-anchor="middle" x="2950" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="3107,-772 3107,-956 "/>
<text text-anchor="middle" x="3117.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge4" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M2293.0952,-1148.5945C2392.5814,-1137.6308 2534.8925,-1113.3706 2648.5,-1060 2700.1218,-1035.7491 2750.4326,-998.4334 2791.8289,-962.8438"/>
<polygon fill="#000000" stroke="#000000" points="2794.1981,-965.4218 2799.4531,-956.222 2789.608,-960.1369 2794.1981,-965.4218"/>
<text text-anchor="middle" x="2670.5" y="-1081.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- cohort -->
<g id="node23" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M1898,-547.5C1898,-547.5 2131,-547.5 2131,-547.5 2137,-547.5 2143,-553.5 2143,-559.5 2143,-559.5 2143,-604.5 2143,-604.5 2143,-610.5 2137,-616.5 2131,-616.5 2131,-616.5 1898,-616.5 1898,-616.5 1892,-616.5 1886,-610.5 1886,-604.5 1886,-604.5 1886,-559.5 1886,-559.5 1886,-553.5 1892,-547.5 1898,-547.5"/>
<text text-anchor="middle" x="1917.5" y="-578.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="1949,-547.5 1949,-616.5 "/>
<text text-anchor="middle" x="1959.5" y="-578.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1970,-547.5 1970,-616.5 "/>
<text text-anchor="middle" x="2046" y="-601.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1970,-593.5 2122,-593.5 "/>
<text text-anchor="middle" x="2046" y="-578.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_id</text>
<polyline fill="none" stroke="#000000" points="1970,-570.5 2122,-570.5 "/>
<text text-anchor="middle" x="2046" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2122,-547.5 2122,-616.5 "/>
<text text-anchor="middle" x="2132.5" y="-578.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge30" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M2114.3596,-1111.4738C2099.6292,-1096.6328 2085.427,-1079.0456 2076.5,-1060 2002.1547,-901.3866 2065.4565,-840.5921 2035.5,-668 2033.1333,-654.3643 2029.8333,-639.6809 2026.5494,-626.3739"/>
<polygon fill="#000000" stroke="#000000" points="2029.8995,-625.3447 2024.0571,-616.5063 2023.1126,-627.059 2029.8995,-625.3447"/>
<text text-anchor="middle" x="2117" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge29" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2293.3817,-1153.6892C2539.8227,-1144.7823 3078.9893,-1118.7425 3137.5,-1060 3199.2631,-997.9922 3156.5,-951.5195 3156.5,-864 3156.5,-864 3156.5,-864 3156.5,-449.5 3156.5,-420.1037 3163.2926,-389.1058 3172.0596,-361.3402"/>
<polygon fill="#000000" stroke="#000000" points="3175.4431,-362.2547 3175.235,-351.6619 3168.7919,-360.0725 3175.4431,-362.2547"/>
<text text-anchor="middle" x="3197" y="-578.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cycle -->
<g id="node13" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1461.5,-1324.5C1461.5,-1324.5 1689.5,-1324.5 1689.5,-1324.5 1695.5,-1324.5 1701.5,-1330.5 1701.5,-1336.5 1701.5,-1336.5 1701.5,-1381.5 1701.5,-1381.5 1701.5,-1387.5 1695.5,-1393.5 1689.5,-1393.5 1689.5,-1393.5 1461.5,-1393.5 1461.5,-1393.5 1455.5,-1393.5 1449.5,-1387.5 1449.5,-1381.5 1449.5,-1381.5 1449.5,-1336.5 1449.5,-1336.5 1449.5,-1330.5 1455.5,-1324.5 1461.5,-1324.5"/>
<text text-anchor="middle" x="1476.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1503.5,-1324.5 1503.5,-1393.5 "/>
<text text-anchor="middle" x="1514" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1524.5,-1324.5 1524.5,-1393.5 "/>
<text text-anchor="middle" x="1602.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1524.5,-1370.5 1680.5,-1370.5 "/>
<text text-anchor="middle" x="1602.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1524.5,-1347.5 1680.5,-1347.5 "/>
<text text-anchor="middle" x="1602.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1680.5,-1324.5 1680.5,-1393.5 "/>
<text text-anchor="middle" x="1691" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge41" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1610.9224,-1324.4859C1636.5698,-1301.4136 1673.161,-1272.2338 1710.5,-1255 1815.4149,-1206.5764 1944.9013,-1181.9064 2039.9034,-1169.5194"/>
<polygon fill="#000000" stroke="#000000" points="2040.3806,-1172.987 2049.8574,-1168.25 2039.495,-1166.0433 2040.3806,-1172.987"/>
<text text-anchor="middle" x="1820.5" y="-1225.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node14" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2337,-2842.5C2337,-2842.5 2522,-2842.5 2522,-2842.5 2528,-2842.5 2534,-2848.5 2534,-2854.5 2534,-2854.5 2534,-3037.5 2534,-3037.5 2534,-3043.5 2528,-3049.5 2522,-3049.5 2522,-3049.5 2337,-3049.5 2337,-3049.5 2331,-3049.5 2325,-3043.5 2325,-3037.5 2325,-3037.5 2325,-2854.5 2325,-2854.5 2325,-2848.5 2331,-2842.5 2337,-2842.5"/>
<text text-anchor="middle" x="2344.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2364,-2842.5 2364,-3049.5 "/>
<text text-anchor="middle" x="2374.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2385,-2842.5 2385,-3049.5 "/>
<text text-anchor="middle" x="2449" y="-3034.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="2385,-3026.5 2513,-3026.5 "/>
<text text-anchor="middle" x="2449" y="-3011.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2385,-3003.5 2513,-3003.5 "/>
<text text-anchor="middle" x="2449" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2385,-2980.5 2513,-2980.5 "/>
<text text-anchor="middle" x="2449" y="-2965.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2385,-2957.5 2513,-2957.5 "/>
<text text-anchor="middle" x="2449" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2385,-2934.5 2513,-2934.5 "/>
<text text-anchor="middle" x="2449" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2385,-2911.5 2513,-2911.5 "/>
<text text-anchor="middle" x="2449" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2385,-2888.5 2513,-2888.5 "/>
<text text-anchor="middle" x="2449" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2385,-2865.5 2513,-2865.5 "/>
<text text-anchor="middle" x="2449" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2513,-2842.5 2513,-3049.5 "/>
<text text-anchor="middle" x="2523.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge5" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2370.9201,-2842.4939C2292.077,-2714.7561 2138.6608,-2503.3847 1941.5,-2413 1881.3755,-2385.437 1406.5823,-2422.6549 1346.5,-2395 1328.9942,-2386.9424 1312.0894,-2377.2395 1295.8479,-2366.3164"/>
<polygon fill="#000000" stroke="#000000" points="1297.6334,-2363.296 1287.4155,-2360.4953 1293.6567,-2369.0567 1297.6334,-2363.296"/>
<text text-anchor="middle" x="2373" y="-2768.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge13" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2534.0751,-2856.0702C2574.9969,-2820.8794 2623.2662,-2779.37 2669.9874,-2739.192"/>
<polygon fill="#000000" stroke="#000000" points="2672.4744,-2741.6695 2677.7744,-2732.4955 2667.9103,-2736.362 2672.4744,-2741.6695"/>
<text text-anchor="middle" x="2636" y="-2812.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge14" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2324.8584,-2909.099C2215.4529,-2870.518 2049.5843,-2812.0257 1975.5292,-2785.9107"/>
<polygon fill="#000000" stroke="#000000" points="1976.2993,-2782.4711 1965.7045,-2782.4461 1973.9712,-2789.0726 1976.2993,-2782.4711"/>
<text text-anchor="middle" x="2113" y="-2812.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge3" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2534.1112,-2935.1339C2758.4302,-2910.4203 3265.5,-2846.3842 3265.5,-2772.5 3265.5,-2772.5 3265.5,-2772.5 3265.5,-449.5 3265.5,-420.0577 3258.5816,-389.0464 3249.6523,-361.2827"/>
<polygon fill="#000000" stroke="#000000" points="3252.9074,-359.9806 3246.418,-351.6057 3246.2684,-362.1995 3252.9074,-359.9806"/>
<text text-anchor="middle" x="3296" y="-1225.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge6" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1909.2401,-2757.95C1820.9378,-2711.7816 1544.3006,-2561.7617 1346.5,-2395 1329.0411,-2380.2807 1311.6234,-2364.5151 1294.4975,-2348.1786"/>
<polygon fill="#000000" stroke="#000000" points="1296.8121,-2345.5487 1287.1765,-2341.1436 1291.962,-2350.5961 1296.8121,-2345.5487"/>
<text text-anchor="middle" x="1901" y="-2570.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge40" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1384.6059,-1594.8639C1359.2272,-1531.4843 1299.6891,-1353.2602 1386.5,-1255 1428.9385,-1206.9644 1826.9664,-1177.1369 2039.374,-1164.5071"/>
<polygon fill="#000000" stroke="#000000" points="2039.8817,-1167.9834 2049.6582,-1163.9005 2039.4694,-1160.9955 2039.8817,-1167.9834"/>
<text text-anchor="middle" x="1413.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge24" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1410.8818,-1594.5587C1441.2793,-1551.0616 1506.8236,-1457.2717 1545.4078,-1402.0601"/>
<polygon fill="#000000" stroke="#000000" points="1548.4999,-1403.7455 1551.3593,-1393.5438 1542.7622,-1399.7357 1548.4999,-1403.7455"/>
<text text-anchor="middle" x="1514" y="-1484.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge23" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1452.5376,-1641.0098C1483.6529,-1644.9199 1512,-1637.25 1512,-1618 1512,-1600.8555 1489.5147,-1592.8964 1462.6145,-1594.1228"/>
<polygon fill="#000000" stroke="#000000" points="1462.2006,-1590.6454 1452.5376,-1594.9902 1462.801,-1597.6196 1462.2006,-1590.6454"/>
<text text-anchor="middle" x="1528" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- demographic -->
<g id="node19" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1731.5,-1278.5C1731.5,-1278.5 2067.5,-1278.5 2067.5,-1278.5 2073.5,-1278.5 2079.5,-1284.5 2079.5,-1290.5 2079.5,-1290.5 2079.5,-1427.5 2079.5,-1427.5 2079.5,-1433.5 2073.5,-1439.5 2067.5,-1439.5 2067.5,-1439.5 1731.5,-1439.5 1731.5,-1439.5 1725.5,-1439.5 1719.5,-1433.5 1719.5,-1427.5 1719.5,-1427.5 1719.5,-1290.5 1719.5,-1290.5 1719.5,-1284.5 1725.5,-1278.5 1731.5,-1278.5"/>
<text text-anchor="middle" x="1774.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1829.5,-1278.5 1829.5,-1439.5 "/>
<text text-anchor="middle" x="1840" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1850.5,-1278.5 1850.5,-1439.5 "/>
<text text-anchor="middle" x="1954.5" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1850.5,-1416.5 2058.5,-1416.5 "/>
<text text-anchor="middle" x="1954.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1850.5,-1393.5 2058.5,-1393.5 "/>
<text text-anchor="middle" x="1954.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1850.5,-1370.5 2058.5,-1370.5 "/>
<text text-anchor="middle" x="1954.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1850.5,-1347.5 2058.5,-1347.5 "/>
<text text-anchor="middle" x="1954.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1850.5,-1324.5 2058.5,-1324.5 "/>
<text text-anchor="middle" x="1954.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1850.5,-1301.5 2058.5,-1301.5 "/>
<text text-anchor="middle" x="1954.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2058.5,-1278.5 2058.5,-1439.5 "/>
<text text-anchor="middle" x="2069" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge38" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2008.1742,-1278.4932C2039.4199,-1255.3461 2072.6726,-1230.7122 2100.9624,-1209.7549"/>
<polygon fill="#000000" stroke="#000000" points="2103.2364,-1212.4261 2109.1883,-1203.661 2099.0696,-1206.8013 2103.2364,-1212.4261"/>
<text text-anchor="middle" x="2110.5" y="-1225.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- registration -->
<g id="node20" class="node">
<title>registration</title>
<path fill="none" stroke="#000000" d="M2109.5,-1336C2109.5,-1336 2379.5,-1336 2379.5,-1336 2385.5,-1336 2391.5,-1342 2391.5,-1348 2391.5,-1348 2391.5,-1370 2391.5,-1370 2391.5,-1376 2385.5,-1382 2379.5,-1382 2379.5,-1382 2109.5,-1382 2109.5,-1382 2103.5,-1382 2097.5,-1376 2097.5,-1370 2097.5,-1370 2097.5,-1348 2097.5,-1348 2097.5,-1342 2103.5,-1336 2109.5,-1336"/>
<text text-anchor="middle" x="2148" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">registration</text>
<polyline fill="none" stroke="#000000" points="2198.5,-1336 2198.5,-1382 "/>
<text text-anchor="middle" x="2209" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2219.5,-1336 2219.5,-1382 "/>
<text text-anchor="middle" x="2295" y="-1366.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration_id</text>
<polyline fill="none" stroke="#000000" points="2219.5,-1359 2370.5,-1359 "/>
<text text-anchor="middle" x="2295" y="-1343.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration_origin</text>
<polyline fill="none" stroke="#000000" points="2370.5,-1336 2370.5,-1382 "/>
<text text-anchor="middle" x="2381" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- registration&#45;&gt;case -->
<g id="edge37" class="edge">
<title>registration&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2236.126,-1335.8854C2225.3433,-1306.1221 2206.2512,-1253.4229 2191.605,-1212.9952"/>
<polygon fill="#000000" stroke="#000000" points="2194.8717,-1211.7367 2188.1747,-1203.5269 2188.2903,-1214.1211 2194.8717,-1211.7367"/>
<text text-anchor="middle" x="2225.5" y="-1225.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge32" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1815.5883,-558.9328C1857.8808,-545.6523 1912.1447,-528.7274 1960.5,-514 1977.1545,-508.9276 1994.5426,-503.6794 2011.9118,-498.4681"/>
<polygon fill="#000000" stroke="#000000" points="2012.9803,-501.8018 2021.5546,-495.5781 2010.9707,-495.0964 2012.9803,-501.8018"/>
<text text-anchor="middle" x="2009" y="-517.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- program -->
<g id="node22" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M3056.5,-.5C3056.5,-.5 3364.5,-.5 3364.5,-.5 3370.5,-.5 3376.5,-6.5 3376.5,-12.5 3376.5,-12.5 3376.5,-126.5 3376.5,-126.5 3376.5,-132.5 3370.5,-138.5 3364.5,-138.5 3364.5,-138.5 3056.5,-138.5 3056.5,-138.5 3050.5,-138.5 3044.5,-132.5 3044.5,-126.5 3044.5,-126.5 3044.5,-12.5 3044.5,-12.5 3044.5,-6.5 3050.5,-.5 3056.5,-.5"/>
<text text-anchor="middle" x="3083.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="3122.5,-.5 3122.5,-138.5 "/>
<text text-anchor="middle" x="3133" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3143.5,-.5 3143.5,-138.5 "/>
<text text-anchor="middle" x="3249.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="3143.5,-115.5 3355.5,-115.5 "/>
<text text-anchor="middle" x="3249.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="3143.5,-92.5 3355.5,-92.5 "/>
<text text-anchor="middle" x="3249.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="3143.5,-69.5 3355.5,-69.5 "/>
<text text-anchor="middle" x="3249.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="3143.5,-46.5 3355.5,-46.5 "/>
<text text-anchor="middle" x="3249.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="3143.5,-23.5 3355.5,-23.5 "/>
<text text-anchor="middle" x="3249.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="3355.5,-.5 3355.5,-138.5 "/>
<text text-anchor="middle" x="3366" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge26" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2042.824,-547.4422C2052.8746,-536.1627 2064.6467,-523.9824 2076.5,-514 2081.4084,-509.8663 2086.6002,-505.7925 2091.9358,-501.824"/>
<polygon fill="#000000" stroke="#000000" points="2094.3722,-504.381 2100.4187,-495.681 2090.2665,-498.7115 2094.3722,-504.381"/>
<text text-anchor="middle" x="2117" y="-517.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge27" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1931.9285,-547.4659C1923.4737,-542.0134 1915.4521,-535.8689 1908.5,-529 1868.3033,-489.2846 1853.5848,-444.899 1891.5,-403 1967.7973,-318.6861 2712.4528,-285.8819 3048.0044,-275.307"/>
<polygon fill="#000000" stroke="#000000" points="3048.4147,-278.796 3058.3006,-274.9854 3048.1962,-271.7994 3048.4147,-278.796"/>
<text text-anchor="middle" x="1932" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- agent_administration -->
<g id="node24" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M12,-1842.5C12,-1842.5 481,-1842.5 481,-1842.5 487,-1842.5 493,-1848.5 493,-1854.5 493,-1854.5 493,-2313.5 493,-2313.5 493,-2319.5 487,-2325.5 481,-2325.5 481,-2325.5 12,-2325.5 12,-2325.5 6,-2325.5 0,-2319.5 0,-2313.5 0,-2313.5 0,-1854.5 0,-1854.5 0,-1848.5 6,-1842.5 12,-1842.5"/>
<text text-anchor="middle" x="85" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="170,-1842.5 170,-2325.5 "/>
<text text-anchor="middle" x="180.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="191,-1842.5 191,-2325.5 "/>
<text text-anchor="middle" x="331.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="191,-2302.5 472,-2302.5 "/>
<text text-anchor="middle" x="331.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="191,-2279.5 472,-2279.5 "/>
<text text-anchor="middle" x="331.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2256.5 472,-2256.5 "/>
<text text-anchor="middle" x="331.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="191,-2233.5 472,-2233.5 "/>
<text text-anchor="middle" x="331.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="191,-2210.5 472,-2210.5 "/>
<text text-anchor="middle" x="331.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="191,-2187.5 472,-2187.5 "/>
<text text-anchor="middle" x="331.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="191,-2164.5 472,-2164.5 "/>
<text text-anchor="middle" x="331.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2141.5 472,-2141.5 "/>
<text text-anchor="middle" x="331.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2118.5 472,-2118.5 "/>
<text text-anchor="middle" x="331.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="191,-2095.5 472,-2095.5 "/>
<text text-anchor="middle" x="331.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="191,-2072.5 472,-2072.5 "/>
<text text-anchor="middle" x="331.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="191,-2049.5 472,-2049.5 "/>
<text text-anchor="middle" x="331.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="191,-2026.5 472,-2026.5 "/>
<text text-anchor="middle" x="331.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="191,-2003.5 472,-2003.5 "/>
<text text-anchor="middle" x="331.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="191,-1980.5 472,-1980.5 "/>
<text text-anchor="middle" x="331.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="191,-1957.5 472,-1957.5 "/>
<text text-anchor="middle" x="331.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="191,-1934.5 472,-1934.5 "/>
<text text-anchor="middle" x="331.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-1911.5 472,-1911.5 "/>
<text text-anchor="middle" x="331.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-1888.5 472,-1888.5 "/>
<text text-anchor="middle" x="331.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="191,-1865.5 472,-1865.5 "/>
<text text-anchor="middle" x="331.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="472,-1842.5 472,-2325.5 "/>
<text text-anchor="middle" x="482.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge11" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M412.6432,-1842.1349C439.6283,-1815.4731 469.379,-1791.3759 501.5,-1773 546.4045,-1747.3109 565.4674,-1763.4863 616.5,-1755 855.0478,-1715.3315 1134.0694,-1665.3152 1284.6448,-1638.0241"/>
<polygon fill="#000000" stroke="#000000" points="1285.6036,-1641.4074 1294.8187,-1636.1793 1284.3546,-1634.5197 1285.6036,-1641.4074"/>
<text text-anchor="middle" x="729.5" y="-1743.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge17" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M440.906,-1842.4444C524.1143,-1736.8339 602.5,-1633.2873 602.5,-1618 602.5,-1618 602.5,-1618 602.5,-864 602.5,-659.1317 1305.0483,-602.1302 1607.1034,-587.0904"/>
<polygon fill="#000000" stroke="#000000" points="1607.4222,-590.5791 1617.239,-586.594 1607.0798,-583.5874 1607.4222,-590.5791"/>
<text text-anchor="middle" x="633.5" y="-1225.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- study_site -->
<g id="node25" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M3306,-415C3306,-415 3623,-415 3623,-415 3629,-415 3635,-421 3635,-427 3635,-427 3635,-472 3635,-472 3635,-478 3629,-484 3623,-484 3623,-484 3306,-484 3306,-484 3300,-484 3294,-478 3294,-472 3294,-472 3294,-427 3294,-427 3294,-421 3300,-415 3306,-415"/>
<text text-anchor="middle" x="3339" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="3384,-415 3384,-484 "/>
<text text-anchor="middle" x="3394.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3405,-415 3405,-484 "/>
<text text-anchor="middle" x="3509.5" y="-468.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="3405,-461 3614,-461 "/>
<text text-anchor="middle" x="3509.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3405,-438 3614,-438 "/>
<text text-anchor="middle" x="3509.5" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3614,-415 3614,-484 "/>
<text text-anchor="middle" x="3624.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge1" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3415.2251,-414.8718C3391.7871,-398.4006 3362.6104,-377.8965 3333.6968,-357.5773"/>
<polygon fill="#000000" stroke="#000000" points="3335.342,-354.4556 3325.1479,-351.5695 3331.3172,-360.1829 3335.342,-354.4556"/>
<text text-anchor="middle" x="3398" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge28" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M3210.5,-190.4932C3210.5,-176.7786 3210.5,-162.5421 3210.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="3214.0001,-148.5183 3210.5,-138.5184 3207.0001,-148.5184 3214.0001,-148.5183"/>
<text text-anchor="middle" x="3251" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- prior_surgery -->
<g id="node27" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2733.5,-2003.5C2733.5,-2003.5 3079.5,-2003.5 3079.5,-2003.5 3085.5,-2003.5 3091.5,-2009.5 3091.5,-2015.5 3091.5,-2015.5 3091.5,-2152.5 3091.5,-2152.5 3091.5,-2158.5 3085.5,-2164.5 3079.5,-2164.5 3079.5,-2164.5 2733.5,-2164.5 2733.5,-2164.5 2727.5,-2164.5 2721.5,-2158.5 2721.5,-2152.5 2721.5,-2152.5 2721.5,-2015.5 2721.5,-2015.5 2721.5,-2009.5 2727.5,-2003.5 2733.5,-2003.5"/>
<text text-anchor="middle" x="2779" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2836.5,-2003.5 2836.5,-2164.5 "/>
<text text-anchor="middle" x="2847" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2857.5,-2003.5 2857.5,-2164.5 "/>
<text text-anchor="middle" x="2964" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2857.5,-2141.5 3070.5,-2141.5 "/>
<text text-anchor="middle" x="2964" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2857.5,-2118.5 3070.5,-2118.5 "/>
<text text-anchor="middle" x="2964" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2857.5,-2095.5 3070.5,-2095.5 "/>
<text text-anchor="middle" x="2964" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2857.5,-2072.5 3070.5,-2072.5 "/>
<text text-anchor="middle" x="2964" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2857.5,-2049.5 3070.5,-2049.5 "/>
<text text-anchor="middle" x="2964" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2857.5,-2026.5 3070.5,-2026.5 "/>
<text text-anchor="middle" x="2964" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="3070.5,-2003.5 3070.5,-2164.5 "/>
<text text-anchor="middle" x="3081" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge19" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M3091.613,-2127.6163C3102.7907,-2117.2419 3109.5,-2102.7031 3109.5,-2084 3109.5,-2069.5343 3105.4865,-2057.5598 3098.4962,-2048.0763"/>
<polygon fill="#000000" stroke="#000000" points="3100.8895,-2045.5022 3091.613,-2040.3837 3095.6729,-2050.1699 3100.8895,-2045.5022"/>
<text text-anchor="middle" x="3125.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge34" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2871.0174,-2003.3494C2837.862,-1935.2413 2782.9369,-1838.5958 2712.5,-1773 2683.8677,-1746.3356 2649.7777,-1722.9017 2615.1484,-1702.8631"/>
<polygon fill="#000000" stroke="#000000" points="2616.7571,-1699.7515 2606.3358,-1697.8418 2613.2916,-1705.8335 2616.7571,-1699.7515"/>
<text text-anchor="middle" x="2734.5" y="-1743.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge42" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2441.514,-1514.3341C2452.0753,-1436.117 2452.8515,-1329.8578 2400.5,-1255 2377.2712,-1221.7849 2340.3203,-1199.8205 2302.8218,-1185.3214"/>
<polygon fill="#000000" stroke="#000000" points="2303.8776,-1181.9803 2293.2844,-1181.7937 2301.4492,-1188.5456 2303.8776,-1181.9803"/>
<text text-anchor="middle" x="2473.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- principal_investigator -->
<g id="node29" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M3665,-415C3665,-415 3992,-415 3992,-415 3998,-415 4004,-421 4004,-427 4004,-427 4004,-472 4004,-472 4004,-478 3998,-484 3992,-484 3992,-484 3665,-484 3665,-484 3659,-484 3653,-478 3653,-472 3653,-472 3653,-427 3653,-427 3653,-421 3659,-415 3665,-415"/>
<text text-anchor="middle" x="3740" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="3827,-415 3827,-484 "/>
<text text-anchor="middle" x="3837.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3848,-415 3848,-484 "/>
<text text-anchor="middle" x="3915.5" y="-468.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3848,-461 3983,-461 "/>
<text text-anchor="middle" x="3915.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="3848,-438 3983,-438 "/>
<text text-anchor="middle" x="3915.5" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="3983,-415 3983,-484 "/>
<text text-anchor="middle" x="3993.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge2" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3708.9772,-414.9776C3613.1944,-387.3122 3477.8497,-348.2199 3372.356,-317.7497"/>
<polygon fill="#000000" stroke="#000000" points="3373.1438,-314.3342 3362.5653,-314.9218 3371.2014,-321.0593 3373.1438,-314.3342"/>
<text text-anchor="middle" x="3623" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
</g>
</svg>
</div>
