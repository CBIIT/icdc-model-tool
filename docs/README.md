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
<svg width="3283pt" height="2966pt"
 viewBox="0.00 0.00 3282.50 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3278.5,-2962 3278.5,4 -4,4"/>
<!-- physical_exam -->
<g id="node1" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1828.5,-1934.5C1828.5,-1934.5 2144.5,-1934.5 2144.5,-1934.5 2150.5,-1934.5 2156.5,-1940.5 2156.5,-1946.5 2156.5,-1946.5 2156.5,-2106.5 2156.5,-2106.5 2156.5,-2112.5 2150.5,-2118.5 2144.5,-2118.5 2144.5,-2118.5 1828.5,-2118.5 1828.5,-2118.5 1822.5,-2118.5 1816.5,-2112.5 1816.5,-2106.5 1816.5,-2106.5 1816.5,-1946.5 1816.5,-1946.5 1816.5,-1940.5 1822.5,-1934.5 1828.5,-1934.5"/>
<text text-anchor="middle" x="1877.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1938.5,-1934.5 1938.5,-2118.5 "/>
<text text-anchor="middle" x="1949" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1959.5,-1934.5 1959.5,-2118.5 "/>
<text text-anchor="middle" x="2047.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2095.5 2135.5,-2095.5 "/>
<text text-anchor="middle" x="2047.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2072.5 2135.5,-2072.5 "/>
<text text-anchor="middle" x="2047.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2049.5 2135.5,-2049.5 "/>
<text text-anchor="middle" x="2047.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2026.5 2135.5,-2026.5 "/>
<text text-anchor="middle" x="2047.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2003.5 2135.5,-2003.5 "/>
<text text-anchor="middle" x="2047.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1959.5,-1980.5 2135.5,-1980.5 "/>
<text text-anchor="middle" x="2047.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1959.5,-1957.5 2135.5,-1957.5 "/>
<text text-anchor="middle" x="2047.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="2135.5,-1934.5 2135.5,-2118.5 "/>
<text text-anchor="middle" x="2146" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node16" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1204,-1549C1204,-1549 1379,-1549 1379,-1549 1385,-1549 1391,-1555 1391,-1561 1391,-1561 1391,-1583 1391,-1583 1391,-1589 1385,-1595 1379,-1595 1379,-1595 1204,-1595 1204,-1595 1198,-1595 1192,-1589 1192,-1583 1192,-1583 1192,-1561 1192,-1561 1192,-1555 1198,-1549 1204,-1549"/>
<text text-anchor="middle" x="1215.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1239,-1549 1239,-1595 "/>
<text text-anchor="middle" x="1249.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1260,-1549 1260,-1595 "/>
<text text-anchor="middle" x="1315" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1260,-1572 1370,-1572 "/>
<text text-anchor="middle" x="1315" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1370,-1549 1370,-1595 "/>
<text text-anchor="middle" x="1380.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge20" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1952.7506,-1934.4238C1923.8404,-1867.7612 1875.9469,-1780.3367 1807.5,-1727 1688.0732,-1633.9377 1513.3816,-1596.5926 1401.0561,-1581.7113"/>
<polygon fill="#000000" stroke="#000000" points="1401.4246,-1578.2299 1391.0595,-1580.4243 1400.5307,-1585.1726 1401.4246,-1578.2299"/>
<text text-anchor="middle" x="1799.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- enrollment -->
<g id="node17" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2157,-1468.5C2157,-1468.5 2506,-1468.5 2506,-1468.5 2512,-1468.5 2518,-1474.5 2518,-1480.5 2518,-1480.5 2518,-1663.5 2518,-1663.5 2518,-1669.5 2512,-1675.5 2506,-1675.5 2506,-1675.5 2157,-1675.5 2157,-1675.5 2151,-1675.5 2145,-1669.5 2145,-1663.5 2145,-1663.5 2145,-1480.5 2145,-1480.5 2145,-1474.5 2151,-1468.5 2157,-1468.5"/>
<text text-anchor="middle" x="2192.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2240,-1468.5 2240,-1675.5 "/>
<text text-anchor="middle" x="2250.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2261,-1468.5 2261,-1675.5 "/>
<text text-anchor="middle" x="2379" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2261,-1652.5 2497,-1652.5 "/>
<text text-anchor="middle" x="2379" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2261,-1629.5 2497,-1629.5 "/>
<text text-anchor="middle" x="2379" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2261,-1606.5 2497,-1606.5 "/>
<text text-anchor="middle" x="2379" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2261,-1583.5 2497,-1583.5 "/>
<text text-anchor="middle" x="2379" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2261,-1560.5 2497,-1560.5 "/>
<text text-anchor="middle" x="2379" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2261,-1537.5 2497,-1537.5 "/>
<text text-anchor="middle" x="2379" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2261,-1514.5 2497,-1514.5 "/>
<text text-anchor="middle" x="2379" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2261,-1491.5 2497,-1491.5 "/>
<text text-anchor="middle" x="2379" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2497,-1468.5 2497,-1675.5 "/>
<text text-anchor="middle" x="2507.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge30" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2032.7839,-1934.3763C2065.7719,-1872.8067 2113.3707,-1791.5724 2165.5,-1727 2177.5221,-1712.1083 2190.953,-1697.2914 2204.8263,-1683.0563"/>
<polygon fill="#000000" stroke="#000000" points="2207.5841,-1685.2445 2212.1163,-1675.668 2202.6013,-1680.328 2207.5841,-1685.2445"/>
<text text-anchor="middle" x="2243.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- vital_signs -->
<g id="node2" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1141,-1865.5C1141,-1865.5 1428,-1865.5 1428,-1865.5 1434,-1865.5 1440,-1871.5 1440,-1877.5 1440,-1877.5 1440,-2175.5 1440,-2175.5 1440,-2181.5 1434,-2187.5 1428,-2187.5 1428,-2187.5 1141,-2187.5 1141,-2187.5 1135,-2187.5 1129,-2181.5 1129,-2175.5 1129,-2175.5 1129,-1877.5 1129,-1877.5 1129,-1871.5 1135,-1865.5 1141,-1865.5"/>
<text text-anchor="middle" x="1175.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1222,-1865.5 1222,-2187.5 "/>
<text text-anchor="middle" x="1232.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1243,-1865.5 1243,-2187.5 "/>
<text text-anchor="middle" x="1331" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1243,-2164.5 1419,-2164.5 "/>
<text text-anchor="middle" x="1331" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1243,-2141.5 1419,-2141.5 "/>
<text text-anchor="middle" x="1331" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1243,-2118.5 1419,-2118.5 "/>
<text text-anchor="middle" x="1331" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1243,-2095.5 1419,-2095.5 "/>
<text text-anchor="middle" x="1331" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1243,-2072.5 1419,-2072.5 "/>
<text text-anchor="middle" x="1331" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1243,-2049.5 1419,-2049.5 "/>
<text text-anchor="middle" x="1331" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1243,-2026.5 1419,-2026.5 "/>
<text text-anchor="middle" x="1331" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1243,-2003.5 1419,-2003.5 "/>
<text text-anchor="middle" x="1331" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1243,-1980.5 1419,-1980.5 "/>
<text text-anchor="middle" x="1331" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1243,-1957.5 1419,-1957.5 "/>
<text text-anchor="middle" x="1331" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1243,-1934.5 1419,-1934.5 "/>
<text text-anchor="middle" x="1331" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1243,-1911.5 1419,-1911.5 "/>
<text text-anchor="middle" x="1331" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1243,-1888.5 1419,-1888.5 "/>
<text text-anchor="middle" x="1331" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1419,-1865.5 1419,-2187.5 "/>
<text text-anchor="middle" x="1429.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge19" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1286.9827,-1865.3007C1288.4385,-1770.7762 1290.1515,-1659.5546 1290.9881,-1605.236"/>
<polygon fill="#000000" stroke="#000000" points="1294.4889,-1605.2056 1291.1434,-1595.1528 1287.4897,-1605.0977 1294.4889,-1605.2056"/>
<text text-anchor="middle" x="1316.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study_arm -->
<g id="node3" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1612,-403.5C1612,-403.5 1981,-403.5 1981,-403.5 1987,-403.5 1993,-409.5 1993,-415.5 1993,-415.5 1993,-460.5 1993,-460.5 1993,-466.5 1987,-472.5 1981,-472.5 1981,-472.5 1612,-472.5 1612,-472.5 1606,-472.5 1600,-466.5 1600,-460.5 1600,-460.5 1600,-415.5 1600,-415.5 1600,-409.5 1606,-403.5 1612,-403.5"/>
<text text-anchor="middle" x="1646" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1692,-403.5 1692,-472.5 "/>
<text text-anchor="middle" x="1702.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1713,-403.5 1713,-472.5 "/>
<text text-anchor="middle" x="1842.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1713,-449.5 1972,-449.5 "/>
<text text-anchor="middle" x="1842.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="1713,-426.5 1972,-426.5 "/>
<text text-anchor="middle" x="1842.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1972,-403.5 1972,-472.5 "/>
<text text-anchor="middle" x="1982.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node5" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M2397.5,-190.5C2397.5,-190.5 2677.5,-190.5 2677.5,-190.5 2683.5,-190.5 2689.5,-196.5 2689.5,-202.5 2689.5,-202.5 2689.5,-339.5 2689.5,-339.5 2689.5,-345.5 2683.5,-351.5 2677.5,-351.5 2677.5,-351.5 2397.5,-351.5 2397.5,-351.5 2391.5,-351.5 2385.5,-345.5 2385.5,-339.5 2385.5,-339.5 2385.5,-202.5 2385.5,-202.5 2385.5,-196.5 2391.5,-190.5 2397.5,-190.5"/>
<text text-anchor="middle" x="2413.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="2441.5,-190.5 2441.5,-351.5 "/>
<text text-anchor="middle" x="2452" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2462.5,-190.5 2462.5,-351.5 "/>
<text text-anchor="middle" x="2565.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="2462.5,-328.5 2668.5,-328.5 "/>
<text text-anchor="middle" x="2565.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="2462.5,-305.5 2668.5,-305.5 "/>
<text text-anchor="middle" x="2565.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2462.5,-282.5 2668.5,-282.5 "/>
<text text-anchor="middle" x="2565.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="2462.5,-259.5 2668.5,-259.5 "/>
<text text-anchor="middle" x="2565.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="2462.5,-236.5 2668.5,-236.5 "/>
<text text-anchor="middle" x="2565.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2462.5,-213.5 2668.5,-213.5 "/>
<text text-anchor="middle" x="2565.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="2668.5,-190.5 2668.5,-351.5 "/>
<text text-anchor="middle" x="2679" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge15" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1949.5862,-403.4988C2073.9085,-375.4801 2248.7712,-336.0711 2375.4452,-307.5225"/>
<polygon fill="#000000" stroke="#000000" points="2376.2599,-310.9267 2385.2457,-305.3137 2374.7208,-304.098 2376.2599,-310.9267"/>
<text text-anchor="middle" x="2119" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- image -->
<g id="node4" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1495.5,-2836C1495.5,-2836 1531.5,-2836 1531.5,-2836 1537.5,-2836 1543.5,-2842 1543.5,-2848 1543.5,-2848 1543.5,-2860 1543.5,-2860 1543.5,-2866 1537.5,-2872 1531.5,-2872 1531.5,-2872 1495.5,-2872 1495.5,-2872 1489.5,-2872 1483.5,-2866 1483.5,-2860 1483.5,-2860 1483.5,-2848 1483.5,-2848 1483.5,-2842 1489.5,-2836 1495.5,-2836"/>
<text text-anchor="middle" x="1513.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node27" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1497.5,-2662.5C1497.5,-2662.5 1529.5,-2662.5 1529.5,-2662.5 1535.5,-2662.5 1541.5,-2668.5 1541.5,-2674.5 1541.5,-2674.5 1541.5,-2686.5 1541.5,-2686.5 1541.5,-2692.5 1535.5,-2698.5 1529.5,-2698.5 1529.5,-2698.5 1497.5,-2698.5 1497.5,-2698.5 1491.5,-2698.5 1485.5,-2692.5 1485.5,-2686.5 1485.5,-2686.5 1485.5,-2674.5 1485.5,-2674.5 1485.5,-2668.5 1491.5,-2662.5 1497.5,-2662.5"/>
<text text-anchor="middle" x="1513.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge5" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1513.5,-2835.7604C1513.5,-2805.5622 1513.5,-2744.9545 1513.5,-2709.0457"/>
<polygon fill="#000000" stroke="#000000" points="1517.0001,-2708.7555 1513.5,-2698.7556 1510.0001,-2708.7556 1517.0001,-2708.7555"/>
<text text-anchor="middle" x="1544" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- program -->
<g id="node20" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2383.5,-.5C2383.5,-.5 2691.5,-.5 2691.5,-.5 2697.5,-.5 2703.5,-6.5 2703.5,-12.5 2703.5,-12.5 2703.5,-126.5 2703.5,-126.5 2703.5,-132.5 2697.5,-138.5 2691.5,-138.5 2691.5,-138.5 2383.5,-138.5 2383.5,-138.5 2377.5,-138.5 2371.5,-132.5 2371.5,-126.5 2371.5,-126.5 2371.5,-12.5 2371.5,-12.5 2371.5,-6.5 2377.5,-.5 2383.5,-.5"/>
<text text-anchor="middle" x="2410.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="2449.5,-.5 2449.5,-138.5 "/>
<text text-anchor="middle" x="2460" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2470.5,-.5 2470.5,-138.5 "/>
<text text-anchor="middle" x="2576.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="2470.5,-115.5 2682.5,-115.5 "/>
<text text-anchor="middle" x="2576.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="2470.5,-92.5 2682.5,-92.5 "/>
<text text-anchor="middle" x="2576.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="2470.5,-69.5 2682.5,-69.5 "/>
<text text-anchor="middle" x="2576.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="2470.5,-46.5 2682.5,-46.5 "/>
<text text-anchor="middle" x="2576.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2470.5,-23.5 2682.5,-23.5 "/>
<text text-anchor="middle" x="2576.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="2682.5,-.5 2682.5,-138.5 "/>
<text text-anchor="middle" x="2693" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge14" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M2537.5,-190.4932C2537.5,-176.7786 2537.5,-162.5421 2537.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="2541.0001,-148.5183 2537.5,-138.5184 2534.0001,-148.5184 2541.0001,-148.5183"/>
<text text-anchor="middle" x="2578" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_site -->
<g id="node6" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M2118,-403.5C2118,-403.5 2435,-403.5 2435,-403.5 2441,-403.5 2447,-409.5 2447,-415.5 2447,-415.5 2447,-460.5 2447,-460.5 2447,-466.5 2441,-472.5 2435,-472.5 2435,-472.5 2118,-472.5 2118,-472.5 2112,-472.5 2106,-466.5 2106,-460.5 2106,-460.5 2106,-415.5 2106,-415.5 2106,-409.5 2112,-403.5 2118,-403.5"/>
<text text-anchor="middle" x="2151" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="2196,-403.5 2196,-472.5 "/>
<text text-anchor="middle" x="2206.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2217,-403.5 2217,-472.5 "/>
<text text-anchor="middle" x="2321.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2217,-449.5 2426,-449.5 "/>
<text text-anchor="middle" x="2321.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2217,-426.5 2426,-426.5 "/>
<text text-anchor="middle" x="2321.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2426,-403.5 2426,-472.5 "/>
<text text-anchor="middle" x="2436.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge2" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2330.5794,-403.3975C2351.842,-389.7927 2377.2836,-373.5139 2402.9349,-357.1011"/>
<polygon fill="#000000" stroke="#000000" points="2405.0994,-359.8713 2411.6363,-351.5335 2401.3266,-353.975 2405.0994,-359.8713"/>
<text text-anchor="middle" x="2406" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- adverse_event -->
<g id="node7" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1618,-622.5C1618,-622.5 2013,-622.5 2013,-622.5 2019,-622.5 2025,-628.5 2025,-634.5 2025,-634.5 2025,-1001.5 2025,-1001.5 2025,-1007.5 2019,-1013.5 2013,-1013.5 2013,-1013.5 1618,-1013.5 1618,-1013.5 1612,-1013.5 1606,-1007.5 1606,-1001.5 1606,-1001.5 1606,-634.5 1606,-634.5 1606,-628.5 1612,-622.5 1618,-622.5"/>
<text text-anchor="middle" x="1666" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1726,-622.5 1726,-1013.5 "/>
<text text-anchor="middle" x="1736.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1747,-622.5 1747,-1013.5 "/>
<text text-anchor="middle" x="1875.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1747,-990.5 2004,-990.5 "/>
<text text-anchor="middle" x="1875.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1747,-967.5 2004,-967.5 "/>
<text text-anchor="middle" x="1875.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1747,-944.5 2004,-944.5 "/>
<text text-anchor="middle" x="1875.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1747,-921.5 2004,-921.5 "/>
<text text-anchor="middle" x="1875.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1747,-898.5 2004,-898.5 "/>
<text text-anchor="middle" x="1875.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1747,-875.5 2004,-875.5 "/>
<text text-anchor="middle" x="1875.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1747,-852.5 2004,-852.5 "/>
<text text-anchor="middle" x="1875.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1747,-829.5 2004,-829.5 "/>
<text text-anchor="middle" x="1875.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1747,-806.5 2004,-806.5 "/>
<text text-anchor="middle" x="1875.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1747,-783.5 2004,-783.5 "/>
<text text-anchor="middle" x="1875.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1747,-760.5 2004,-760.5 "/>
<text text-anchor="middle" x="1875.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1747,-737.5 2004,-737.5 "/>
<text text-anchor="middle" x="1875.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1747,-714.5 2004,-714.5 "/>
<text text-anchor="middle" x="1875.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1747,-691.5 2004,-691.5 "/>
<text text-anchor="middle" x="1875.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1747,-668.5 2004,-668.5 "/>
<text text-anchor="middle" x="1875.5" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1747,-645.5 2004,-645.5 "/>
<text text-anchor="middle" x="1875.5" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="2004,-622.5 2004,-1013.5 "/>
<text text-anchor="middle" x="2014.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge7" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2025.2046,-845.2761C2036.376,-838.5862 2043,-829.4941 2043,-818 2043,-809.7386 2039.5781,-802.7181 2033.5052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="2035.3073,-793.9155 2025.2046,-790.7239 2031.1119,-799.519 2035.3073,-793.9155"/>
<text text-anchor="middle" x="2059" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- case -->
<g id="node9" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1947,-1065.5C1947,-1065.5 2166,-1065.5 2166,-1065.5 2172,-1065.5 2178,-1071.5 2178,-1077.5 2178,-1077.5 2178,-1145.5 2178,-1145.5 2178,-1151.5 2172,-1157.5 2166,-1157.5 2166,-1157.5 1947,-1157.5 1947,-1157.5 1941,-1157.5 1935,-1151.5 1935,-1145.5 1935,-1145.5 1935,-1077.5 1935,-1077.5 1935,-1071.5 1941,-1065.5 1947,-1065.5"/>
<text text-anchor="middle" x="1959.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1984,-1065.5 1984,-1157.5 "/>
<text text-anchor="middle" x="1994.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2005,-1065.5 2005,-1157.5 "/>
<text text-anchor="middle" x="2081" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="2005,-1134.5 2157,-1134.5 "/>
<text text-anchor="middle" x="2081" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="2005,-1111.5 2157,-1111.5 "/>
<text text-anchor="middle" x="2081" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2005,-1088.5 2157,-1088.5 "/>
<text text-anchor="middle" x="2081" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="2157,-1065.5 2157,-1157.5 "/>
<text text-anchor="middle" x="2167.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge38" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2020.8214,-1013.8123C2024.9067,-1019.8171 2028.8105,-1025.8835 2032.5,-1032 2036.8889,-1039.276 2040.529,-1047.4155 2043.5325,-1055.6353"/>
<polygon fill="#000000" stroke="#000000" points="2040.2688,-1056.9109 2046.7726,-1065.2746 2046.904,-1054.6806 2040.2688,-1056.9109"/>
<text text-anchor="middle" x="2066.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent -->
<g id="node21" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1316.5,-524.5C1316.5,-524.5 1542.5,-524.5 1542.5,-524.5 1548.5,-524.5 1554.5,-530.5 1554.5,-536.5 1554.5,-536.5 1554.5,-558.5 1554.5,-558.5 1554.5,-564.5 1548.5,-570.5 1542.5,-570.5 1542.5,-570.5 1316.5,-570.5 1316.5,-570.5 1310.5,-570.5 1304.5,-564.5 1304.5,-558.5 1304.5,-558.5 1304.5,-536.5 1304.5,-536.5 1304.5,-530.5 1310.5,-524.5 1316.5,-524.5"/>
<text text-anchor="middle" x="1333" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1361.5,-524.5 1361.5,-570.5 "/>
<text text-anchor="middle" x="1372" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1382.5,-524.5 1382.5,-570.5 "/>
<text text-anchor="middle" x="1458" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1382.5,-547.5 1533.5,-547.5 "/>
<text text-anchor="middle" x="1458" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1533.5,-524.5 1533.5,-570.5 "/>
<text text-anchor="middle" x="1544" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge42" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1605.8127,-631.5476C1601.0443,-628.2781 1596.2703,-625.0909 1591.5,-622 1563.0174,-603.5446 1529.2187,-587.2329 1499.8813,-574.6135"/>
<polygon fill="#000000" stroke="#000000" points="1501.0983,-571.3279 1490.5253,-570.648 1498.3666,-577.7729 1501.0983,-571.3279"/>
<text text-anchor="middle" x="1588.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- diagnosis -->
<g id="node8" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2538,-2344.5C2538,-2344.5 2881,-2344.5 2881,-2344.5 2887,-2344.5 2893,-2350.5 2893,-2356.5 2893,-2356.5 2893,-2631.5 2893,-2631.5 2893,-2637.5 2887,-2643.5 2881,-2643.5 2881,-2643.5 2538,-2643.5 2538,-2643.5 2532,-2643.5 2526,-2637.5 2526,-2631.5 2526,-2631.5 2526,-2356.5 2526,-2356.5 2526,-2350.5 2532,-2344.5 2538,-2344.5"/>
<text text-anchor="middle" x="2568" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2610,-2344.5 2610,-2643.5 "/>
<text text-anchor="middle" x="2620.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2631,-2344.5 2631,-2643.5 "/>
<text text-anchor="middle" x="2751.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2631,-2620.5 2872,-2620.5 "/>
<text text-anchor="middle" x="2751.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2631,-2597.5 2872,-2597.5 "/>
<text text-anchor="middle" x="2751.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2631,-2574.5 2872,-2574.5 "/>
<text text-anchor="middle" x="2751.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2631,-2551.5 2872,-2551.5 "/>
<text text-anchor="middle" x="2751.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2631,-2528.5 2872,-2528.5 "/>
<text text-anchor="middle" x="2751.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2631,-2505.5 2872,-2505.5 "/>
<text text-anchor="middle" x="2751.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2631,-2482.5 2872,-2482.5 "/>
<text text-anchor="middle" x="2751.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2631,-2459.5 2872,-2459.5 "/>
<text text-anchor="middle" x="2751.5" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2631,-2436.5 2872,-2436.5 "/>
<text text-anchor="middle" x="2751.5" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2631,-2413.5 2872,-2413.5 "/>
<text text-anchor="middle" x="2751.5" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2631,-2390.5 2872,-2390.5 "/>
<text text-anchor="middle" x="2751.5" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2631,-2367.5 2872,-2367.5 "/>
<text text-anchor="middle" x="2751.5" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2872,-2344.5 2872,-2643.5 "/>
<text text-anchor="middle" x="2882.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge40" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2893.0972,-2446.9273C3000.187,-2415.3483 3120.2138,-2371.3615 3151.5,-2326 3189.2877,-2271.212 3182.8172,-1785.7271 3151.5,-1727 3054.2879,-1544.7044 2566.2352,-1297.3847 2379.5,-1209 2318.9409,-1180.3365 2248.0159,-1157.8225 2188.0778,-1141.6851"/>
<polygon fill="#000000" stroke="#000000" points="2188.7371,-1138.2388 2178.1733,-1139.0493 2186.9368,-1145.0034 2188.7371,-1138.2388"/>
<text text-anchor="middle" x="3141.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge17" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2178.2117,-1105.0223C2314.0286,-1095.0686 2521.582,-1070.8007 2573.5,-1014 2632.5467,-949.4002 2592.5,-905.5195 2592.5,-818 2592.5,-818 2592.5,-818 2592.5,-438 2592.5,-412.3996 2586.5971,-385.6495 2578.6589,-361.2505"/>
<polygon fill="#000000" stroke="#000000" points="2581.9329,-360.0069 2575.3991,-351.6666 2575.3058,-362.261 2581.9329,-360.0069"/>
<text text-anchor="middle" x="2633" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge31" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1934.9786,-1076.9282C1920.0283,-1068.8914 1905.995,-1059.0449 1894.5,-1047 1887.2388,-1039.3915 1880.6424,-1031.0841 1874.6502,-1022.2872"/>
<polygon fill="#000000" stroke="#000000" points="1877.4657,-1020.1959 1869.0883,-1013.7098 1871.5924,-1024.0045 1877.4657,-1020.1959"/>
<text text-anchor="middle" x="1963.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- off_treatment -->
<g id="node12" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M2105,-726C2105,-726 2552,-726 2552,-726 2558,-726 2564,-732 2564,-738 2564,-738 2564,-898 2564,-898 2564,-904 2558,-910 2552,-910 2552,-910 2105,-910 2105,-910 2099,-910 2093,-904 2093,-898 2093,-898 2093,-738 2093,-738 2093,-732 2099,-726 2105,-726"/>
<text text-anchor="middle" x="2150.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="2208,-726 2208,-910 "/>
<text text-anchor="middle" x="2218.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2229,-726 2229,-910 "/>
<text text-anchor="middle" x="2386" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2229,-887 2543,-887 "/>
<text text-anchor="middle" x="2386" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2229,-864 2543,-864 "/>
<text text-anchor="middle" x="2386" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2229,-841 2543,-841 "/>
<text text-anchor="middle" x="2386" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2229,-818 2543,-818 "/>
<text text-anchor="middle" x="2386" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2229,-795 2543,-795 "/>
<text text-anchor="middle" x="2386" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2229,-772 2543,-772 "/>
<text text-anchor="middle" x="2386" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2229,-749 2543,-749 "/>
<text text-anchor="middle" x="2386" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2543,-726 2543,-910 "/>
<text text-anchor="middle" x="2553.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge26" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M2099.2992,-1065.3178C2135.8709,-1025.8553 2189.7676,-967.6983 2236.1093,-917.6936"/>
<polygon fill="#000000" stroke="#000000" points="2238.9528,-919.7744 2243.1831,-910.0607 2233.8186,-915.0163 2238.9528,-919.7744"/>
<text text-anchor="middle" x="2199.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- off_study -->
<g id="node19" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2633,-714.5C2633,-714.5 3048,-714.5 3048,-714.5 3054,-714.5 3060,-720.5 3060,-726.5 3060,-726.5 3060,-909.5 3060,-909.5 3060,-915.5 3054,-921.5 3048,-921.5 3048,-921.5 2633,-921.5 2633,-921.5 2627,-921.5 2621,-915.5 2621,-909.5 2621,-909.5 2621,-726.5 2621,-726.5 2621,-720.5 2627,-714.5 2633,-714.5"/>
<text text-anchor="middle" x="2662.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2704,-714.5 2704,-921.5 "/>
<text text-anchor="middle" x="2714.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2725,-714.5 2725,-921.5 "/>
<text text-anchor="middle" x="2882" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2725,-898.5 3039,-898.5 "/>
<text text-anchor="middle" x="2882" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2725,-875.5 3039,-875.5 "/>
<text text-anchor="middle" x="2882" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2725,-852.5 3039,-852.5 "/>
<text text-anchor="middle" x="2882" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2725,-829.5 3039,-829.5 "/>
<text text-anchor="middle" x="2882" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2725,-806.5 3039,-806.5 "/>
<text text-anchor="middle" x="2882" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2725,-783.5 3039,-783.5 "/>
<text text-anchor="middle" x="2882" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2725,-760.5 3039,-760.5 "/>
<text text-anchor="middle" x="2882" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2725,-737.5 3039,-737.5 "/>
<text text-anchor="middle" x="2882" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="3039,-714.5 3039,-921.5 "/>
<text text-anchor="middle" x="3049.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge1" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M2178.1844,-1106.3651C2316.6632,-1098.9364 2533.1423,-1082.0448 2606.5,-1047 2663.3485,-1019.8421 2714.8351,-973.2736 2754.9463,-929.1935"/>
<polygon fill="#000000" stroke="#000000" points="2757.7133,-931.3506 2761.7923,-921.5724 2752.5059,-926.6727 2757.7133,-931.3506"/>
<text text-anchor="middle" x="2684" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- cohort -->
<g id="node25" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M1680,-524.5C1680,-524.5 1913,-524.5 1913,-524.5 1919,-524.5 1925,-530.5 1925,-536.5 1925,-536.5 1925,-558.5 1925,-558.5 1925,-564.5 1919,-570.5 1913,-570.5 1913,-570.5 1680,-570.5 1680,-570.5 1674,-570.5 1668,-564.5 1668,-558.5 1668,-558.5 1668,-536.5 1668,-536.5 1668,-530.5 1674,-524.5 1680,-524.5"/>
<text text-anchor="middle" x="1699.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="1731,-524.5 1731,-570.5 "/>
<text text-anchor="middle" x="1741.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1752,-524.5 1752,-570.5 "/>
<text text-anchor="middle" x="1828" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1752,-547.5 1904,-547.5 "/>
<text text-anchor="middle" x="1828" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="1904,-524.5 1904,-570.5 "/>
<text text-anchor="middle" x="1914.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge16" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1934.7104,-1107.0633C1792.1215,-1099.0088 1568.7286,-1076.5033 1516.5,-1014 1404.7858,-880.3088 1410.3191,-760.1268 1516.5,-622 1534.7592,-598.2473 1596.6491,-580.4692 1657.6131,-568.2483"/>
<polygon fill="#000000" stroke="#000000" points="1658.6368,-571.6144 1667.7784,-566.2589 1657.2924,-564.7447 1658.6368,-571.6144"/>
<text text-anchor="middle" x="1557" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- agent_administration -->
<g id="node10" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M527,-1785C527,-1785 996,-1785 996,-1785 1002,-1785 1008,-1791 1008,-1797 1008,-1797 1008,-2256 1008,-2256 1008,-2262 1002,-2268 996,-2268 996,-2268 527,-2268 527,-2268 521,-2268 515,-2262 515,-2256 515,-2256 515,-1797 515,-1797 515,-1791 521,-1785 527,-1785"/>
<text text-anchor="middle" x="600" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="685,-1785 685,-2268 "/>
<text text-anchor="middle" x="695.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="706,-1785 706,-2268 "/>
<text text-anchor="middle" x="846.5" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="706,-2245 987,-2245 "/>
<text text-anchor="middle" x="846.5" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="706,-2222 987,-2222 "/>
<text text-anchor="middle" x="846.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="706,-2199 987,-2199 "/>
<text text-anchor="middle" x="846.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="706,-2176 987,-2176 "/>
<text text-anchor="middle" x="846.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="706,-2153 987,-2153 "/>
<text text-anchor="middle" x="846.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="706,-2130 987,-2130 "/>
<text text-anchor="middle" x="846.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="706,-2107 987,-2107 "/>
<text text-anchor="middle" x="846.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="706,-2084 987,-2084 "/>
<text text-anchor="middle" x="846.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="706,-2061 987,-2061 "/>
<text text-anchor="middle" x="846.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="706,-2038 987,-2038 "/>
<text text-anchor="middle" x="846.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="706,-2015 987,-2015 "/>
<text text-anchor="middle" x="846.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="706,-1992 987,-1992 "/>
<text text-anchor="middle" x="846.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="706,-1969 987,-1969 "/>
<text text-anchor="middle" x="846.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="706,-1946 987,-1946 "/>
<text text-anchor="middle" x="846.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="706,-1923 987,-1923 "/>
<text text-anchor="middle" x="846.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="706,-1900 987,-1900 "/>
<text text-anchor="middle" x="846.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="706,-1877 987,-1877 "/>
<text text-anchor="middle" x="846.5" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="706,-1854 987,-1854 "/>
<text text-anchor="middle" x="846.5" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="706,-1831 987,-1831 "/>
<text text-anchor="middle" x="846.5" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="706,-1808 987,-1808 "/>
<text text-anchor="middle" x="846.5" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="987,-1785 987,-2268 "/>
<text text-anchor="middle" x="997.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge18" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M955.1868,-1784.9671C975.3606,-1764.4723 996.2763,-1744.805 1017.5,-1727 1039.6321,-1708.4329 1048.4492,-1708.3883 1073.5,-1694 1130.4993,-1661.2616 1196.4163,-1624.5268 1240.714,-1600.0022"/>
<polygon fill="#000000" stroke="#000000" points="1242.496,-1603.0163 1249.5517,-1595.1126 1239.1072,-1596.8913 1242.496,-1603.0163"/>
<text text-anchor="middle" x="1101.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge41" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M797.2722,-1784.9544C804.7919,-1716.2978 810.5,-1641.3439 810.5,-1572 810.5,-1572 810.5,-1572 810.5,-818 810.5,-709.1565 1135.9174,-615.9437 1314.8567,-572.9158"/>
<polygon fill="#000000" stroke="#000000" points="1315.9323,-576.2574 1324.8453,-570.5294 1314.3057,-569.449 1315.9323,-576.2574"/>
<text text-anchor="middle" x="841.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- demographic -->
<g id="node11" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M2837.5,-1232.5C2837.5,-1232.5 3173.5,-1232.5 3173.5,-1232.5 3179.5,-1232.5 3185.5,-1238.5 3185.5,-1244.5 3185.5,-1244.5 3185.5,-1381.5 3185.5,-1381.5 3185.5,-1387.5 3179.5,-1393.5 3173.5,-1393.5 3173.5,-1393.5 2837.5,-1393.5 2837.5,-1393.5 2831.5,-1393.5 2825.5,-1387.5 2825.5,-1381.5 2825.5,-1381.5 2825.5,-1244.5 2825.5,-1244.5 2825.5,-1238.5 2831.5,-1232.5 2837.5,-1232.5"/>
<text text-anchor="middle" x="2880.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2935.5,-1232.5 2935.5,-1393.5 "/>
<text text-anchor="middle" x="2946" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2956.5,-1232.5 2956.5,-1393.5 "/>
<text text-anchor="middle" x="3060.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2956.5,-1370.5 3164.5,-1370.5 "/>
<text text-anchor="middle" x="3060.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2956.5,-1347.5 3164.5,-1347.5 "/>
<text text-anchor="middle" x="3060.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2956.5,-1324.5 3164.5,-1324.5 "/>
<text text-anchor="middle" x="3060.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2956.5,-1301.5 3164.5,-1301.5 "/>
<text text-anchor="middle" x="3060.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2956.5,-1278.5 3164.5,-1278.5 "/>
<text text-anchor="middle" x="3060.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="2956.5,-1255.5 3164.5,-1255.5 "/>
<text text-anchor="middle" x="3060.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="3164.5,-1232.5 3164.5,-1393.5 "/>
<text text-anchor="middle" x="3175" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge34" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2912.5288,-1232.3801C2882.2102,-1210.3613 2847.1332,-1189.0089 2811.5,-1176 2700.4707,-1135.4655 2373.3189,-1120.0563 2188.1546,-1114.4715"/>
<polygon fill="#000000" stroke="#000000" points="2188.1799,-1110.9708 2178.0806,-1114.1731 2187.9726,-1117.9677 2188.1799,-1110.9708"/>
<text text-anchor="middle" x="2867.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- disease_extent -->
<g id="node13" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M1470.5,-1877C1470.5,-1877 1786.5,-1877 1786.5,-1877 1792.5,-1877 1798.5,-1883 1798.5,-1889 1798.5,-1889 1798.5,-2164 1798.5,-2164 1798.5,-2170 1792.5,-2176 1786.5,-2176 1786.5,-2176 1470.5,-2176 1470.5,-2176 1464.5,-2176 1458.5,-2170 1458.5,-2164 1458.5,-2164 1458.5,-1889 1458.5,-1889 1458.5,-1883 1464.5,-1877 1470.5,-1877"/>
<text text-anchor="middle" x="1520" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1581.5,-1877 1581.5,-2176 "/>
<text text-anchor="middle" x="1592" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1602.5,-1877 1602.5,-2176 "/>
<text text-anchor="middle" x="1690" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1602.5,-2153 1777.5,-2153 "/>
<text text-anchor="middle" x="1690" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1602.5,-2130 1777.5,-2130 "/>
<text text-anchor="middle" x="1690" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1602.5,-2107 1777.5,-2107 "/>
<text text-anchor="middle" x="1690" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1602.5,-2084 1777.5,-2084 "/>
<text text-anchor="middle" x="1690" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1602.5,-2061 1777.5,-2061 "/>
<text text-anchor="middle" x="1690" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1602.5,-2038 1777.5,-2038 "/>
<text text-anchor="middle" x="1690" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1602.5,-2015 1777.5,-2015 "/>
<text text-anchor="middle" x="1690" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1602.5,-1992 1777.5,-1992 "/>
<text text-anchor="middle" x="1690" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1602.5,-1969 1777.5,-1969 "/>
<text text-anchor="middle" x="1690" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1602.5,-1946 1777.5,-1946 "/>
<text text-anchor="middle" x="1690" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1602.5,-1923 1777.5,-1923 "/>
<text text-anchor="middle" x="1690" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1602.5,-1900 1777.5,-1900 "/>
<text text-anchor="middle" x="1690" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1777.5,-1877 1777.5,-2176 "/>
<text text-anchor="middle" x="1788" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge21" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1549.18,-1876.8446C1520.343,-1827.3522 1485.8423,-1773.171 1449.5,-1727 1411.9851,-1679.3393 1360.6645,-1631.5249 1326.8253,-1601.8659"/>
<polygon fill="#000000" stroke="#000000" points="1328.8815,-1599.0156 1319.0399,-1595.0922 1324.2868,-1604.2966 1328.8815,-1599.0156"/>
<text text-anchor="middle" x="1461.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample -->
<g id="node14" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M12,-1796.5C12,-1796.5 435,-1796.5 435,-1796.5 441,-1796.5 447,-1802.5 447,-1808.5 447,-1808.5 447,-2244.5 447,-2244.5 447,-2250.5 441,-2256.5 435,-2256.5 435,-2256.5 12,-2256.5 12,-2256.5 6,-2256.5 0,-2250.5 0,-2244.5 0,-2244.5 0,-1808.5 0,-1808.5 0,-1802.5 6,-1796.5 12,-1796.5"/>
<text text-anchor="middle" x="34" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="68,-1796.5 68,-2256.5 "/>
<text text-anchor="middle" x="78.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="89,-1796.5 89,-2256.5 "/>
<text text-anchor="middle" x="257.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="89,-2233.5 426,-2233.5 "/>
<text text-anchor="middle" x="257.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-2210.5 426,-2210.5 "/>
<text text-anchor="middle" x="257.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-2187.5 426,-2187.5 "/>
<text text-anchor="middle" x="257.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="89,-2164.5 426,-2164.5 "/>
<text text-anchor="middle" x="257.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="89,-2141.5 426,-2141.5 "/>
<text text-anchor="middle" x="257.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-2118.5 426,-2118.5 "/>
<text text-anchor="middle" x="257.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-2095.5 426,-2095.5 "/>
<text text-anchor="middle" x="257.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="89,-2072.5 426,-2072.5 "/>
<text text-anchor="middle" x="257.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="89,-2049.5 426,-2049.5 "/>
<text text-anchor="middle" x="257.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="89,-2026.5 426,-2026.5 "/>
<text text-anchor="middle" x="257.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="89,-2003.5 426,-2003.5 "/>
<text text-anchor="middle" x="257.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="89,-1980.5 426,-1980.5 "/>
<text text-anchor="middle" x="257.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="89,-1957.5 426,-1957.5 "/>
<text text-anchor="middle" x="257.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="89,-1934.5 426,-1934.5 "/>
<text text-anchor="middle" x="257.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="89,-1911.5 426,-1911.5 "/>
<text text-anchor="middle" x="257.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="89,-1888.5 426,-1888.5 "/>
<text text-anchor="middle" x="257.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-1865.5 426,-1865.5 "/>
<text text-anchor="middle" x="257.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="89,-1842.5 426,-1842.5 "/>
<text text-anchor="middle" x="257.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="89,-1819.5 426,-1819.5 "/>
<text text-anchor="middle" x="257.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="426,-1796.5 426,-2256.5 "/>
<text text-anchor="middle" x="436.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge35" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M436.2423,-1796.3704C459.3298,-1772.6582 482.7146,-1749.1555 505.5,-1727 814.8245,-1426.2268 917.2352,-1345.5594 1326.5,-1209 1434.5264,-1172.9548 1745.6673,-1139.8648 1924.9525,-1123.0697"/>
<polygon fill="#000000" stroke="#000000" points="1925.3455,-1126.5483 1934.9772,-1122.1347 1924.6954,-1119.5786 1925.3455,-1126.5483"/>
<text text-anchor="middle" x="863.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge9" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M447.0955,-2065.8333C458.3572,-2056.0642 465,-2042.9531 465,-2026.5 465,-2013.9031 461.1061,-2003.2652 454.2267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="456.5485,-1991.9513 447.0955,-1987.1667 451.5016,-1996.802 456.5485,-1991.9513"/>
<text text-anchor="middle" x="481" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge23" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M404.16,-1796.3096C435.1361,-1768.9494 469.1674,-1744.5548 505.5,-1727 548.0718,-1706.4306 670.8195,-1716.5092 717.5,-1709 890.8019,-1681.122 1089.2331,-1629.1964 1201.5356,-1597.8978"/>
<polygon fill="#000000" stroke="#000000" points="1202.7772,-1601.185 1211.4654,-1595.1215 1200.8923,-1594.4435 1202.7772,-1601.185"/>
<text text-anchor="middle" x="824.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- file -->
<g id="node15" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2036,-2750.5C2036,-2750.5 2221,-2750.5 2221,-2750.5 2227,-2750.5 2233,-2756.5 2233,-2762.5 2233,-2762.5 2233,-2945.5 2233,-2945.5 2233,-2951.5 2227,-2957.5 2221,-2957.5 2221,-2957.5 2036,-2957.5 2036,-2957.5 2030,-2957.5 2024,-2951.5 2024,-2945.5 2024,-2945.5 2024,-2762.5 2024,-2762.5 2024,-2756.5 2030,-2750.5 2036,-2750.5"/>
<text text-anchor="middle" x="2043.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2063,-2750.5 2063,-2957.5 "/>
<text text-anchor="middle" x="2073.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2084,-2750.5 2084,-2957.5 "/>
<text text-anchor="middle" x="2148" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2084,-2934.5 2212,-2934.5 "/>
<text text-anchor="middle" x="2148" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2084,-2911.5 2212,-2911.5 "/>
<text text-anchor="middle" x="2148" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2084,-2888.5 2212,-2888.5 "/>
<text text-anchor="middle" x="2148" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="2084,-2865.5 2212,-2865.5 "/>
<text text-anchor="middle" x="2148" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2084,-2842.5 2212,-2842.5 "/>
<text text-anchor="middle" x="2148" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2084,-2819.5 2212,-2819.5 "/>
<text text-anchor="middle" x="2148" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2084,-2796.5 2212,-2796.5 "/>
<text text-anchor="middle" x="2148" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2084,-2773.5 2212,-2773.5 "/>
<text text-anchor="middle" x="2148" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2212,-2750.5 2212,-2957.5 "/>
<text text-anchor="middle" x="2222.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge4" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2233.0268,-2848.1843C2504.9576,-2831.6658 3213.5,-2779.1593 3213.5,-2680.5 3213.5,-2680.5 3213.5,-2680.5 3213.5,-438 3213.5,-332.5662 2899.6583,-293.279 2699.6585,-278.947"/>
<polygon fill="#000000" stroke="#000000" points="2699.8496,-275.4519 2689.6289,-278.2423 2699.3589,-282.4347 2699.8496,-275.4519"/>
<text text-anchor="middle" x="3244" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge27" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2233.0422,-2789.2234C2312.0087,-2740.2941 2422.6014,-2671.7685 2517.3617,-2613.053"/>
<polygon fill="#000000" stroke="#000000" points="2519.24,-2616.0066 2525.897,-2607.7643 2515.553,-2610.0563 2519.24,-2616.0066"/>
<text text-anchor="middle" x="2399" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge24" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2023.8982,-2751.0986C1890.2337,-2627.3926 1645.5873,-2426.1828 1391.5,-2344 1297.8139,-2313.6979 595.4913,-2365.961 505.5,-2326 470.7476,-2310.5681 438.2529,-2288.6004 408.5799,-2263.483"/>
<polygon fill="#000000" stroke="#000000" points="410.5503,-2260.5603 400.693,-2256.6764 405.9768,-2265.8597 410.5503,-2260.5603"/>
<text text-anchor="middle" x="1998" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge6" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2023.8253,-2824.4698C1884.1909,-2785.077 1643.8353,-2717.2694 1551.318,-2691.169"/>
<polygon fill="#000000" stroke="#000000" points="1552.1243,-2687.7599 1541.5496,-2688.4132 1550.2237,-2694.4969 1552.1243,-2687.7599"/>
<text text-anchor="middle" x="1725" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge37" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1295.1941,-1548.6479C1306.8802,-1483.1252 1349.451,-1296.6358 1466.5,-1209 1537.027,-1156.1957 1773.3739,-1130.5522 1924.6667,-1119.2652"/>
<polygon fill="#000000" stroke="#000000" points="1925.2408,-1122.7326 1934.9577,-1118.5098 1924.7283,-1115.7514 1925.2408,-1122.7326"/>
<text text-anchor="middle" x="1493.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge8" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1349.5376,-1595.0098C1380.6529,-1598.9199 1409,-1591.25 1409,-1572 1409,-1554.8555 1386.5147,-1546.8964 1359.6145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="1359.2006,-1544.6454 1349.5376,-1548.9902 1359.801,-1551.6196 1359.2006,-1544.6454"/>
<text text-anchor="middle" x="1425" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle -->
<g id="node18" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1541.5,-1278.5C1541.5,-1278.5 1769.5,-1278.5 1769.5,-1278.5 1775.5,-1278.5 1781.5,-1284.5 1781.5,-1290.5 1781.5,-1290.5 1781.5,-1335.5 1781.5,-1335.5 1781.5,-1341.5 1775.5,-1347.5 1769.5,-1347.5 1769.5,-1347.5 1541.5,-1347.5 1541.5,-1347.5 1535.5,-1347.5 1529.5,-1341.5 1529.5,-1335.5 1529.5,-1335.5 1529.5,-1290.5 1529.5,-1290.5 1529.5,-1284.5 1535.5,-1278.5 1541.5,-1278.5"/>
<text text-anchor="middle" x="1556.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1583.5,-1278.5 1583.5,-1347.5 "/>
<text text-anchor="middle" x="1594" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1604.5,-1278.5 1604.5,-1347.5 "/>
<text text-anchor="middle" x="1682.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1604.5,-1324.5 1760.5,-1324.5 "/>
<text text-anchor="middle" x="1682.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1604.5,-1301.5 1760.5,-1301.5 "/>
<text text-anchor="middle" x="1682.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1760.5,-1278.5 1760.5,-1347.5 "/>
<text text-anchor="middle" x="1771" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge32" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1324.1229,-1548.7875C1386.0814,-1504.7017 1521.4705,-1408.3671 1598.6478,-1353.4525"/>
<polygon fill="#000000" stroke="#000000" points="1600.7272,-1356.2686 1606.846,-1347.6192 1596.6689,-1350.565 1600.7272,-1356.2686"/>
<text text-anchor="middle" x="1503" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge36" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2328.8968,-1468.21C2321.9827,-1389.6705 2301.4469,-1283.0489 2243.5,-1209 2228.428,-1189.7399 2208.49,-1173.8927 2187.2515,-1160.9886"/>
<polygon fill="#000000" stroke="#000000" points="2188.808,-1157.8445 2178.4081,-1155.8213 2185.2765,-1163.8884 2188.808,-1157.8445"/>
<text text-anchor="middle" x="2348.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge39" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1724.4344,-1278.3609C1788.1062,-1246.3662 1883.4711,-1198.4459 1955.6905,-1162.1562"/>
<polygon fill="#000000" stroke="#000000" points="1957.4617,-1165.1832 1964.8256,-1157.5658 1954.3187,-1158.9285 1957.4617,-1165.1832"/>
<text text-anchor="middle" x="1953.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge43" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1506.8828,-524.4117C1554.4961,-510.2055 1616.6321,-491.6663 1671.1366,-475.4041"/>
<polygon fill="#000000" stroke="#000000" points="1672.285,-478.714 1680.8669,-472.5009 1670.2836,-472.0062 1672.285,-478.714"/>
<text text-anchor="middle" x="1661" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- prior_surgery -->
<g id="node22" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2186.5,-1946C2186.5,-1946 2532.5,-1946 2532.5,-1946 2538.5,-1946 2544.5,-1952 2544.5,-1958 2544.5,-1958 2544.5,-2095 2544.5,-2095 2544.5,-2101 2538.5,-2107 2532.5,-2107 2532.5,-2107 2186.5,-2107 2186.5,-2107 2180.5,-2107 2174.5,-2101 2174.5,-2095 2174.5,-2095 2174.5,-1958 2174.5,-1958 2174.5,-1952 2180.5,-1946 2186.5,-1946"/>
<text text-anchor="middle" x="2232" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2289.5,-1946 2289.5,-2107 "/>
<text text-anchor="middle" x="2300" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2310.5,-1946 2310.5,-2107 "/>
<text text-anchor="middle" x="2417" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2084 2523.5,-2084 "/>
<text text-anchor="middle" x="2417" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2061 2523.5,-2061 "/>
<text text-anchor="middle" x="2417" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2038 2523.5,-2038 "/>
<text text-anchor="middle" x="2417" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2015 2523.5,-2015 "/>
<text text-anchor="middle" x="2417" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1992 2523.5,-1992 "/>
<text text-anchor="middle" x="2417" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1969 2523.5,-1969 "/>
<text text-anchor="middle" x="2417" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2523.5,-1946 2523.5,-2107 "/>
<text text-anchor="middle" x="2534" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge29" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2354.5264,-1945.7682C2350.0731,-1873.4814 2343.4956,-1766.714 2338.5095,-1685.7784"/>
<polygon fill="#000000" stroke="#000000" points="2341.9871,-1685.3059 2337.8787,-1675.5401 2335.0003,-1685.7364 2341.9871,-1685.3059"/>
<text text-anchor="middle" x="2389.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge10" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M2544.613,-2068.5585C2555.7907,-2058.5547 2562.5,-2044.5352 2562.5,-2026.5 2562.5,-2012.5509 2558.4865,-2001.004 2551.4962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="2553.9806,-1989.3911 2544.613,-1984.4415 2548.8494,-1994.1525 2553.9806,-1989.3911"/>
<text text-anchor="middle" x="2578.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- lab_exam -->
<g id="node23" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1038.5,-2008.5C1038.5,-2008.5 1098.5,-2008.5 1098.5,-2008.5 1104.5,-2008.5 1110.5,-2014.5 1110.5,-2020.5 1110.5,-2020.5 1110.5,-2032.5 1110.5,-2032.5 1110.5,-2038.5 1104.5,-2044.5 1098.5,-2044.5 1098.5,-2044.5 1038.5,-2044.5 1038.5,-2044.5 1032.5,-2044.5 1026.5,-2038.5 1026.5,-2032.5 1026.5,-2032.5 1026.5,-2020.5 1026.5,-2020.5 1026.5,-2014.5 1032.5,-2008.5 1038.5,-2008.5"/>
<text text-anchor="middle" x="1068.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge22" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1067.6962,-2008.3013C1066.3354,-1959.4566 1067.8221,-1822.7031 1120.5,-1727 1150.0488,-1673.3169 1205.3199,-1628.4572 1245.035,-1601.0373"/>
<polygon fill="#000000" stroke="#000000" points="1247.4496,-1603.6287 1253.7611,-1595.119 1243.5205,-1597.8354 1247.4496,-1603.6287"/>
<text text-anchor="middle" x="1168.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- principal_investigator -->
<g id="node24" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M2633,-403.5C2633,-403.5 2960,-403.5 2960,-403.5 2966,-403.5 2972,-409.5 2972,-415.5 2972,-415.5 2972,-460.5 2972,-460.5 2972,-466.5 2966,-472.5 2960,-472.5 2960,-472.5 2633,-472.5 2633,-472.5 2627,-472.5 2621,-466.5 2621,-460.5 2621,-460.5 2621,-415.5 2621,-415.5 2621,-409.5 2627,-403.5 2633,-403.5"/>
<text text-anchor="middle" x="2708" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="2795,-403.5 2795,-472.5 "/>
<text text-anchor="middle" x="2805.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2816,-403.5 2816,-472.5 "/>
<text text-anchor="middle" x="2883.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="2816,-449.5 2951,-449.5 "/>
<text text-anchor="middle" x="2883.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="2816,-426.5 2951,-426.5 "/>
<text text-anchor="middle" x="2883.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="2951,-403.5 2951,-472.5 "/>
<text text-anchor="middle" x="2961.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge3" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2742.835,-403.3975C2721.7354,-389.7927 2696.4887,-373.5139 2671.034,-357.1011"/>
<polygon fill="#000000" stroke="#000000" points="2672.7003,-354.011 2662.3992,-351.5335 2668.9069,-359.8941 2672.7003,-354.011"/>
<text text-anchor="middle" x="2743" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge12" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1796.5,-524.2779C1796.5,-512.2547 1796.5,-497.1545 1796.5,-482.9615"/>
<polygon fill="#000000" stroke="#000000" points="1800.0001,-482.844 1796.5,-472.844 1793.0001,-482.844 1800.0001,-482.844"/>
<text text-anchor="middle" x="1837" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge13" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1925.1793,-540.0376C2105.2661,-528.5332 2415.1915,-504.4629 2456.5,-473 2475.6924,-458.382 2495.8929,-408.0827 2511.32,-361.3379"/>
<polygon fill="#000000" stroke="#000000" points="2514.677,-362.3323 2514.4386,-351.7401 2508.0196,-360.1691 2514.677,-362.3323"/>
<text text-anchor="middle" x="2536" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- follow_up -->
<g id="node26" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1890.5,-1209.5C1890.5,-1209.5 2222.5,-1209.5 2222.5,-1209.5 2228.5,-1209.5 2234.5,-1215.5 2234.5,-1221.5 2234.5,-1221.5 2234.5,-1404.5 2234.5,-1404.5 2234.5,-1410.5 2228.5,-1416.5 2222.5,-1416.5 2222.5,-1416.5 1890.5,-1416.5 1890.5,-1416.5 1884.5,-1416.5 1878.5,-1410.5 1878.5,-1404.5 1878.5,-1404.5 1878.5,-1221.5 1878.5,-1221.5 1878.5,-1215.5 1884.5,-1209.5 1890.5,-1209.5"/>
<text text-anchor="middle" x="1921" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1963.5,-1209.5 1963.5,-1416.5 "/>
<text text-anchor="middle" x="1974" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1984.5,-1209.5 1984.5,-1416.5 "/>
<text text-anchor="middle" x="2099" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1393.5 2213.5,-1393.5 "/>
<text text-anchor="middle" x="2099" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1370.5 2213.5,-1370.5 "/>
<text text-anchor="middle" x="2099" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1347.5 2213.5,-1347.5 "/>
<text text-anchor="middle" x="2099" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1324.5 2213.5,-1324.5 "/>
<text text-anchor="middle" x="2099" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1301.5 2213.5,-1301.5 "/>
<text text-anchor="middle" x="2099" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1278.5 2213.5,-1278.5 "/>
<text text-anchor="middle" x="2099" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1255.5 2213.5,-1255.5 "/>
<text text-anchor="middle" x="2099" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1984.5,-1232.5 2213.5,-1232.5 "/>
<text text-anchor="middle" x="2099" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2213.5,-1209.5 2213.5,-1416.5 "/>
<text text-anchor="middle" x="2224" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge33" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2056.5,-1209.2987C2056.5,-1194.9939 2056.5,-1180.7685 2056.5,-1167.7773"/>
<polygon fill="#000000" stroke="#000000" points="2060.0001,-1167.6452 2056.5,-1157.6452 2053.0001,-1167.6453 2060.0001,-1167.6452"/>
<text text-anchor="middle" x="2083.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge25" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1485.2737,-2675.6685C1360.9081,-2653.3884 852.6338,-2551.8616 505.5,-2326 477.7131,-2307.9205 450.7315,-2286.5507 425.1768,-2263.6782"/>
<polygon fill="#000000" stroke="#000000" points="427.4129,-2260.9813 417.6514,-2256.8626 422.7138,-2266.1697 427.4129,-2260.9813"/>
<text text-anchor="middle" x="1351" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- prior_therapy -->
<g id="node28" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2624.5,-1727.5C2624.5,-1727.5 3080.5,-1727.5 3080.5,-1727.5 3086.5,-1727.5 3092.5,-1733.5 3092.5,-1739.5 3092.5,-1739.5 3092.5,-2313.5 3092.5,-2313.5 3092.5,-2319.5 3086.5,-2325.5 3080.5,-2325.5 3080.5,-2325.5 2624.5,-2325.5 2624.5,-2325.5 2618.5,-2325.5 2612.5,-2319.5 2612.5,-2313.5 2612.5,-2313.5 2612.5,-1739.5 2612.5,-1739.5 2612.5,-1733.5 2618.5,-1727.5 2624.5,-1727.5"/>
<text text-anchor="middle" x="2670" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2727.5,-1727.5 2727.5,-2325.5 "/>
<text text-anchor="middle" x="2738" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2748.5,-1727.5 2748.5,-2325.5 "/>
<text text-anchor="middle" x="2910" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2302.5 3071.5,-2302.5 "/>
<text text-anchor="middle" x="2910" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2279.5 3071.5,-2279.5 "/>
<text text-anchor="middle" x="2910" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2256.5 3071.5,-2256.5 "/>
<text text-anchor="middle" x="2910" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2233.5 3071.5,-2233.5 "/>
<text text-anchor="middle" x="2910" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2210.5 3071.5,-2210.5 "/>
<text text-anchor="middle" x="2910" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2187.5 3071.5,-2187.5 "/>
<text text-anchor="middle" x="2910" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2164.5 3071.5,-2164.5 "/>
<text text-anchor="middle" x="2910" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2141.5 3071.5,-2141.5 "/>
<text text-anchor="middle" x="2910" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2118.5 3071.5,-2118.5 "/>
<text text-anchor="middle" x="2910" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2095.5 3071.5,-2095.5 "/>
<text text-anchor="middle" x="2910" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2072.5 3071.5,-2072.5 "/>
<text text-anchor="middle" x="2910" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2049.5 3071.5,-2049.5 "/>
<text text-anchor="middle" x="2910" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2026.5 3071.5,-2026.5 "/>
<text text-anchor="middle" x="2910" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2003.5 3071.5,-2003.5 "/>
<text text-anchor="middle" x="2910" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1980.5 3071.5,-1980.5 "/>
<text text-anchor="middle" x="2910" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1957.5 3071.5,-1957.5 "/>
<text text-anchor="middle" x="2910" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1934.5 3071.5,-1934.5 "/>
<text text-anchor="middle" x="2910" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1911.5 3071.5,-1911.5 "/>
<text text-anchor="middle" x="2910" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1888.5 3071.5,-1888.5 "/>
<text text-anchor="middle" x="2910" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1865.5 3071.5,-1865.5 "/>
<text text-anchor="middle" x="2910" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1842.5 3071.5,-1842.5 "/>
<text text-anchor="middle" x="2910" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1819.5 3071.5,-1819.5 "/>
<text text-anchor="middle" x="2910" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1796.5 3071.5,-1796.5 "/>
<text text-anchor="middle" x="2910" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1773.5 3071.5,-1773.5 "/>
<text text-anchor="middle" x="2910" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1750.5 3071.5,-1750.5 "/>
<text text-anchor="middle" x="2910" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="3071.5,-1727.5 3071.5,-2325.5 "/>
<text text-anchor="middle" x="3082" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge28" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2612.4137,-1734.6065C2609.4514,-1732.0341 2606.4798,-1729.4976 2603.5,-1727 2580.0082,-1707.31 2553.6662,-1688.773 2526.87,-1671.8365"/>
<polygon fill="#000000" stroke="#000000" points="2528.4927,-1668.7234 2518.157,-1666.3945 2524.7844,-1674.6605 2528.4927,-1668.7234"/>
<text text-anchor="middle" x="2626.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge11" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M3092.7384,-2064.6912C3103.9387,-2055.0507 3110.5,-2042.3203 3110.5,-2026.5 3110.5,-2014.3876 3106.6539,-2004.0864 3099.8244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="3102.219,-1993.0385 3092.7384,-1988.3088 3097.2002,-1997.9183 3102.219,-1993.0385"/>
<text text-anchor="middle" x="3126.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
</g>
</svg>
</div>
