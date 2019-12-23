<link rel='stylesheet' href="assets/style.css">
<link rel='stylesheet' href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"  src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>
<script type="text/javascript" src="assets/actions.js"></script>

# Integrated Canine Data Commons data model

Zoom to Node: <select id="node_select">
  <option value="">Zoom to Node</option>
</select>
<div id="model"></div>

<p>
<a href="./model-desc/icdc-model.svg">SVG file (in view above)</a>
<p>
<a href="./model-desc">Additional model files</a>


<div id='graph' style='display:off;'>
<svg width="3216pt" height="2966pt"
 viewBox="0.00 0.00 3215.50 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3211.5,-2962 3211.5,4 -4,4"/>
<!-- lab_exam -->
<g id="node1" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1064,-2008.5C1064,-2008.5 1124,-2008.5 1124,-2008.5 1130,-2008.5 1136,-2014.5 1136,-2020.5 1136,-2020.5 1136,-2032.5 1136,-2032.5 1136,-2038.5 1130,-2044.5 1124,-2044.5 1124,-2044.5 1064,-2044.5 1064,-2044.5 1058,-2044.5 1052,-2038.5 1052,-2032.5 1052,-2032.5 1052,-2020.5 1052,-2020.5 1052,-2014.5 1058,-2008.5 1064,-2008.5"/>
<text text-anchor="middle" x="1094" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- visit -->
<g id="node7" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1914.5,-1549C1914.5,-1549 2089.5,-1549 2089.5,-1549 2095.5,-1549 2101.5,-1555 2101.5,-1561 2101.5,-1561 2101.5,-1583 2101.5,-1583 2101.5,-1589 2095.5,-1595 2089.5,-1595 2089.5,-1595 1914.5,-1595 1914.5,-1595 1908.5,-1595 1902.5,-1589 1902.5,-1583 1902.5,-1583 1902.5,-1561 1902.5,-1561 1902.5,-1555 1908.5,-1549 1914.5,-1549"/>
<text text-anchor="middle" x="1926" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1949.5,-1549 1949.5,-1595 "/>
<text text-anchor="middle" x="1960" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1970.5,-1549 1970.5,-1595 "/>
<text text-anchor="middle" x="2025.5" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1970.5,-1572 2080.5,-1572 "/>
<text text-anchor="middle" x="2025.5" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="2080.5,-1549 2080.5,-1595 "/>
<text text-anchor="middle" x="2091" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge17" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1090.7426,-2008.2187C1082.6054,-1956.1093 1067.2661,-1805.5358 1145,-1727 1247.9491,-1622.9888 1685.2316,-1587.65 1892.3556,-1576.6004"/>
<polygon fill="#000000" stroke="#000000" points="1892.5412,-1580.0956 1902.3442,-1576.0769 1892.1747,-1573.1052 1892.5412,-1580.0956"/>
<text text-anchor="middle" x="1217" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study -->
<g id="node2" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M731,-190.5C731,-190.5 1011,-190.5 1011,-190.5 1017,-190.5 1023,-196.5 1023,-202.5 1023,-202.5 1023,-339.5 1023,-339.5 1023,-345.5 1017,-351.5 1011,-351.5 1011,-351.5 731,-351.5 731,-351.5 725,-351.5 719,-345.5 719,-339.5 719,-339.5 719,-202.5 719,-202.5 719,-196.5 725,-190.5 731,-190.5"/>
<text text-anchor="middle" x="747" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="775,-190.5 775,-351.5 "/>
<text text-anchor="middle" x="785.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="796,-190.5 796,-351.5 "/>
<text text-anchor="middle" x="899" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="796,-328.5 1002,-328.5 "/>
<text text-anchor="middle" x="899" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="796,-305.5 1002,-305.5 "/>
<text text-anchor="middle" x="899" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="796,-282.5 1002,-282.5 "/>
<text text-anchor="middle" x="899" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="796,-259.5 1002,-259.5 "/>
<text text-anchor="middle" x="899" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="796,-236.5 1002,-236.5 "/>
<text text-anchor="middle" x="899" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="796,-213.5 1002,-213.5 "/>
<text text-anchor="middle" x="899" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="1002,-190.5 1002,-351.5 "/>
<text text-anchor="middle" x="1012.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- program -->
<g id="node17" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M717,-.5C717,-.5 1025,-.5 1025,-.5 1031,-.5 1037,-6.5 1037,-12.5 1037,-12.5 1037,-126.5 1037,-126.5 1037,-132.5 1031,-138.5 1025,-138.5 1025,-138.5 717,-138.5 717,-138.5 711,-138.5 705,-132.5 705,-126.5 705,-126.5 705,-12.5 705,-12.5 705,-6.5 711,-.5 717,-.5"/>
<text text-anchor="middle" x="744" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="783,-.5 783,-138.5 "/>
<text text-anchor="middle" x="793.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="804,-.5 804,-138.5 "/>
<text text-anchor="middle" x="910" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="804,-115.5 1016,-115.5 "/>
<text text-anchor="middle" x="910" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="804,-92.5 1016,-92.5 "/>
<text text-anchor="middle" x="910" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="804,-69.5 1016,-69.5 "/>
<text text-anchor="middle" x="910" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="804,-46.5 1016,-46.5 "/>
<text text-anchor="middle" x="910" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="804,-23.5 1016,-23.5 "/>
<text text-anchor="middle" x="910" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1016,-.5 1016,-138.5 "/>
<text text-anchor="middle" x="1026.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge16" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M871,-190.4932C871,-176.7786 871,-162.5421 871,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="874.5001,-148.5183 871,-138.5184 867.5001,-148.5184 874.5001,-148.5183"/>
<text text-anchor="middle" x="911.5" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node3" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1755.5,-622.5C1755.5,-622.5 2150.5,-622.5 2150.5,-622.5 2156.5,-622.5 2162.5,-628.5 2162.5,-634.5 2162.5,-634.5 2162.5,-1001.5 2162.5,-1001.5 2162.5,-1007.5 2156.5,-1013.5 2150.5,-1013.5 2150.5,-1013.5 1755.5,-1013.5 1755.5,-1013.5 1749.5,-1013.5 1743.5,-1007.5 1743.5,-1001.5 1743.5,-1001.5 1743.5,-634.5 1743.5,-634.5 1743.5,-628.5 1749.5,-622.5 1755.5,-622.5"/>
<text text-anchor="middle" x="1803.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1863.5,-622.5 1863.5,-1013.5 "/>
<text text-anchor="middle" x="1874" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1884.5,-622.5 1884.5,-1013.5 "/>
<text text-anchor="middle" x="2013" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1884.5,-990.5 2141.5,-990.5 "/>
<text text-anchor="middle" x="2013" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1884.5,-967.5 2141.5,-967.5 "/>
<text text-anchor="middle" x="2013" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1884.5,-944.5 2141.5,-944.5 "/>
<text text-anchor="middle" x="2013" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1884.5,-921.5 2141.5,-921.5 "/>
<text text-anchor="middle" x="2013" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1884.5,-898.5 2141.5,-898.5 "/>
<text text-anchor="middle" x="2013" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1884.5,-875.5 2141.5,-875.5 "/>
<text text-anchor="middle" x="2013" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1884.5,-852.5 2141.5,-852.5 "/>
<text text-anchor="middle" x="2013" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1884.5,-829.5 2141.5,-829.5 "/>
<text text-anchor="middle" x="2013" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1884.5,-806.5 2141.5,-806.5 "/>
<text text-anchor="middle" x="2013" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1884.5,-783.5 2141.5,-783.5 "/>
<text text-anchor="middle" x="2013" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1884.5,-760.5 2141.5,-760.5 "/>
<text text-anchor="middle" x="2013" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1884.5,-737.5 2141.5,-737.5 "/>
<text text-anchor="middle" x="2013" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1884.5,-714.5 2141.5,-714.5 "/>
<text text-anchor="middle" x="2013" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1884.5,-691.5 2141.5,-691.5 "/>
<text text-anchor="middle" x="2013" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1884.5,-668.5 2141.5,-668.5 "/>
<text text-anchor="middle" x="2013" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1884.5,-645.5 2141.5,-645.5 "/>
<text text-anchor="middle" x="2013" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="2141.5,-622.5 2141.5,-1013.5 "/>
<text text-anchor="middle" x="2152" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge41" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2162.7046,-845.2761C2173.876,-838.5862 2180.5,-829.4941 2180.5,-818 2180.5,-809.7386 2177.0781,-802.7181 2171.0052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="2172.8073,-793.9155 2162.7046,-790.7239 2168.6119,-799.519 2172.8073,-793.9155"/>
<text text-anchor="middle" x="2196.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- case -->
<g id="node16" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1496.5,-1065.5C1496.5,-1065.5 1715.5,-1065.5 1715.5,-1065.5 1721.5,-1065.5 1727.5,-1071.5 1727.5,-1077.5 1727.5,-1077.5 1727.5,-1145.5 1727.5,-1145.5 1727.5,-1151.5 1721.5,-1157.5 1715.5,-1157.5 1715.5,-1157.5 1496.5,-1157.5 1496.5,-1157.5 1490.5,-1157.5 1484.5,-1151.5 1484.5,-1145.5 1484.5,-1145.5 1484.5,-1077.5 1484.5,-1077.5 1484.5,-1071.5 1490.5,-1065.5 1496.5,-1065.5"/>
<text text-anchor="middle" x="1509" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1533.5,-1065.5 1533.5,-1157.5 "/>
<text text-anchor="middle" x="1544" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1554.5,-1065.5 1554.5,-1157.5 "/>
<text text-anchor="middle" x="1630.5" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1554.5,-1134.5 1706.5,-1134.5 "/>
<text text-anchor="middle" x="1630.5" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1554.5,-1111.5 1706.5,-1111.5 "/>
<text text-anchor="middle" x="1630.5" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1554.5,-1088.5 1706.5,-1088.5 "/>
<text text-anchor="middle" x="1630.5" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1706.5,-1065.5 1706.5,-1157.5 "/>
<text text-anchor="middle" x="1717" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge9" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1743.4881,-1006.118C1740.311,-1008.7714 1737.1469,-1011.4001 1734,-1014 1715.7215,-1029.1012 1695.4934,-1044.9062 1676.6176,-1059.2885"/>
<polygon fill="#000000" stroke="#000000" points="1674.4693,-1056.525 1668.6203,-1065.359 1678.7017,-1062.1006 1674.4693,-1056.525"/>
<text text-anchor="middle" x="1738" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent -->
<g id="node18" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1840,-524.5C1840,-524.5 2066,-524.5 2066,-524.5 2072,-524.5 2078,-530.5 2078,-536.5 2078,-536.5 2078,-558.5 2078,-558.5 2078,-564.5 2072,-570.5 2066,-570.5 2066,-570.5 1840,-570.5 1840,-570.5 1834,-570.5 1828,-564.5 1828,-558.5 1828,-558.5 1828,-536.5 1828,-536.5 1828,-530.5 1834,-524.5 1840,-524.5"/>
<text text-anchor="middle" x="1856.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1885,-524.5 1885,-570.5 "/>
<text text-anchor="middle" x="1895.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1906,-524.5 1906,-570.5 "/>
<text text-anchor="middle" x="1981.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1906,-547.5 2057,-547.5 "/>
<text text-anchor="middle" x="1981.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2057,-524.5 2057,-570.5 "/>
<text text-anchor="middle" x="2067.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge28" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1953,-622.4901C1953,-606.8636 1953,-592.5861 1953,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="1956.5001,-580.664 1953,-570.6641 1949.5001,-580.6641 1956.5001,-580.664"/>
<text text-anchor="middle" x="1984" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- cycle -->
<g id="node4" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1816,-1278.5C1816,-1278.5 2044,-1278.5 2044,-1278.5 2050,-1278.5 2056,-1284.5 2056,-1290.5 2056,-1290.5 2056,-1335.5 2056,-1335.5 2056,-1341.5 2050,-1347.5 2044,-1347.5 2044,-1347.5 1816,-1347.5 1816,-1347.5 1810,-1347.5 1804,-1341.5 1804,-1335.5 1804,-1335.5 1804,-1290.5 1804,-1290.5 1804,-1284.5 1810,-1278.5 1816,-1278.5"/>
<text text-anchor="middle" x="1831" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1858,-1278.5 1858,-1347.5 "/>
<text text-anchor="middle" x="1868.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1879,-1278.5 1879,-1347.5 "/>
<text text-anchor="middle" x="1957" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1879,-1324.5 2035,-1324.5 "/>
<text text-anchor="middle" x="1957" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1879,-1301.5 2035,-1301.5 "/>
<text text-anchor="middle" x="1957" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="2035,-1278.5 2035,-1347.5 "/>
<text text-anchor="middle" x="2045.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge10" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1889.1548,-1278.4263C1863.0825,-1257.154 1828.0808,-1230.0332 1795,-1209 1769.1069,-1192.5368 1740.1075,-1176.4875 1712.7472,-1162.3183"/>
<polygon fill="#000000" stroke="#000000" points="1714.0324,-1159.0438 1703.5382,-1157.5873 1710.8337,-1165.2702 1714.0324,-1159.0438"/>
<text text-anchor="middle" x="1793" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample -->
<g id="node5" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M2722.5,-1796.5C2722.5,-1796.5 3145.5,-1796.5 3145.5,-1796.5 3151.5,-1796.5 3157.5,-1802.5 3157.5,-1808.5 3157.5,-1808.5 3157.5,-2244.5 3157.5,-2244.5 3157.5,-2250.5 3151.5,-2256.5 3145.5,-2256.5 3145.5,-2256.5 2722.5,-2256.5 2722.5,-2256.5 2716.5,-2256.5 2710.5,-2250.5 2710.5,-2244.5 2710.5,-2244.5 2710.5,-1808.5 2710.5,-1808.5 2710.5,-1802.5 2716.5,-1796.5 2722.5,-1796.5"/>
<text text-anchor="middle" x="2744.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="2778.5,-1796.5 2778.5,-2256.5 "/>
<text text-anchor="middle" x="2789" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2799.5,-1796.5 2799.5,-2256.5 "/>
<text text-anchor="middle" x="2968" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2233.5 3136.5,-2233.5 "/>
<text text-anchor="middle" x="2968" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2210.5 3136.5,-2210.5 "/>
<text text-anchor="middle" x="2968" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2187.5 3136.5,-2187.5 "/>
<text text-anchor="middle" x="2968" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2164.5 3136.5,-2164.5 "/>
<text text-anchor="middle" x="2968" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2141.5 3136.5,-2141.5 "/>
<text text-anchor="middle" x="2968" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2118.5 3136.5,-2118.5 "/>
<text text-anchor="middle" x="2968" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2095.5 3136.5,-2095.5 "/>
<text text-anchor="middle" x="2968" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2072.5 3136.5,-2072.5 "/>
<text text-anchor="middle" x="2968" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2049.5 3136.5,-2049.5 "/>
<text text-anchor="middle" x="2968" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2026.5 3136.5,-2026.5 "/>
<text text-anchor="middle" x="2968" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2799.5,-2003.5 3136.5,-2003.5 "/>
<text text-anchor="middle" x="2968" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="2799.5,-1980.5 3136.5,-1980.5 "/>
<text text-anchor="middle" x="2968" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="2799.5,-1957.5 3136.5,-1957.5 "/>
<text text-anchor="middle" x="2968" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="2799.5,-1934.5 3136.5,-1934.5 "/>
<text text-anchor="middle" x="2968" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2799.5,-1911.5 3136.5,-1911.5 "/>
<text text-anchor="middle" x="2968" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="2799.5,-1888.5 3136.5,-1888.5 "/>
<text text-anchor="middle" x="2968" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="2799.5,-1865.5 3136.5,-1865.5 "/>
<text text-anchor="middle" x="2968" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2799.5,-1842.5 3136.5,-1842.5 "/>
<text text-anchor="middle" x="2968" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2799.5,-1819.5 3136.5,-1819.5 "/>
<text text-anchor="middle" x="2968" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="3136.5,-1796.5 3136.5,-2256.5 "/>
<text text-anchor="middle" x="3147" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge39" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M3157.5955,-2065.8333C3168.8572,-2056.0642 3175.5,-2042.9531 3175.5,-2026.5 3175.5,-2013.9031 3171.6061,-2003.2652 3164.7267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="3167.0485,-1991.9513 3157.5955,-1987.1667 3162.0016,-1996.802 3167.0485,-1991.9513"/>
<text text-anchor="middle" x="3191.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge20" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2792.1533,-1796.4057C2765.5838,-1768.7439 2735.4771,-1744.2376 2702,-1727 2656.7216,-1703.6859 2292.9839,-1722.9375 2244,-1709 2165.5312,-1686.6731 2085.2118,-1634.1286 2039.675,-1600.9872"/>
<polygon fill="#000000" stroke="#000000" points="2041.7146,-1598.1426 2031.5853,-1595.0364 2037.5667,-1603.7813 2041.7146,-1598.1426"/>
<text text-anchor="middle" x="2272" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge3" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2774.6529,-1796.4798C2633.3728,-1610.0843 2410.3824,-1355.1944 2156,-1209 2086.4828,-1169.0482 1877.2897,-1140.0284 1737.8721,-1124.4873"/>
<polygon fill="#000000" stroke="#000000" points="1737.8636,-1120.9651 1727.5397,-1123.3459 1737.0949,-1127.9228 1737.8636,-1120.9651"/>
<text text-anchor="middle" x="2492" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node6" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M40,-1727.5C40,-1727.5 496,-1727.5 496,-1727.5 502,-1727.5 508,-1733.5 508,-1739.5 508,-1739.5 508,-2313.5 508,-2313.5 508,-2319.5 502,-2325.5 496,-2325.5 496,-2325.5 40,-2325.5 40,-2325.5 34,-2325.5 28,-2319.5 28,-2313.5 28,-2313.5 28,-1739.5 28,-1739.5 28,-1733.5 34,-1727.5 40,-1727.5"/>
<text text-anchor="middle" x="85.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="143,-1727.5 143,-2325.5 "/>
<text text-anchor="middle" x="153.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="164,-1727.5 164,-2325.5 "/>
<text text-anchor="middle" x="325.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="164,-2302.5 487,-2302.5 "/>
<text text-anchor="middle" x="325.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="164,-2279.5 487,-2279.5 "/>
<text text-anchor="middle" x="325.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="164,-2256.5 487,-2256.5 "/>
<text text-anchor="middle" x="325.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="164,-2233.5 487,-2233.5 "/>
<text text-anchor="middle" x="325.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="164,-2210.5 487,-2210.5 "/>
<text text-anchor="middle" x="325.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="164,-2187.5 487,-2187.5 "/>
<text text-anchor="middle" x="325.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="164,-2164.5 487,-2164.5 "/>
<text text-anchor="middle" x="325.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="164,-2141.5 487,-2141.5 "/>
<text text-anchor="middle" x="325.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="164,-2118.5 487,-2118.5 "/>
<text text-anchor="middle" x="325.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="164,-2095.5 487,-2095.5 "/>
<text text-anchor="middle" x="325.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="164,-2072.5 487,-2072.5 "/>
<text text-anchor="middle" x="325.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="164,-2049.5 487,-2049.5 "/>
<text text-anchor="middle" x="325.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="164,-2026.5 487,-2026.5 "/>
<text text-anchor="middle" x="325.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="164,-2003.5 487,-2003.5 "/>
<text text-anchor="middle" x="325.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="164,-1980.5 487,-1980.5 "/>
<text text-anchor="middle" x="325.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="164,-1957.5 487,-1957.5 "/>
<text text-anchor="middle" x="325.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="164,-1934.5 487,-1934.5 "/>
<text text-anchor="middle" x="325.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="164,-1911.5 487,-1911.5 "/>
<text text-anchor="middle" x="325.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="164,-1888.5 487,-1888.5 "/>
<text text-anchor="middle" x="325.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="164,-1865.5 487,-1865.5 "/>
<text text-anchor="middle" x="325.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="164,-1842.5 487,-1842.5 "/>
<text text-anchor="middle" x="325.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="164,-1819.5 487,-1819.5 "/>
<text text-anchor="middle" x="325.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="164,-1796.5 487,-1796.5 "/>
<text text-anchor="middle" x="325.5" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="164,-1773.5 487,-1773.5 "/>
<text text-anchor="middle" x="325.5" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="164,-1750.5 487,-1750.5 "/>
<text text-anchor="middle" x="325.5" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="487,-1727.5 487,-2325.5 "/>
<text text-anchor="middle" x="497.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge37" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M508.2384,-2064.6912C519.4387,-2055.0507 526,-2042.3203 526,-2026.5 526,-2014.3876 522.1539,-2004.0864 515.3244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="517.719,-1993.0385 508.2384,-1988.3088 512.7002,-1997.9183 517.719,-1993.0385"/>
<text text-anchor="middle" x="542" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node8" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M616.5,-1468.5C616.5,-1468.5 965.5,-1468.5 965.5,-1468.5 971.5,-1468.5 977.5,-1474.5 977.5,-1480.5 977.5,-1480.5 977.5,-1663.5 977.5,-1663.5 977.5,-1669.5 971.5,-1675.5 965.5,-1675.5 965.5,-1675.5 616.5,-1675.5 616.5,-1675.5 610.5,-1675.5 604.5,-1669.5 604.5,-1663.5 604.5,-1663.5 604.5,-1480.5 604.5,-1480.5 604.5,-1474.5 610.5,-1468.5 616.5,-1468.5"/>
<text text-anchor="middle" x="652" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="699.5,-1468.5 699.5,-1675.5 "/>
<text text-anchor="middle" x="710" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="720.5,-1468.5 720.5,-1675.5 "/>
<text text-anchor="middle" x="838.5" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="720.5,-1652.5 956.5,-1652.5 "/>
<text text-anchor="middle" x="838.5" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="720.5,-1629.5 956.5,-1629.5 "/>
<text text-anchor="middle" x="838.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="720.5,-1606.5 956.5,-1606.5 "/>
<text text-anchor="middle" x="838.5" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="720.5,-1583.5 956.5,-1583.5 "/>
<text text-anchor="middle" x="838.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="720.5,-1560.5 956.5,-1560.5 "/>
<text text-anchor="middle" x="838.5" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="720.5,-1537.5 956.5,-1537.5 "/>
<text text-anchor="middle" x="838.5" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="720.5,-1514.5 956.5,-1514.5 "/>
<text text-anchor="middle" x="838.5" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="720.5,-1491.5 956.5,-1491.5 "/>
<text text-anchor="middle" x="838.5" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="956.5,-1468.5 956.5,-1675.5 "/>
<text text-anchor="middle" x="967" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge32" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M508.0538,-1778.7294C527.6167,-1760.8063 547.4028,-1743.3654 567,-1727 585.3444,-1711.6808 605.1756,-1696.3694 625.1916,-1681.6598"/>
<polygon fill="#000000" stroke="#000000" points="627.4584,-1684.3385 633.472,-1675.6157 623.3313,-1678.6845 627.4584,-1684.3385"/>
<text text-anchor="middle" x="658" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge27" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1995.4835,-1548.5587C1983.4912,-1505.4196 1957.747,-1412.8122 1942.3515,-1357.4311"/>
<polygon fill="#000000" stroke="#000000" points="1945.6535,-1356.241 1939.6029,-1347.5438 1938.9092,-1358.1159 1945.6535,-1356.241"/>
<text text-anchor="middle" x="1995.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge38" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2060.0376,-1595.0098C2091.1529,-1598.9199 2119.5,-1591.25 2119.5,-1572 2119.5,-1554.8555 2097.0147,-1546.8964 2070.1145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="2069.7006,-1544.6454 2060.0376,-1548.9902 2070.301,-1551.6196 2069.7006,-1544.6454"/>
<text text-anchor="middle" x="2135.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge4" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2016.9214,-1548.9557C2055.2607,-1486.5663 2148.5321,-1312.1397 2065,-1209 2024.4182,-1158.8924 1858.518,-1133.4729 1737.8,-1121.3689"/>
<polygon fill="#000000" stroke="#000000" points="1738.0242,-1117.8741 1727.7298,-1120.3793 1737.3396,-1124.8406 1738.0242,-1117.8741"/>
<text text-anchor="middle" x="2125" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge7" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M809.0516,-1468.1039C833.652,-1365.1604 889.3343,-1217.0852 1010,-1176 1093.0666,-1147.7168 1325.293,-1128.7085 1474.1374,-1119.0278"/>
<polygon fill="#000000" stroke="#000000" points="1474.5083,-1122.5113 1484.2625,-1118.3753 1474.0581,-1115.5258 1474.5083,-1122.5113"/>
<text text-anchor="middle" x="975" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- disease_extent -->
<g id="node9" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M1524,-1877C1524,-1877 1840,-1877 1840,-1877 1846,-1877 1852,-1883 1852,-1889 1852,-1889 1852,-2164 1852,-2164 1852,-2170 1846,-2176 1840,-2176 1840,-2176 1524,-2176 1524,-2176 1518,-2176 1512,-2170 1512,-2164 1512,-2164 1512,-1889 1512,-1889 1512,-1883 1518,-1877 1524,-1877"/>
<text text-anchor="middle" x="1573.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1635,-1877 1635,-2176 "/>
<text text-anchor="middle" x="1645.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1656,-1877 1656,-2176 "/>
<text text-anchor="middle" x="1743.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1656,-2153 1831,-2153 "/>
<text text-anchor="middle" x="1743.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1656,-2130 1831,-2130 "/>
<text text-anchor="middle" x="1743.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1656,-2107 1831,-2107 "/>
<text text-anchor="middle" x="1743.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1656,-2084 1831,-2084 "/>
<text text-anchor="middle" x="1743.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1656,-2061 1831,-2061 "/>
<text text-anchor="middle" x="1743.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1656,-2038 1831,-2038 "/>
<text text-anchor="middle" x="1743.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1656,-2015 1831,-2015 "/>
<text text-anchor="middle" x="1743.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1656,-1992 1831,-1992 "/>
<text text-anchor="middle" x="1743.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1656,-1969 1831,-1969 "/>
<text text-anchor="middle" x="1743.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1656,-1946 1831,-1946 "/>
<text text-anchor="middle" x="1743.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1656,-1923 1831,-1923 "/>
<text text-anchor="middle" x="1743.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1656,-1900 1831,-1900 "/>
<text text-anchor="middle" x="1743.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1831,-1877 1831,-2176 "/>
<text text-anchor="middle" x="1841.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge21" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1763.528,-1876.8714C1792.3338,-1827.7708 1826.2553,-1773.8203 1861,-1727 1895.2742,-1680.8138 1940.9929,-1632.5567 1970.9476,-1602.4026"/>
<polygon fill="#000000" stroke="#000000" points="1973.6138,-1604.686 1978.207,-1595.1386 1968.6625,-1599.7378 1973.6138,-1604.686"/>
<text text-anchor="middle" x="1914" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- follow_up -->
<g id="node10" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1064,-1209.5C1064,-1209.5 1396,-1209.5 1396,-1209.5 1402,-1209.5 1408,-1215.5 1408,-1221.5 1408,-1221.5 1408,-1404.5 1408,-1404.5 1408,-1410.5 1402,-1416.5 1396,-1416.5 1396,-1416.5 1064,-1416.5 1064,-1416.5 1058,-1416.5 1052,-1410.5 1052,-1404.5 1052,-1404.5 1052,-1221.5 1052,-1221.5 1052,-1215.5 1058,-1209.5 1064,-1209.5"/>
<text text-anchor="middle" x="1094.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1137,-1209.5 1137,-1416.5 "/>
<text text-anchor="middle" x="1147.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1158,-1209.5 1158,-1416.5 "/>
<text text-anchor="middle" x="1272.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1158,-1393.5 1387,-1393.5 "/>
<text text-anchor="middle" x="1272.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1158,-1370.5 1387,-1370.5 "/>
<text text-anchor="middle" x="1272.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1158,-1347.5 1387,-1347.5 "/>
<text text-anchor="middle" x="1272.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1158,-1324.5 1387,-1324.5 "/>
<text text-anchor="middle" x="1272.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1158,-1301.5 1387,-1301.5 "/>
<text text-anchor="middle" x="1272.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1158,-1278.5 1387,-1278.5 "/>
<text text-anchor="middle" x="1272.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1158,-1255.5 1387,-1255.5 "/>
<text text-anchor="middle" x="1272.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1158,-1232.5 1387,-1232.5 "/>
<text text-anchor="middle" x="1272.5" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1387,-1209.5 1387,-1416.5 "/>
<text text-anchor="middle" x="1397.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge5" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1408.0928,-1213.7866C1411.0822,-1212.1757 1414.0531,-1210.5791 1417,-1209 1445.7783,-1193.5794 1477.2265,-1177.1784 1506.0663,-1162.3144"/>
<polygon fill="#000000" stroke="#000000" points="1508.0419,-1165.234 1515.3315,-1157.5456 1504.8384,-1159.01 1508.0419,-1165.234"/>
<text text-anchor="middle" x="1507" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_surgery -->
<g id="node11" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M588,-1946C588,-1946 934,-1946 934,-1946 940,-1946 946,-1952 946,-1958 946,-1958 946,-2095 946,-2095 946,-2101 940,-2107 934,-2107 934,-2107 588,-2107 588,-2107 582,-2107 576,-2101 576,-2095 576,-2095 576,-1958 576,-1958 576,-1952 582,-1946 588,-1946"/>
<text text-anchor="middle" x="633.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="691,-1946 691,-2107 "/>
<text text-anchor="middle" x="701.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="712,-1946 712,-2107 "/>
<text text-anchor="middle" x="818.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="712,-2084 925,-2084 "/>
<text text-anchor="middle" x="818.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="712,-2061 925,-2061 "/>
<text text-anchor="middle" x="818.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="712,-2038 925,-2038 "/>
<text text-anchor="middle" x="818.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="712,-2015 925,-2015 "/>
<text text-anchor="middle" x="818.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="712,-1992 925,-1992 "/>
<text text-anchor="middle" x="818.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="712,-1969 925,-1969 "/>
<text text-anchor="middle" x="818.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="925,-1946 925,-2107 "/>
<text text-anchor="middle" x="935.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge30" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M766.3288,-1945.7682C771.1002,-1873.4814 778.1476,-1766.714 783.4899,-1685.7784"/>
<polygon fill="#000000" stroke="#000000" points="786.9993,-1685.7489 784.1657,-1675.5401 780.0145,-1685.2878 786.9993,-1685.7489"/>
<text text-anchor="middle" x="833" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge40" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M946.113,-2068.5585C957.2907,-2058.5547 964,-2044.5352 964,-2026.5 964,-2012.5509 959.9865,-2001.004 952.9962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="955.4806,-1989.3911 946.113,-1984.4415 950.3494,-1994.1525 955.4806,-1989.3911"/>
<text text-anchor="middle" x="980" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- file -->
<g id="node12" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1657.5,-2750.5C1657.5,-2750.5 1842.5,-2750.5 1842.5,-2750.5 1848.5,-2750.5 1854.5,-2756.5 1854.5,-2762.5 1854.5,-2762.5 1854.5,-2945.5 1854.5,-2945.5 1854.5,-2951.5 1848.5,-2957.5 1842.5,-2957.5 1842.5,-2957.5 1657.5,-2957.5 1657.5,-2957.5 1651.5,-2957.5 1645.5,-2951.5 1645.5,-2945.5 1645.5,-2945.5 1645.5,-2762.5 1645.5,-2762.5 1645.5,-2756.5 1651.5,-2750.5 1657.5,-2750.5"/>
<text text-anchor="middle" x="1665" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1684.5,-2750.5 1684.5,-2957.5 "/>
<text text-anchor="middle" x="1695" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1705.5,-2750.5 1705.5,-2957.5 "/>
<text text-anchor="middle" x="1769.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1705.5,-2934.5 1833.5,-2934.5 "/>
<text text-anchor="middle" x="1769.5" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="1705.5,-2911.5 1833.5,-2911.5 "/>
<text text-anchor="middle" x="1769.5" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1705.5,-2888.5 1833.5,-2888.5 "/>
<text text-anchor="middle" x="1769.5" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1705.5,-2865.5 1833.5,-2865.5 "/>
<text text-anchor="middle" x="1769.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1705.5,-2842.5 1833.5,-2842.5 "/>
<text text-anchor="middle" x="1769.5" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1705.5,-2819.5 1833.5,-2819.5 "/>
<text text-anchor="middle" x="1769.5" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1705.5,-2796.5 1833.5,-2796.5 "/>
<text text-anchor="middle" x="1769.5" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1705.5,-2773.5 1833.5,-2773.5 "/>
<text text-anchor="middle" x="1769.5" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1833.5,-2750.5 1833.5,-2957.5 "/>
<text text-anchor="middle" x="1844" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge34" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1645.4461,-2849.1501C1268.3002,-2830.9755 0,-2763.6728 0,-2680.5 0,-2680.5 0,-2680.5 0,-438 0,-366.6358 456.824,-311.0486 708.7977,-285.8159"/>
<polygon fill="#000000" stroke="#000000" points="709.1816,-289.2951 718.7853,-284.8209 708.4876,-282.3296 709.1816,-289.2951"/>
<text text-anchor="middle" x="30.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge23" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1779.1765,-2750.3383C1820.1576,-2627.122 1907.944,-2427.6805 2065,-2344 2127.4896,-2310.7051 2638.8711,-2358.0662 2702,-2326 2732.6889,-2310.4116 2760.526,-2288.6802 2785.3948,-2263.9687"/>
<polygon fill="#000000" stroke="#000000" points="2788.1573,-2266.1513 2792.6724,-2256.5667 2783.1657,-2261.2436 2788.1573,-2266.1513"/>
<text text-anchor="middle" x="1846.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- assay -->
<g id="node24" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1932,-2662.5C1932,-2662.5 1964,-2662.5 1964,-2662.5 1970,-2662.5 1976,-2668.5 1976,-2674.5 1976,-2674.5 1976,-2686.5 1976,-2686.5 1976,-2692.5 1970,-2698.5 1964,-2698.5 1964,-2698.5 1932,-2698.5 1932,-2698.5 1926,-2698.5 1920,-2692.5 1920,-2686.5 1920,-2686.5 1920,-2674.5 1920,-2674.5 1920,-2668.5 1926,-2662.5 1932,-2662.5"/>
<text text-anchor="middle" x="1948" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge26" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1844.2456,-2750.2741C1856.7873,-2738.4951 1869.865,-2727.1089 1883,-2717 1891.5497,-2710.4201 1901.4234,-2704.2552 1910.8523,-2698.9327"/>
<polygon fill="#000000" stroke="#000000" points="1912.5994,-2701.9666 1919.6984,-2694.1018 1909.2443,-2695.823 1912.5994,-2701.9666"/>
<text text-anchor="middle" x="1913.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- diagnosis -->
<g id="node26" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1041.5,-2344.5C1041.5,-2344.5 1384.5,-2344.5 1384.5,-2344.5 1390.5,-2344.5 1396.5,-2350.5 1396.5,-2356.5 1396.5,-2356.5 1396.5,-2631.5 1396.5,-2631.5 1396.5,-2637.5 1390.5,-2643.5 1384.5,-2643.5 1384.5,-2643.5 1041.5,-2643.5 1041.5,-2643.5 1035.5,-2643.5 1029.5,-2637.5 1029.5,-2631.5 1029.5,-2631.5 1029.5,-2356.5 1029.5,-2356.5 1029.5,-2350.5 1035.5,-2344.5 1041.5,-2344.5"/>
<text text-anchor="middle" x="1071.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="1113.5,-2344.5 1113.5,-2643.5 "/>
<text text-anchor="middle" x="1124" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1134.5,-2344.5 1134.5,-2643.5 "/>
<text text-anchor="middle" x="1255" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2620.5 1375.5,-2620.5 "/>
<text text-anchor="middle" x="1255" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2597.5 1375.5,-2597.5 "/>
<text text-anchor="middle" x="1255" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2574.5 1375.5,-2574.5 "/>
<text text-anchor="middle" x="1255" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2551.5 1375.5,-2551.5 "/>
<text text-anchor="middle" x="1255" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2528.5 1375.5,-2528.5 "/>
<text text-anchor="middle" x="1255" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2505.5 1375.5,-2505.5 "/>
<text text-anchor="middle" x="1255" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2482.5 1375.5,-2482.5 "/>
<text text-anchor="middle" x="1255" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2459.5 1375.5,-2459.5 "/>
<text text-anchor="middle" x="1255" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2436.5 1375.5,-2436.5 "/>
<text text-anchor="middle" x="1255" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2413.5 1375.5,-2413.5 "/>
<text text-anchor="middle" x="1255" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2390.5 1375.5,-2390.5 "/>
<text text-anchor="middle" x="1255" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2367.5 1375.5,-2367.5 "/>
<text text-anchor="middle" x="1255" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="1375.5,-2344.5 1375.5,-2643.5 "/>
<text text-anchor="middle" x="1386" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge36" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1645.1862,-2783.7338C1577.0837,-2738.0784 1486.2622,-2677.1926 1405.4559,-2623.0207"/>
<polygon fill="#000000" stroke="#000000" points="1406.9195,-2619.7882 1396.6643,-2617.1269 1403.0216,-2625.6025 1406.9195,-2619.7882"/>
<text text-anchor="middle" x="1615.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- demographic -->
<g id="node13" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1438,-1232.5C1438,-1232.5 1774,-1232.5 1774,-1232.5 1780,-1232.5 1786,-1238.5 1786,-1244.5 1786,-1244.5 1786,-1381.5 1786,-1381.5 1786,-1387.5 1780,-1393.5 1774,-1393.5 1774,-1393.5 1438,-1393.5 1438,-1393.5 1432,-1393.5 1426,-1387.5 1426,-1381.5 1426,-1381.5 1426,-1244.5 1426,-1244.5 1426,-1238.5 1432,-1232.5 1438,-1232.5"/>
<text text-anchor="middle" x="1481" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1536,-1232.5 1536,-1393.5 "/>
<text text-anchor="middle" x="1546.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1557,-1232.5 1557,-1393.5 "/>
<text text-anchor="middle" x="1661" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1557,-1370.5 1765,-1370.5 "/>
<text text-anchor="middle" x="1661" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1557,-1347.5 1765,-1347.5 "/>
<text text-anchor="middle" x="1661" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1557,-1324.5 1765,-1324.5 "/>
<text text-anchor="middle" x="1661" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1557,-1301.5 1765,-1301.5 "/>
<text text-anchor="middle" x="1661" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1557,-1278.5 1765,-1278.5 "/>
<text text-anchor="middle" x="1661" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1557,-1255.5 1765,-1255.5 "/>
<text text-anchor="middle" x="1661" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1765,-1232.5 1765,-1393.5 "/>
<text text-anchor="middle" x="1775.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge8" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1606,-1232.4932C1606,-1210.8363 1606,-1187.8778 1606,-1167.8468"/>
<polygon fill="#000000" stroke="#000000" points="1609.5001,-1167.661 1606,-1157.661 1602.5001,-1167.6611 1609.5001,-1167.661"/>
<text text-anchor="middle" x="1633" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_site -->
<g id="node14" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M411.5,-403.5C411.5,-403.5 728.5,-403.5 728.5,-403.5 734.5,-403.5 740.5,-409.5 740.5,-415.5 740.5,-415.5 740.5,-460.5 740.5,-460.5 740.5,-466.5 734.5,-472.5 728.5,-472.5 728.5,-472.5 411.5,-472.5 411.5,-472.5 405.5,-472.5 399.5,-466.5 399.5,-460.5 399.5,-460.5 399.5,-415.5 399.5,-415.5 399.5,-409.5 405.5,-403.5 411.5,-403.5"/>
<text text-anchor="middle" x="444.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="489.5,-403.5 489.5,-472.5 "/>
<text text-anchor="middle" x="500" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="510.5,-403.5 510.5,-472.5 "/>
<text text-anchor="middle" x="615" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="510.5,-449.5 719.5,-449.5 "/>
<text text-anchor="middle" x="615" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="510.5,-426.5 719.5,-426.5 "/>
<text text-anchor="middle" x="615" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="719.5,-403.5 719.5,-472.5 "/>
<text text-anchor="middle" x="730" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge33" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M632.3674,-403.3975C657.2085,-389.6152 686.9956,-373.0888 716.9696,-356.4587"/>
<polygon fill="#000000" stroke="#000000" points="718.8006,-359.4455 725.8469,-351.5335 715.4045,-353.3245 718.8006,-359.4455"/>
<text text-anchor="middle" x="715.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- agent_administration -->
<g id="node15" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M2211.5,-1785C2211.5,-1785 2680.5,-1785 2680.5,-1785 2686.5,-1785 2692.5,-1791 2692.5,-1797 2692.5,-1797 2692.5,-2256 2692.5,-2256 2692.5,-2262 2686.5,-2268 2680.5,-2268 2680.5,-2268 2211.5,-2268 2211.5,-2268 2205.5,-2268 2199.5,-2262 2199.5,-2256 2199.5,-2256 2199.5,-1797 2199.5,-1797 2199.5,-1791 2205.5,-1785 2211.5,-1785"/>
<text text-anchor="middle" x="2284.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="2369.5,-1785 2369.5,-2268 "/>
<text text-anchor="middle" x="2380" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2390.5,-1785 2390.5,-2268 "/>
<text text-anchor="middle" x="2531" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2245 2671.5,-2245 "/>
<text text-anchor="middle" x="2531" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2222 2671.5,-2222 "/>
<text text-anchor="middle" x="2531" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2199 2671.5,-2199 "/>
<text text-anchor="middle" x="2531" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2176 2671.5,-2176 "/>
<text text-anchor="middle" x="2531" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2153 2671.5,-2153 "/>
<text text-anchor="middle" x="2531" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2130 2671.5,-2130 "/>
<text text-anchor="middle" x="2531" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2107 2671.5,-2107 "/>
<text text-anchor="middle" x="2531" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2084 2671.5,-2084 "/>
<text text-anchor="middle" x="2531" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2061 2671.5,-2061 "/>
<text text-anchor="middle" x="2531" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2038 2671.5,-2038 "/>
<text text-anchor="middle" x="2531" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="2390.5,-2015 2671.5,-2015 "/>
<text text-anchor="middle" x="2531" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2390.5,-1992 2671.5,-1992 "/>
<text text-anchor="middle" x="2531" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="2390.5,-1969 2671.5,-1969 "/>
<text text-anchor="middle" x="2531" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="2390.5,-1946 2671.5,-1946 "/>
<text text-anchor="middle" x="2531" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="2390.5,-1923 2671.5,-1923 "/>
<text text-anchor="middle" x="2531" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="2390.5,-1900 2671.5,-1900 "/>
<text text-anchor="middle" x="2531" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2390.5,-1877 2671.5,-1877 "/>
<text text-anchor="middle" x="2531" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2390.5,-1854 2671.5,-1854 "/>
<text text-anchor="middle" x="2531" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="2390.5,-1831 2671.5,-1831 "/>
<text text-anchor="middle" x="2531" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2390.5,-1808 2671.5,-1808 "/>
<text text-anchor="middle" x="2531" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="2671.5,-1785 2671.5,-2268 "/>
<text text-anchor="middle" x="2682" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge19" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2264.7982,-1784.9875C2241.6919,-1763.3329 2216.9716,-1743.4269 2191,-1727 2164.9412,-1710.518 2150.2404,-1725.1913 2124,-1709 2080.3964,-1682.0949 2043.4164,-1634.9025 2021.9548,-1603.5457"/>
<polygon fill="#000000" stroke="#000000" points="2024.7996,-1601.5039 2016.3204,-1595.1515 2018.9875,-1605.4051 2024.7996,-1601.5039"/>
<text text-anchor="middle" x="2152" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge29" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2319.7792,-1784.8963C2294.7416,-1717.7707 2276,-1643.6085 2276,-1572 2276,-1572 2276,-1572 2276,-1111.5 2276,-1067.1729 2261.5393,-1057.8421 2255,-1014 2242.1035,-927.5373 2277.8006,-689.2935 2222,-622 2211.4786,-609.3115 2136.1566,-589.0664 2067.8863,-572.8811"/>
<polygon fill="#000000" stroke="#000000" points="2068.4093,-569.4086 2057.8734,-570.5239 2066.8052,-576.2223 2068.4093,-569.4086"/>
<text text-anchor="middle" x="2307" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge12" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1484.2345,-1105.3005C1268.1607,-1093.1037 835.7867,-1062.8496 788,-1014 726.7988,-951.4375 769,-905.5195 769,-818 769,-818 769,-818 769,-438 769,-410.617 779.1113,-383.9223 792.9668,-360.197"/>
<polygon fill="#000000" stroke="#000000" points="795.9964,-361.9515 798.2291,-351.5946 790.0251,-358.2987 795.9964,-361.9515"/>
<text text-anchor="middle" x="809.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge42" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1727.7148,-1071.5876C1742.2493,-1064.4712 1756.3852,-1056.3016 1769,-1047 1779.9828,-1038.9017 1790.6797,-1029.9947 1801.0306,-1020.5366"/>
<polygon fill="#000000" stroke="#000000" points="1803.5859,-1022.9392 1808.5057,-1013.5559 1798.8082,-1017.8232 1803.5859,-1022.9392"/>
<text text-anchor="middle" x="1857" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- cohort -->
<g id="node20" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2108.5,-524.5C2108.5,-524.5 2341.5,-524.5 2341.5,-524.5 2347.5,-524.5 2353.5,-530.5 2353.5,-536.5 2353.5,-536.5 2353.5,-558.5 2353.5,-558.5 2353.5,-564.5 2347.5,-570.5 2341.5,-570.5 2341.5,-570.5 2108.5,-570.5 2108.5,-570.5 2102.5,-570.5 2096.5,-564.5 2096.5,-558.5 2096.5,-558.5 2096.5,-536.5 2096.5,-536.5 2096.5,-530.5 2102.5,-524.5 2108.5,-524.5"/>
<text text-anchor="middle" x="2128" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2159.5,-524.5 2159.5,-570.5 "/>
<text text-anchor="middle" x="2170" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2180.5,-524.5 2180.5,-570.5 "/>
<text text-anchor="middle" x="2256.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2180.5,-547.5 2332.5,-547.5 "/>
<text text-anchor="middle" x="2256.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2332.5,-524.5 2332.5,-570.5 "/>
<text text-anchor="middle" x="2343" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge13" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1727.5299,-1100.66C1897.7881,-1084.2317 2190.1913,-1050.9978 2222,-1014 2330.4525,-887.8552 2266.8036,-663.8207 2237.4056,-580.1859"/>
<polygon fill="#000000" stroke="#000000" points="2240.6738,-578.9306 2234.0041,-570.6985 2234.0844,-581.2931 2240.6738,-578.9306"/>
<text text-anchor="middle" x="2322.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_treatment -->
<g id="node22" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M809.5,-726C809.5,-726 1256.5,-726 1256.5,-726 1262.5,-726 1268.5,-732 1268.5,-738 1268.5,-738 1268.5,-898 1268.5,-898 1268.5,-904 1262.5,-910 1256.5,-910 1256.5,-910 809.5,-910 809.5,-910 803.5,-910 797.5,-904 797.5,-898 797.5,-898 797.5,-738 797.5,-738 797.5,-732 803.5,-726 809.5,-726"/>
<text text-anchor="middle" x="855" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="912.5,-726 912.5,-910 "/>
<text text-anchor="middle" x="923" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="933.5,-726 933.5,-910 "/>
<text text-anchor="middle" x="1090.5" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="933.5,-887 1247.5,-887 "/>
<text text-anchor="middle" x="1090.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="933.5,-864 1247.5,-864 "/>
<text text-anchor="middle" x="1090.5" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="933.5,-841 1247.5,-841 "/>
<text text-anchor="middle" x="1090.5" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="933.5,-818 1247.5,-818 "/>
<text text-anchor="middle" x="1090.5" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="933.5,-795 1247.5,-795 "/>
<text text-anchor="middle" x="1090.5" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="933.5,-772 1247.5,-772 "/>
<text text-anchor="middle" x="1090.5" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="933.5,-749 1247.5,-749 "/>
<text text-anchor="middle" x="1090.5" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1247.5,-726 1247.5,-910 "/>
<text text-anchor="middle" x="1258" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge1" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1484.2823,-1083.2636C1443.7738,-1072.9618 1398.637,-1060.4964 1358,-1047 1321.1084,-1034.7475 1310.5044,-1033.7122 1277,-1014 1230.0344,-986.368 1182.4206,-950.3064 1141.8741,-916.6603"/>
<polygon fill="#000000" stroke="#000000" points="1144.0434,-913.912 1134.1246,-910.1879 1139.5562,-919.2846 1144.0434,-913.912"/>
<text text-anchor="middle" x="1429" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- off_study -->
<g id="node23" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M1298.5,-714.5C1298.5,-714.5 1713.5,-714.5 1713.5,-714.5 1719.5,-714.5 1725.5,-720.5 1725.5,-726.5 1725.5,-726.5 1725.5,-909.5 1725.5,-909.5 1725.5,-915.5 1719.5,-921.5 1713.5,-921.5 1713.5,-921.5 1298.5,-921.5 1298.5,-921.5 1292.5,-921.5 1286.5,-915.5 1286.5,-909.5 1286.5,-909.5 1286.5,-726.5 1286.5,-726.5 1286.5,-720.5 1292.5,-714.5 1298.5,-714.5"/>
<text text-anchor="middle" x="1328" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="1369.5,-714.5 1369.5,-921.5 "/>
<text text-anchor="middle" x="1380" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1390.5,-714.5 1390.5,-921.5 "/>
<text text-anchor="middle" x="1547.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1390.5,-898.5 1704.5,-898.5 "/>
<text text-anchor="middle" x="1547.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1390.5,-875.5 1704.5,-875.5 "/>
<text text-anchor="middle" x="1547.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1390.5,-852.5 1704.5,-852.5 "/>
<text text-anchor="middle" x="1547.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1390.5,-829.5 1704.5,-829.5 "/>
<text text-anchor="middle" x="1547.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1390.5,-806.5 1704.5,-806.5 "/>
<text text-anchor="middle" x="1547.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1390.5,-783.5 1704.5,-783.5 "/>
<text text-anchor="middle" x="1547.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1390.5,-760.5 1704.5,-760.5 "/>
<text text-anchor="middle" x="1547.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1390.5,-737.5 1704.5,-737.5 "/>
<text text-anchor="middle" x="1547.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1704.5,-714.5 1704.5,-921.5 "/>
<text text-anchor="middle" x="1715" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge43" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1522.3481,-1065.0811C1517.1477,-1059.5915 1512.5778,-1053.5719 1509,-1047 1490.1958,-1012.4595 1485.4745,-970.4241 1486.7609,-931.8418"/>
<polygon fill="#000000" stroke="#000000" points="1490.2694,-931.7426 1487.2439,-921.589 1483.2771,-931.4132 1490.2694,-931.7426"/>
<text text-anchor="middle" x="1563.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- study_arm -->
<g id="node21" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1768.5,-403.5C1768.5,-403.5 2137.5,-403.5 2137.5,-403.5 2143.5,-403.5 2149.5,-409.5 2149.5,-415.5 2149.5,-415.5 2149.5,-460.5 2149.5,-460.5 2149.5,-466.5 2143.5,-472.5 2137.5,-472.5 2137.5,-472.5 1768.5,-472.5 1768.5,-472.5 1762.5,-472.5 1756.5,-466.5 1756.5,-460.5 1756.5,-460.5 1756.5,-415.5 1756.5,-415.5 1756.5,-409.5 1762.5,-403.5 1768.5,-403.5"/>
<text text-anchor="middle" x="1802.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1848.5,-403.5 1848.5,-472.5 "/>
<text text-anchor="middle" x="1859" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1869.5,-403.5 1869.5,-472.5 "/>
<text text-anchor="middle" x="1999" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1869.5,-449.5 2128.5,-449.5 "/>
<text text-anchor="middle" x="1999" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1869.5,-426.5 2128.5,-426.5 "/>
<text text-anchor="middle" x="1999" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="2128.5,-403.5 2128.5,-472.5 "/>
<text text-anchor="middle" x="2139" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge2" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1953,-524.2779C1953,-512.2547 1953,-497.1545 1953,-482.9615"/>
<polygon fill="#000000" stroke="#000000" points="1956.5001,-482.844 1953,-472.844 1949.5001,-482.844 1956.5001,-482.844"/>
<text text-anchor="middle" x="2001.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- principal_investigator -->
<g id="node19" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M809.5,-403.5C809.5,-403.5 1136.5,-403.5 1136.5,-403.5 1142.5,-403.5 1148.5,-409.5 1148.5,-415.5 1148.5,-415.5 1148.5,-460.5 1148.5,-460.5 1148.5,-466.5 1142.5,-472.5 1136.5,-472.5 1136.5,-472.5 809.5,-472.5 809.5,-472.5 803.5,-472.5 797.5,-466.5 797.5,-460.5 797.5,-460.5 797.5,-415.5 797.5,-415.5 797.5,-409.5 803.5,-403.5 809.5,-403.5"/>
<text text-anchor="middle" x="884.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="971.5,-403.5 971.5,-472.5 "/>
<text text-anchor="middle" x="982" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="992.5,-403.5 992.5,-472.5 "/>
<text text-anchor="middle" x="1060" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="992.5,-449.5 1127.5,-449.5 "/>
<text text-anchor="middle" x="1060" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="992.5,-426.5 1127.5,-426.5 "/>
<text text-anchor="middle" x="1060" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="1127.5,-403.5 1127.5,-472.5 "/>
<text text-anchor="middle" x="1138" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge35" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M951.8655,-403.3975C944.0864,-390.6611 934.876,-375.5813 925.5069,-360.2418"/>
<polygon fill="#000000" stroke="#000000" points="928.4931,-358.4161 920.2937,-351.7063 922.5192,-362.0648 928.4931,-358.4161"/>
<text text-anchor="middle" x="971.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge14" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2221.618,-524.2311C2215.4904,-491.2874 2199.2271,-431.8545 2159,-403 2069.2879,-338.6503 1358.6876,-295.3264 1033.0249,-278.6559"/>
<polygon fill="#000000" stroke="#000000" points="1033.1935,-275.16 1023.0283,-278.1464 1032.8371,-282.151 1033.1935,-275.16"/>
<text text-anchor="middle" x="2247.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge15" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2158.7521,-524.3912C2142.72,-518.5794 2125.686,-512.2202 2110,-506 2086.9451,-496.8576 2062.2278,-486.4452 2039.3851,-476.5638"/>
<polygon fill="#000000" stroke="#000000" points="2040.6261,-473.287 2030.0595,-472.5144 2037.838,-479.7078 2040.6261,-473.287"/>
<text text-anchor="middle" x="2150.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge11" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1756.4307,-407.6607C1549.2268,-375.6801 1226.6299,-325.8893 1033.3548,-296.0585"/>
<polygon fill="#000000" stroke="#000000" points="1033.8089,-292.5872 1023.392,-294.5208 1032.7411,-299.5053 1033.8089,-292.5872"/>
<text text-anchor="middle" x="1644.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge24" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1976.2809,-2672.5269C2081.3225,-2641.8843 2455.6532,-2523.4272 2702,-2326 2724.9403,-2307.6152 2746.9423,-2286.5202 2767.6344,-2264.2218"/>
<polygon fill="#000000" stroke="#000000" points="2770.4276,-2266.354 2774.601,-2256.6157 2765.2657,-2261.626 2770.4276,-2266.354"/>
<text text-anchor="middle" x="2702.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- vital_signs -->
<g id="node25" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1882.5,-1865.5C1882.5,-1865.5 2169.5,-1865.5 2169.5,-1865.5 2175.5,-1865.5 2181.5,-1871.5 2181.5,-1877.5 2181.5,-1877.5 2181.5,-2175.5 2181.5,-2175.5 2181.5,-2181.5 2175.5,-2187.5 2169.5,-2187.5 2169.5,-2187.5 1882.5,-2187.5 1882.5,-2187.5 1876.5,-2187.5 1870.5,-2181.5 1870.5,-2175.5 1870.5,-2175.5 1870.5,-1877.5 1870.5,-1877.5 1870.5,-1871.5 1876.5,-1865.5 1882.5,-1865.5"/>
<text text-anchor="middle" x="1917" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1963.5,-1865.5 1963.5,-2187.5 "/>
<text text-anchor="middle" x="1974" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1984.5,-1865.5 1984.5,-2187.5 "/>
<text text-anchor="middle" x="2072.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1984.5,-2164.5 2160.5,-2164.5 "/>
<text text-anchor="middle" x="2072.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1984.5,-2141.5 2160.5,-2141.5 "/>
<text text-anchor="middle" x="2072.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1984.5,-2118.5 2160.5,-2118.5 "/>
<text text-anchor="middle" x="2072.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1984.5,-2095.5 2160.5,-2095.5 "/>
<text text-anchor="middle" x="2072.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1984.5,-2072.5 2160.5,-2072.5 "/>
<text text-anchor="middle" x="2072.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1984.5,-2049.5 2160.5,-2049.5 "/>
<text text-anchor="middle" x="2072.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1984.5,-2026.5 2160.5,-2026.5 "/>
<text text-anchor="middle" x="2072.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1984.5,-2003.5 2160.5,-2003.5 "/>
<text text-anchor="middle" x="2072.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1980.5 2160.5,-1980.5 "/>
<text text-anchor="middle" x="2072.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1957.5 2160.5,-1957.5 "/>
<text text-anchor="middle" x="2072.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1934.5 2160.5,-1934.5 "/>
<text text-anchor="middle" x="2072.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1911.5 2160.5,-1911.5 "/>
<text text-anchor="middle" x="2072.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1888.5 2160.5,-1888.5 "/>
<text text-anchor="middle" x="2072.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="2160.5,-1865.5 2160.5,-2187.5 "/>
<text text-anchor="middle" x="2171" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge18" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2017.4878,-1865.3007C2012.4964,-1770.7762 2006.6233,-1659.5546 2003.755,-1605.236"/>
<polygon fill="#000000" stroke="#000000" points="2007.2451,-1604.9543 2003.2226,-1595.1528 2000.2549,-1605.3235 2007.2451,-1604.9543"/>
<text text-anchor="middle" x="2037" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge6" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1052.2078,-2344.4849C1048.8228,-2338.4423 1045.7345,-2332.2767 1043,-2326 987.5461,-2198.713 1024,-1840.342 1024,-1701.5 1024,-1701.5 1024,-1701.5 1024,-1313 1024,-1266.0127 1009.6222,-1242.0715 1043,-1209 1102.3689,-1150.176 1327.5015,-1126.5481 1474.4596,-1117.2684"/>
<polygon fill="#000000" stroke="#000000" points="1474.6974,-1120.7605 1484.4629,-1116.6512 1474.2663,-1113.7738 1474.6974,-1120.7605"/>
<text text-anchor="middle" x="1051" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- image -->
<g id="node27" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1930,-2836C1930,-2836 1966,-2836 1966,-2836 1972,-2836 1978,-2842 1978,-2848 1978,-2848 1978,-2860 1978,-2860 1978,-2866 1972,-2872 1966,-2872 1966,-2872 1930,-2872 1930,-2872 1924,-2872 1918,-2866 1918,-2860 1918,-2860 1918,-2848 1918,-2848 1918,-2842 1924,-2836 1930,-2836"/>
<text text-anchor="middle" x="1948" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge25" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1948,-2835.7604C1948,-2805.5622 1948,-2744.9545 1948,-2709.0457"/>
<polygon fill="#000000" stroke="#000000" points="1951.5001,-2708.7555 1948,-2698.7556 1944.5001,-2708.7556 1951.5001,-2708.7555"/>
<text text-anchor="middle" x="1978.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- physical_exam -->
<g id="node28" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1166,-1934.5C1166,-1934.5 1482,-1934.5 1482,-1934.5 1488,-1934.5 1494,-1940.5 1494,-1946.5 1494,-1946.5 1494,-2106.5 1494,-2106.5 1494,-2112.5 1488,-2118.5 1482,-2118.5 1482,-2118.5 1166,-2118.5 1166,-2118.5 1160,-2118.5 1154,-2112.5 1154,-2106.5 1154,-2106.5 1154,-1946.5 1154,-1946.5 1154,-1940.5 1160,-1934.5 1166,-1934.5"/>
<text text-anchor="middle" x="1215" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1276,-1934.5 1276,-2118.5 "/>
<text text-anchor="middle" x="1286.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1297,-1934.5 1297,-2118.5 "/>
<text text-anchor="middle" x="1385" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1297,-2095.5 1473,-2095.5 "/>
<text text-anchor="middle" x="1385" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1297,-2072.5 1473,-2072.5 "/>
<text text-anchor="middle" x="1385" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1297,-2049.5 1473,-2049.5 "/>
<text text-anchor="middle" x="1385" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1297,-2026.5 1473,-2026.5 "/>
<text text-anchor="middle" x="1385" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1297,-2003.5 1473,-2003.5 "/>
<text text-anchor="middle" x="1385" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1297,-1980.5 1473,-1980.5 "/>
<text text-anchor="middle" x="1385" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1297,-1957.5 1473,-1957.5 "/>
<text text-anchor="middle" x="1385" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1473,-1934.5 1473,-2118.5 "/>
<text text-anchor="middle" x="1483.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge22" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1358.047,-1934.2612C1387.0475,-1867.738 1434.9225,-1780.5628 1503,-1727 1617.0733,-1637.2481 1783.4844,-1599.139 1892.2464,-1583.1786"/>
<polygon fill="#000000" stroke="#000000" points="1892.8564,-1586.6271 1902.2607,-1581.7477 1891.8661,-1579.6975 1892.8564,-1586.6271"/>
<text text-anchor="middle" x="1578" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge31" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1292.3089,-1934.4103C1264.1734,-1866.6051 1216.3386,-1777.7204 1145,-1727 1112.819,-1704.12 1095.2377,-1722.1325 1058,-1709 1034.4684,-1700.7012 1010.3966,-1690.7126 986.8104,-1679.9569"/>
<polygon fill="#000000" stroke="#000000" points="987.9921,-1676.6476 977.4458,-1675.6353 985.059,-1683.0034 987.9921,-1676.6476"/>
<text text-anchor="middle" x="1108" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
</g>
</svg>
</div>
