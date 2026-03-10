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
<svg width="3461pt" height="3203pt"
 viewBox="0.00 0.00 3461.00 3203.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 3199)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-3199 3457,-3199 3457,4 -4,4"/>
<!-- study_arm -->
<g id="node1" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M772.5,-530C772.5,-530 1016.5,-530 1016.5,-530 1022.5,-530 1028.5,-536 1028.5,-542 1028.5,-542 1028.5,-610 1028.5,-610 1028.5,-616 1022.5,-622 1016.5,-622 1016.5,-622 772.5,-622 772.5,-622 766.5,-622 760.5,-616 760.5,-610 760.5,-610 760.5,-542 760.5,-542 760.5,-536 766.5,-530 772.5,-530"/>
<text text-anchor="middle" x="806.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="852.5,-530 852.5,-622 "/>
<text text-anchor="middle" x="863" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="873.5,-530 873.5,-622 "/>
<text text-anchor="middle" x="940.5" y="-606.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="873.5,-599 1007.5,-599 "/>
<text text-anchor="middle" x="940.5" y="-583.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="873.5,-576 1007.5,-576 "/>
<text text-anchor="middle" x="940.5" y="-560.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm_id</text>
<polyline fill="none" stroke="#000000" points="873.5,-553 1007.5,-553 "/>
<text text-anchor="middle" x="940.5" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1007.5,-530 1007.5,-622 "/>
<text text-anchor="middle" x="1018" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node24" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1769.5,-213.5C1769.5,-213.5 2049.5,-213.5 2049.5,-213.5 2055.5,-213.5 2061.5,-219.5 2061.5,-225.5 2061.5,-225.5 2061.5,-431.5 2061.5,-431.5 2061.5,-437.5 2055.5,-443.5 2049.5,-443.5 2049.5,-443.5 1769.5,-443.5 1769.5,-443.5 1763.5,-443.5 1757.5,-437.5 1757.5,-431.5 1757.5,-431.5 1757.5,-225.5 1757.5,-225.5 1757.5,-219.5 1763.5,-213.5 1769.5,-213.5"/>
<text text-anchor="middle" x="1785.5" y="-324.8" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="1813.5,-213.5 1813.5,-443.5 "/>
<text text-anchor="middle" x="1824" y="-324.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1834.5,-213.5 1834.5,-443.5 "/>
<text text-anchor="middle" x="1937.5" y="-428.3" font-family="Times,serif" font-size="14.00" fill="#000000">accession_id</text>
<polyline fill="none" stroke="#000000" points="1834.5,-420.5 2040.5,-420.5 "/>
<text text-anchor="middle" x="1937.5" y="-405.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="1834.5,-397.5 2040.5,-397.5 "/>
<text text-anchor="middle" x="1937.5" y="-382.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="1834.5,-374.5 2040.5,-374.5 "/>
<text text-anchor="middle" x="1937.5" y="-359.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="1834.5,-351.5 2040.5,-351.5 "/>
<text text-anchor="middle" x="1937.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="1834.5,-328.5 2040.5,-328.5 "/>
<text text-anchor="middle" x="1937.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="1834.5,-305.5 2040.5,-305.5 "/>
<text text-anchor="middle" x="1937.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1834.5,-282.5 2040.5,-282.5 "/>
<text text-anchor="middle" x="1937.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="1834.5,-259.5 2040.5,-259.5 "/>
<text text-anchor="middle" x="1937.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="1834.5,-236.5 2040.5,-236.5 "/>
<text text-anchor="middle" x="1937.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_disposition</text>
<polyline fill="none" stroke="#000000" points="2040.5,-213.5 2040.5,-443.5 "/>
<text text-anchor="middle" x="2051" y="-324.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge32" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M965.3976,-529.7968C987.7373,-516.9163 1012.9937,-504.0017 1037.5,-495 1276.0403,-407.3793 1569.038,-363.5576 1747.3901,-343.4631"/>
<polygon fill="#000000" stroke="#000000" points="1747.8311,-346.9358 1757.3815,-342.3488 1747.0551,-339.9789 1747.8311,-346.9358"/>
<text text-anchor="middle" x="1170" y="-465.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_site -->
<g id="node2" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M1059,-530C1059,-530 1376,-530 1376,-530 1382,-530 1388,-536 1388,-542 1388,-542 1388,-610 1388,-610 1388,-616 1382,-622 1376,-622 1376,-622 1059,-622 1059,-622 1053,-622 1047,-616 1047,-610 1047,-610 1047,-542 1047,-542 1047,-536 1053,-530 1059,-530"/>
<text text-anchor="middle" x="1092" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="1137,-530 1137,-622 "/>
<text text-anchor="middle" x="1147.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1158,-530 1158,-622 "/>
<text text-anchor="middle" x="1262.5" y="-606.8" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1158,-599 1367,-599 "/>
<text text-anchor="middle" x="1262.5" y="-583.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1158,-576 1367,-576 "/>
<text text-anchor="middle" x="1262.5" y="-560.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1158,-553 1367,-553 "/>
<text text-anchor="middle" x="1262.5" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1367,-530 1367,-622 "/>
<text text-anchor="middle" x="1377.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge18" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1259.9355,-529.9772C1284.0643,-506.3927 1316.0784,-479.1114 1349.5,-462 1474.737,-397.8803 1631.5735,-363.9105 1747.3877,-346.3209"/>
<polygon fill="#000000" stroke="#000000" points="1748.0346,-349.7632 1757.4078,-344.8243 1747.0005,-342.84 1748.0346,-349.7632"/>
<text text-anchor="middle" x="1380" y="-465.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- physical_exam -->
<g id="node3" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1150,-2510C1150,-2510 1487,-2510 1487,-2510 1493,-2510 1499,-2516 1499,-2522 1499,-2522 1499,-2705 1499,-2705 1499,-2711 1493,-2717 1487,-2717 1487,-2717 1150,-2717 1150,-2717 1144,-2717 1138,-2711 1138,-2705 1138,-2705 1138,-2522 1138,-2522 1138,-2516 1144,-2510 1150,-2510"/>
<text text-anchor="middle" x="1199" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1260,-2510 1260,-2717 "/>
<text text-anchor="middle" x="1270.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1281,-2510 1281,-2717 "/>
<text text-anchor="middle" x="1379.5" y="-2701.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1281,-2694 1478,-2694 "/>
<text text-anchor="middle" x="1379.5" y="-2678.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1281,-2671 1478,-2671 "/>
<text text-anchor="middle" x="1379.5" y="-2655.8" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1281,-2648 1478,-2648 "/>
<text text-anchor="middle" x="1379.5" y="-2632.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1281,-2625 1478,-2625 "/>
<text text-anchor="middle" x="1379.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1281,-2602 1478,-2602 "/>
<text text-anchor="middle" x="1379.5" y="-2586.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1281,-2579 1478,-2579 "/>
<text text-anchor="middle" x="1379.5" y="-2563.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1281,-2556 1478,-2556 "/>
<text text-anchor="middle" x="1379.5" y="-2540.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1281,-2533 1478,-2533 "/>
<text text-anchor="middle" x="1379.5" y="-2517.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_record_id</text>
<polyline fill="none" stroke="#000000" points="1478,-2510 1478,-2717 "/>
<text text-anchor="middle" x="1488.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment -->
<g id="node10" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M1527.5,-1724.5C1527.5,-1724.5 1849.5,-1724.5 1849.5,-1724.5 1855.5,-1724.5 1861.5,-1730.5 1861.5,-1736.5 1861.5,-1736.5 1861.5,-1919.5 1861.5,-1919.5 1861.5,-1925.5 1855.5,-1931.5 1849.5,-1931.5 1849.5,-1931.5 1527.5,-1931.5 1527.5,-1931.5 1521.5,-1931.5 1515.5,-1925.5 1515.5,-1919.5 1515.5,-1919.5 1515.5,-1736.5 1515.5,-1736.5 1515.5,-1730.5 1521.5,-1724.5 1527.5,-1724.5"/>
<text text-anchor="middle" x="1563" y="-1824.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="1610.5,-1724.5 1610.5,-1931.5 "/>
<text text-anchor="middle" x="1621" y="-1824.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1631.5,-1724.5 1631.5,-1931.5 "/>
<text text-anchor="middle" x="1736" y="-1916.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1631.5,-1908.5 1840.5,-1908.5 "/>
<text text-anchor="middle" x="1736" y="-1893.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="1631.5,-1885.5 1840.5,-1885.5 "/>
<text text-anchor="middle" x="1736" y="-1870.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="1631.5,-1862.5 1840.5,-1862.5 "/>
<text text-anchor="middle" x="1736" y="-1847.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_record_id</text>
<polyline fill="none" stroke="#000000" points="1631.5,-1839.5 1840.5,-1839.5 "/>
<text text-anchor="middle" x="1736" y="-1824.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="1631.5,-1816.5 1840.5,-1816.5 "/>
<text text-anchor="middle" x="1736" y="-1801.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="1631.5,-1793.5 1840.5,-1793.5 "/>
<text text-anchor="middle" x="1736" y="-1778.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1631.5,-1770.5 1840.5,-1770.5 "/>
<text text-anchor="middle" x="1736" y="-1755.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1631.5,-1747.5 1840.5,-1747.5 "/>
<text text-anchor="middle" x="1736" y="-1732.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1840.5,-1724.5 1840.5,-1931.5 "/>
<text text-anchor="middle" x="1851" y="-1824.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge40" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1349.578,-2509.7499C1392.3121,-2375.1325 1476.6913,-2135.5548 1587.5,-1950 1589.4473,-1946.7392 1591.4785,-1943.4751 1593.5788,-1940.2175"/>
<polygon fill="#000000" stroke="#000000" points="1596.6739,-1941.8835 1599.29,-1931.6167 1590.8425,-1938.0112 1596.6739,-1941.8835"/>
<text text-anchor="middle" x="1637.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- visit -->
<g id="node20" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M888.5,-1782C888.5,-1782 1076.5,-1782 1076.5,-1782 1082.5,-1782 1088.5,-1788 1088.5,-1794 1088.5,-1794 1088.5,-1862 1088.5,-1862 1088.5,-1868 1082.5,-1874 1076.5,-1874 1076.5,-1874 888.5,-1874 888.5,-1874 882.5,-1874 876.5,-1868 876.5,-1862 876.5,-1862 876.5,-1794 876.5,-1794 876.5,-1788 882.5,-1782 888.5,-1782"/>
<text text-anchor="middle" x="900" y="-1824.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="923.5,-1782 923.5,-1874 "/>
<text text-anchor="middle" x="934" y="-1824.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="944.5,-1782 944.5,-1874 "/>
<text text-anchor="middle" x="1006" y="-1858.8" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="944.5,-1851 1067.5,-1851 "/>
<text text-anchor="middle" x="1006" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="944.5,-1828 1067.5,-1828 "/>
<text text-anchor="middle" x="1006" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="944.5,-1805 1067.5,-1805 "/>
<text text-anchor="middle" x="1006" y="-1789.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_record_id</text>
<polyline fill="none" stroke="#000000" points="1067.5,-1782 1067.5,-1874 "/>
<text text-anchor="middle" x="1078" y="-1824.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge25" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1274.5958,-2509.9747C1219.1414,-2379.3508 1120.6667,-2147.8457 1035.5,-1950 1026.1171,-1928.2031 1015.727,-1904.2472 1006.6502,-1883.3777"/>
<polygon fill="#000000" stroke="#000000" points="1009.7799,-1881.7981 1002.5806,-1874.0251 1003.3613,-1884.5911 1009.7799,-1881.7981"/>
<text text-anchor="middle" x="1211.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- cohort -->
<g id="node4" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M1308,-982C1308,-982 1541,-982 1541,-982 1547,-982 1553,-988 1553,-994 1553,-994 1553,-1062 1553,-1062 1553,-1068 1547,-1074 1541,-1074 1541,-1074 1308,-1074 1308,-1074 1302,-1074 1296,-1068 1296,-1062 1296,-1062 1296,-994 1296,-994 1296,-988 1302,-982 1308,-982"/>
<text text-anchor="middle" x="1327.5" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="1359,-982 1359,-1074 "/>
<text text-anchor="middle" x="1369.5" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1380,-982 1380,-1074 "/>
<text text-anchor="middle" x="1456" y="-1058.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1380,-1051 1532,-1051 "/>
<text text-anchor="middle" x="1456" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="1380,-1028 1532,-1028 "/>
<text text-anchor="middle" x="1456" y="-1012.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_record_id</text>
<polyline fill="none" stroke="#000000" points="1380,-1005 1532,-1005 "/>
<text text-anchor="middle" x="1456" y="-989.8" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1532,-982 1532,-1074 "/>
<text text-anchor="middle" x="1542.5" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge31" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1381.4219,-981.8021C1314.493,-911.3268 1179.8446,-774.6556 1051.5,-675 1030.1727,-658.44 1005.9861,-642.114 983.0971,-627.6431"/>
<polygon fill="#000000" stroke="#000000" points="984.7292,-624.5354 974.3969,-622.1912 981.0122,-630.467 984.7292,-624.5354"/>
<text text-anchor="middle" x="1201" y="-717.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge30" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1418.7669,-981.7023C1405.5286,-866.7044 1378.0186,-571.8024 1433.5,-495 1471.4666,-442.4432 1624.8383,-394.9672 1747.3661,-364.2859"/>
<polygon fill="#000000" stroke="#000000" points="1748.3889,-367.6383 1757.25,-361.8304 1746.7011,-360.8448 1748.3889,-367.6383"/>
<text text-anchor="middle" x="1474" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- disease_extent -->
<g id="node5" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M767.5,-2452.5C767.5,-2452.5 1107.5,-2452.5 1107.5,-2452.5 1113.5,-2452.5 1119.5,-2458.5 1119.5,-2464.5 1119.5,-2464.5 1119.5,-2762.5 1119.5,-2762.5 1119.5,-2768.5 1113.5,-2774.5 1107.5,-2774.5 1107.5,-2774.5 767.5,-2774.5 767.5,-2774.5 761.5,-2774.5 755.5,-2768.5 755.5,-2762.5 755.5,-2762.5 755.5,-2464.5 755.5,-2464.5 755.5,-2458.5 761.5,-2452.5 767.5,-2452.5"/>
<text text-anchor="middle" x="817" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="878.5,-2452.5 878.5,-2774.5 "/>
<text text-anchor="middle" x="889" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="899.5,-2452.5 899.5,-2774.5 "/>
<text text-anchor="middle" x="999" y="-2759.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="899.5,-2751.5 1098.5,-2751.5 "/>
<text text-anchor="middle" x="999" y="-2736.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="899.5,-2728.5 1098.5,-2728.5 "/>
<text text-anchor="middle" x="999" y="-2713.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent_record_id</text>
<polyline fill="none" stroke="#000000" points="899.5,-2705.5 1098.5,-2705.5 "/>
<text text-anchor="middle" x="999" y="-2690.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="899.5,-2682.5 1098.5,-2682.5 "/>
<text text-anchor="middle" x="999" y="-2667.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="899.5,-2659.5 1098.5,-2659.5 "/>
<text text-anchor="middle" x="999" y="-2644.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="899.5,-2636.5 1098.5,-2636.5 "/>
<text text-anchor="middle" x="999" y="-2621.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="899.5,-2613.5 1098.5,-2613.5 "/>
<text text-anchor="middle" x="999" y="-2598.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="899.5,-2590.5 1098.5,-2590.5 "/>
<text text-anchor="middle" x="999" y="-2575.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="899.5,-2567.5 1098.5,-2567.5 "/>
<text text-anchor="middle" x="999" y="-2552.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="899.5,-2544.5 1098.5,-2544.5 "/>
<text text-anchor="middle" x="999" y="-2529.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="899.5,-2521.5 1098.5,-2521.5 "/>
<text text-anchor="middle" x="999" y="-2506.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="899.5,-2498.5 1098.5,-2498.5 "/>
<text text-anchor="middle" x="999" y="-2483.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="899.5,-2475.5 1098.5,-2475.5 "/>
<text text-anchor="middle" x="999" y="-2460.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1098.5,-2452.5 1098.5,-2774.5 "/>
<text text-anchor="middle" x="1109" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge26" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M946.7422,-2452.1718C956.8666,-2275.4449 972.5581,-2001.5409 979.273,-1884.3293"/>
<polygon fill="#000000" stroke="#000000" points="982.7783,-1884.3356 979.856,-1874.1518 975.7897,-1883.9352 982.7783,-1884.3356"/>
<text text-anchor="middle" x="1003.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- principal_investigator -->
<g id="node6" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M1536,-518.5C1536,-518.5 1869,-518.5 1869,-518.5 1875,-518.5 1881,-524.5 1881,-530.5 1881,-530.5 1881,-621.5 1881,-621.5 1881,-627.5 1875,-633.5 1869,-633.5 1869,-633.5 1536,-633.5 1536,-633.5 1530,-633.5 1524,-627.5 1524,-621.5 1524,-621.5 1524,-530.5 1524,-530.5 1524,-524.5 1530,-518.5 1536,-518.5"/>
<text text-anchor="middle" x="1611" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="1698,-518.5 1698,-633.5 "/>
<text text-anchor="middle" x="1708.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1719,-518.5 1719,-633.5 "/>
<text text-anchor="middle" x="1789.5" y="-618.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1719,-610.5 1860,-610.5 "/>
<text text-anchor="middle" x="1789.5" y="-595.3" font-family="Times,serif" font-size="14.00" fill="#000000">person_record_id</text>
<polyline fill="none" stroke="#000000" points="1719,-587.5 1860,-587.5 "/>
<text text-anchor="middle" x="1789.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="1719,-564.5 1860,-564.5 "/>
<text text-anchor="middle" x="1789.5" y="-549.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="1719,-541.5 1860,-541.5 "/>
<text text-anchor="middle" x="1789.5" y="-526.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="1860,-518.5 1860,-633.5 "/>
<text text-anchor="middle" x="1870.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge20" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1750.7711,-518.2846C1767.515,-498.2646 1786.9863,-474.9838 1806.437,-451.7275"/>
<polygon fill="#000000" stroke="#000000" points="1809.2977,-453.7626 1813.0285,-443.8463 1803.9282,-449.2717 1809.2977,-453.7626"/>
<text text-anchor="middle" x="1825" y="-465.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- cycle -->
<g id="node7" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M875.5,-1511.5C875.5,-1511.5 1103.5,-1511.5 1103.5,-1511.5 1109.5,-1511.5 1115.5,-1517.5 1115.5,-1523.5 1115.5,-1523.5 1115.5,-1614.5 1115.5,-1614.5 1115.5,-1620.5 1109.5,-1626.5 1103.5,-1626.5 1103.5,-1626.5 875.5,-1626.5 875.5,-1626.5 869.5,-1626.5 863.5,-1620.5 863.5,-1614.5 863.5,-1614.5 863.5,-1523.5 863.5,-1523.5 863.5,-1517.5 869.5,-1511.5 875.5,-1511.5"/>
<text text-anchor="middle" x="890.5" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="917.5,-1511.5 917.5,-1626.5 "/>
<text text-anchor="middle" x="928" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="938.5,-1511.5 938.5,-1626.5 "/>
<text text-anchor="middle" x="1016.5" y="-1611.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="938.5,-1603.5 1094.5,-1603.5 "/>
<text text-anchor="middle" x="1016.5" y="-1588.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="938.5,-1580.5 1094.5,-1580.5 "/>
<text text-anchor="middle" x="1016.5" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_record_id</text>
<polyline fill="none" stroke="#000000" points="938.5,-1557.5 1094.5,-1557.5 "/>
<text text-anchor="middle" x="1016.5" y="-1542.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="938.5,-1534.5 1094.5,-1534.5 "/>
<text text-anchor="middle" x="1016.5" y="-1519.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1094.5,-1511.5 1094.5,-1626.5 "/>
<text text-anchor="middle" x="1105" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node19" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1525,-1321.5C1525,-1321.5 1744,-1321.5 1744,-1321.5 1750,-1321.5 1756,-1327.5 1756,-1333.5 1756,-1333.5 1756,-1401.5 1756,-1401.5 1756,-1407.5 1750,-1413.5 1744,-1413.5 1744,-1413.5 1525,-1413.5 1525,-1413.5 1519,-1413.5 1513,-1407.5 1513,-1401.5 1513,-1401.5 1513,-1333.5 1513,-1333.5 1513,-1327.5 1519,-1321.5 1525,-1321.5"/>
<text text-anchor="middle" x="1537.5" y="-1363.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1562,-1321.5 1562,-1413.5 "/>
<text text-anchor="middle" x="1572.5" y="-1363.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1583,-1321.5 1583,-1413.5 "/>
<text text-anchor="middle" x="1659" y="-1398.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1583,-1390.5 1735,-1390.5 "/>
<text text-anchor="middle" x="1659" y="-1375.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1583,-1367.5 1735,-1367.5 "/>
<text text-anchor="middle" x="1659" y="-1352.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1583,-1344.5 1735,-1344.5 "/>
<text text-anchor="middle" x="1659" y="-1329.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1735,-1321.5 1735,-1413.5 "/>
<text text-anchor="middle" x="1745.5" y="-1363.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge6" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1021.5679,-1511.2398C1040.6365,-1482.5556 1067.5481,-1450.2175 1100.5,-1432 1167.4725,-1394.9742 1367.5721,-1378.9203 1502.8838,-1372.1612"/>
<polygon fill="#000000" stroke="#000000" points="1503.1002,-1375.6549 1512.9175,-1371.6711 1502.7586,-1368.6633 1503.1002,-1375.6549"/>
<text text-anchor="middle" x="1127.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node8" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M1966,-2314.5C1966,-2314.5 2411,-2314.5 2411,-2314.5 2417,-2314.5 2423,-2320.5 2423,-2326.5 2423,-2326.5 2423,-2900.5 2423,-2900.5 2423,-2906.5 2417,-2912.5 2411,-2912.5 2411,-2912.5 1966,-2912.5 1966,-2912.5 1960,-2912.5 1954,-2906.5 1954,-2900.5 1954,-2900.5 1954,-2326.5 1954,-2326.5 1954,-2320.5 1960,-2314.5 1966,-2314.5"/>
<text text-anchor="middle" x="2011.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2069,-2314.5 2069,-2912.5 "/>
<text text-anchor="middle" x="2079.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2090,-2314.5 2090,-2912.5 "/>
<text text-anchor="middle" x="2246" y="-2897.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2090,-2889.5 2402,-2889.5 "/>
<text text-anchor="middle" x="2246" y="-2874.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2090,-2866.5 2402,-2866.5 "/>
<text text-anchor="middle" x="2246" y="-2851.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2090,-2843.5 2402,-2843.5 "/>
<text text-anchor="middle" x="2246" y="-2828.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response_to_prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2090,-2820.5 2402,-2820.5 "/>
<text text-anchor="middle" x="2246" y="-2805.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="2090,-2797.5 2402,-2797.5 "/>
<text text-anchor="middle" x="2246" y="-2782.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2090,-2774.5 2402,-2774.5 "/>
<text text-anchor="middle" x="2246" y="-2759.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2090,-2751.5 2402,-2751.5 "/>
<text text-anchor="middle" x="2246" y="-2736.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2090,-2728.5 2402,-2728.5 "/>
<text text-anchor="middle" x="2246" y="-2713.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2090,-2705.5 2402,-2705.5 "/>
<text text-anchor="middle" x="2246" y="-2690.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2090,-2682.5 2402,-2682.5 "/>
<text text-anchor="middle" x="2246" y="-2667.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2090,-2659.5 2402,-2659.5 "/>
<text text-anchor="middle" x="2246" y="-2644.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2090,-2636.5 2402,-2636.5 "/>
<text text-anchor="middle" x="2246" y="-2621.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2090,-2613.5 2402,-2613.5 "/>
<text text-anchor="middle" x="2246" y="-2598.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2090,-2590.5 2402,-2590.5 "/>
<text text-anchor="middle" x="2246" y="-2575.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2090,-2567.5 2402,-2567.5 "/>
<text text-anchor="middle" x="2246" y="-2552.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2090,-2544.5 2402,-2544.5 "/>
<text text-anchor="middle" x="2246" y="-2529.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2090,-2521.5 2402,-2521.5 "/>
<text text-anchor="middle" x="2246" y="-2506.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2090,-2498.5 2402,-2498.5 "/>
<text text-anchor="middle" x="2246" y="-2483.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_record_id</text>
<polyline fill="none" stroke="#000000" points="2090,-2475.5 2402,-2475.5 "/>
<text text-anchor="middle" x="2246" y="-2460.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2090,-2452.5 2402,-2452.5 "/>
<text text-anchor="middle" x="2246" y="-2437.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2090,-2429.5 2402,-2429.5 "/>
<text text-anchor="middle" x="2246" y="-2414.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2090,-2406.5 2402,-2406.5 "/>
<text text-anchor="middle" x="2246" y="-2391.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2090,-2383.5 2402,-2383.5 "/>
<text text-anchor="middle" x="2246" y="-2368.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2090,-2360.5 2402,-2360.5 "/>
<text text-anchor="middle" x="2246" y="-2345.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2090,-2337.5 2402,-2337.5 "/>
<text text-anchor="middle" x="2246" y="-2322.3" font-family="Times,serif" font-size="14.00" fill="#000000">+ 3 properties</text>
<polyline fill="none" stroke="#000000" points="2402,-2314.5 2402,-2912.5 "/>
<text text-anchor="middle" x="2412.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge13" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M2423.2868,-2651.9795C2434.4495,-2642.305 2441,-2629.4785 2441,-2613.5 2441,-2601.2664 2437.1602,-2590.8805 2430.3506,-2582.3423"/>
<polygon fill="#000000" stroke="#000000" points="2432.7488,-2579.7872 2423.2868,-2575.0205 2427.7111,-2584.6474 2432.7488,-2579.7872"/>
<text text-anchor="middle" x="2457" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge39" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2017.5005,-2314.4216C1925.7181,-2155.117 1826.2325,-1984.8574 1800.5,-1950 1797.9545,-1946.5519 1795.3257,-1943.0917 1792.632,-1939.6325"/>
<polygon fill="#000000" stroke="#000000" points="1795.1934,-1937.2295 1786.2373,-1931.569 1789.7087,-1941.5791 1795.1934,-1937.2295"/>
<text text-anchor="middle" x="2053.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- file -->
<g id="node9" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1314,-2964.5C1314,-2964.5 1499,-2964.5 1499,-2964.5 1505,-2964.5 1511,-2970.5 1511,-2976.5 1511,-2976.5 1511,-3182.5 1511,-3182.5 1511,-3188.5 1505,-3194.5 1499,-3194.5 1499,-3194.5 1314,-3194.5 1314,-3194.5 1308,-3194.5 1302,-3188.5 1302,-3182.5 1302,-3182.5 1302,-2976.5 1302,-2976.5 1302,-2970.5 1308,-2964.5 1314,-2964.5"/>
<text text-anchor="middle" x="1321.5" y="-3075.8" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1341,-2964.5 1341,-3194.5 "/>
<text text-anchor="middle" x="1351.5" y="-3075.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1362,-2964.5 1362,-3194.5 "/>
<text text-anchor="middle" x="1426" y="-3179.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1362,-3171.5 1490,-3171.5 "/>
<text text-anchor="middle" x="1426" y="-3156.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1362,-3148.5 1490,-3148.5 "/>
<text text-anchor="middle" x="1426" y="-3133.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1362,-3125.5 1490,-3125.5 "/>
<text text-anchor="middle" x="1426" y="-3110.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="1362,-3102.5 1490,-3102.5 "/>
<text text-anchor="middle" x="1426" y="-3087.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1362,-3079.5 1490,-3079.5 "/>
<text text-anchor="middle" x="1426" y="-3064.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1362,-3056.5 1490,-3056.5 "/>
<text text-anchor="middle" x="1426" y="-3041.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1362,-3033.5 1490,-3033.5 "/>
<text text-anchor="middle" x="1426" y="-3018.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1362,-3010.5 1490,-3010.5 "/>
<text text-anchor="middle" x="1426" y="-2995.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1362,-2987.5 1490,-2987.5 "/>
<text text-anchor="middle" x="1426" y="-2972.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1490,-2964.5 1490,-3194.5 "/>
<text text-anchor="middle" x="1500.5" y="-3075.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis -->
<g id="node11" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2129,-1950.5C2129,-1950.5 2472,-1950.5 2472,-1950.5 2478,-1950.5 2484,-1956.5 2484,-1962.5 2484,-1962.5 2484,-2283.5 2484,-2283.5 2484,-2289.5 2478,-2295.5 2472,-2295.5 2472,-2295.5 2129,-2295.5 2129,-2295.5 2123,-2295.5 2117,-2289.5 2117,-2283.5 2117,-2283.5 2117,-1962.5 2117,-1962.5 2117,-1956.5 2123,-1950.5 2129,-1950.5"/>
<text text-anchor="middle" x="2159" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2201,-1950.5 2201,-2295.5 "/>
<text text-anchor="middle" x="2211.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2222,-1950.5 2222,-2295.5 "/>
<text text-anchor="middle" x="2342.5" y="-2280.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2222,-2272.5 2463,-2272.5 "/>
<text text-anchor="middle" x="2342.5" y="-2257.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2222,-2249.5 2463,-2249.5 "/>
<text text-anchor="middle" x="2342.5" y="-2234.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2222,-2226.5 2463,-2226.5 "/>
<text text-anchor="middle" x="2342.5" y="-2211.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="2222,-2203.5 2463,-2203.5 "/>
<text text-anchor="middle" x="2342.5" y="-2188.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2222,-2180.5 2463,-2180.5 "/>
<text text-anchor="middle" x="2342.5" y="-2165.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2222,-2157.5 2463,-2157.5 "/>
<text text-anchor="middle" x="2342.5" y="-2142.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis_record_id</text>
<polyline fill="none" stroke="#000000" points="2222,-2134.5 2463,-2134.5 "/>
<text text-anchor="middle" x="2342.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2222,-2111.5 2463,-2111.5 "/>
<text text-anchor="middle" x="2342.5" y="-2096.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2222,-2088.5 2463,-2088.5 "/>
<text text-anchor="middle" x="2342.5" y="-2073.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2222,-2065.5 2463,-2065.5 "/>
<text text-anchor="middle" x="2342.5" y="-2050.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2222,-2042.5 2463,-2042.5 "/>
<text text-anchor="middle" x="2342.5" y="-2027.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2222,-2019.5 2463,-2019.5 "/>
<text text-anchor="middle" x="2342.5" y="-2004.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2222,-1996.5 2463,-1996.5 "/>
<text text-anchor="middle" x="2342.5" y="-1981.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2222,-1973.5 2463,-1973.5 "/>
<text text-anchor="middle" x="2342.5" y="-1958.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2463,-1950.5 2463,-2295.5 "/>
<text text-anchor="middle" x="2473.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge22" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1511.1662,-2968.1148C1513.9096,-2966.6467 1516.6883,-2965.2714 1519.5,-2964 1568.266,-2941.9498 2444.6714,-2951.8328 2481.5,-2913 2573.0984,-2816.4169 2530.7823,-2437.652 2481.5,-2314 2480.2738,-2310.9233 2478.9718,-2307.8676 2477.5994,-2304.8344"/>
<polygon fill="#000000" stroke="#000000" points="2480.7508,-2303.3115 2473.2761,-2295.8028 2474.4369,-2306.3339 2480.7508,-2303.3115"/>
<text text-anchor="middle" x="2427" y="-2934.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- sample -->
<g id="node14" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M12,-2395C12,-2395 307,-2395 307,-2395 313,-2395 319,-2401 319,-2407 319,-2407 319,-2820 319,-2820 319,-2826 313,-2832 307,-2832 307,-2832 12,-2832 12,-2832 6,-2832 0,-2826 0,-2820 0,-2820 0,-2407 0,-2407 0,-2401 6,-2395 12,-2395"/>
<text text-anchor="middle" x="34" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="68,-2395 68,-2832 "/>
<text text-anchor="middle" x="78.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="89,-2395 89,-2832 "/>
<text text-anchor="middle" x="193.5" y="-2816.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="89,-2809 298,-2809 "/>
<text text-anchor="middle" x="193.5" y="-2793.8" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="89,-2786 298,-2786 "/>
<text text-anchor="middle" x="193.5" y="-2770.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="89,-2763 298,-2763 "/>
<text text-anchor="middle" x="193.5" y="-2747.8" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="89,-2740 298,-2740 "/>
<text text-anchor="middle" x="193.5" y="-2724.8" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-2717 298,-2717 "/>
<text text-anchor="middle" x="193.5" y="-2701.8" font-family="Times,serif" font-size="14.00" fill="#000000">molecular_subtype</text>
<polyline fill="none" stroke="#000000" points="89,-2694 298,-2694 "/>
<text text-anchor="middle" x="193.5" y="-2678.8" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="89,-2671 298,-2671 "/>
<text text-anchor="middle" x="193.5" y="-2655.8" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-2648 298,-2648 "/>
<text text-anchor="middle" x="193.5" y="-2632.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_sample_type</text>
<polyline fill="none" stroke="#000000" points="89,-2625 298,-2625 "/>
<text text-anchor="middle" x="193.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample_chronology</text>
<polyline fill="none" stroke="#000000" points="89,-2602 298,-2602 "/>
<text text-anchor="middle" x="193.5" y="-2586.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="89,-2579 298,-2579 "/>
<text text-anchor="middle" x="193.5" y="-2563.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample_preservation</text>
<polyline fill="none" stroke="#000000" points="89,-2556 298,-2556 "/>
<text text-anchor="middle" x="193.5" y="-2540.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="89,-2533 298,-2533 "/>
<text text-anchor="middle" x="193.5" y="-2517.8" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="89,-2510 298,-2510 "/>
<text text-anchor="middle" x="193.5" y="-2494.8" font-family="Times,serif" font-size="14.00" fill="#000000">summarized_sample_type</text>
<polyline fill="none" stroke="#000000" points="89,-2487 298,-2487 "/>
<text text-anchor="middle" x="193.5" y="-2471.8" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_grade</text>
<polyline fill="none" stroke="#000000" points="89,-2464 298,-2464 "/>
<text text-anchor="middle" x="193.5" y="-2448.8" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_sample_origin</text>
<polyline fill="none" stroke="#000000" points="89,-2441 298,-2441 "/>
<text text-anchor="middle" x="193.5" y="-2425.8" font-family="Times,serif" font-size="14.00" fill="#000000">volume_of_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-2418 298,-2418 "/>
<text text-anchor="middle" x="193.5" y="-2402.8" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="298,-2395 298,-2832 "/>
<text text-anchor="middle" x="308.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge37" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1301.823,-3072.5684C1043.2751,-3054.6339 389.6167,-3004.0323 310.5,-2946 274.0654,-2919.2751 246.2141,-2881.6597 224.9908,-2841.2889"/>
<polygon fill="#000000" stroke="#000000" points="228.0945,-2839.6708 220.4253,-2832.361 221.8622,-2842.8579 228.0945,-2839.6708"/>
<text text-anchor="middle" x="347" y="-2934.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;case -->
<g id="edge9" class="edge">
<title>file&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1301.8617,-3077.6651C1071.8113,-3071.2523 533.2159,-3042.4372 416.5,-2913 371.8402,-2863.4726 397.5,-2680.1893 397.5,-2613.5 397.5,-2613.5 397.5,-2613.5 397.5,-1569 397.5,-1457.978 1183.7485,-1395.9056 1502.5707,-1375.2991"/>
<polygon fill="#000000" stroke="#000000" points="1503.0349,-1378.7766 1512.7899,-1374.6425 1502.586,-1371.791 1503.0349,-1378.7766"/>
<text text-anchor="middle" x="424.5" y="-1824.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge17" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1511.1074,-2967.9816C1513.8686,-2966.554 1516.6669,-2965.2229 1519.5,-2964 1618.062,-2921.4563 2385.5483,-2985.1676 2485.5,-2946 2626.0093,-2890.9392 2561.5,-2669.2436 2561.5,-2613.5 2561.5,-2613.5 2561.5,-2613.5 2561.5,-576 2561.5,-471.4231 2264.6166,-395.284 2071.5181,-356.8218"/>
<polygon fill="#000000" stroke="#000000" points="2072.0311,-353.3556 2061.5422,-354.8498 2070.6736,-360.2227 2072.0311,-353.3556"/>
<text text-anchor="middle" x="2592" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge8" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1662.663,-1724.2045C1659.1179,-1707.1789 1655.8832,-1689.6586 1653.5,-1673 1641.1391,-1586.5972 1636.8183,-1485.3086 1635.309,-1423.8025"/>
<polygon fill="#000000" stroke="#000000" points="1638.802,-1423.4552 1635.0742,-1413.5379 1631.8039,-1423.6153 1638.802,-1423.4552"/>
<text text-anchor="middle" x="1680.5" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge7" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2278.7723,-1950.4476C2250.6959,-1800.5314 2187.2558,-1588.579 2045.5,-1465 2004.0317,-1428.849 1869.9987,-1401.5827 1766.1443,-1385.2042"/>
<polygon fill="#000000" stroke="#000000" points="1766.6119,-1381.7349 1756.1922,-1383.6533 1765.534,-1388.6515 1766.6119,-1381.7349"/>
<text text-anchor="middle" x="2235.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- canine_individual -->
<g id="node12" class="node">
<title>canine_individual</title>
<path fill="none" stroke="#000000" d="M2199,-1005C2199,-1005 2522,-1005 2522,-1005 2528,-1005 2534,-1011 2534,-1017 2534,-1017 2534,-1039 2534,-1039 2534,-1045 2528,-1051 2522,-1051 2522,-1051 2199,-1051 2199,-1051 2193,-1051 2187,-1045 2187,-1039 2187,-1039 2187,-1017 2187,-1017 2187,-1011 2193,-1005 2199,-1005"/>
<text text-anchor="middle" x="2258" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000">canine_individual</text>
<polyline fill="none" stroke="#000000" points="2329,-1005 2329,-1051 "/>
<text text-anchor="middle" x="2339.5" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2350,-1005 2350,-1051 "/>
<text text-anchor="middle" x="2431.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">canine_individual_id</text>
<polyline fill="none" stroke="#000000" points="2350,-1028 2513,-1028 "/>
<text text-anchor="middle" x="2431.5" y="-1012.8" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="2513,-1005 2513,-1051 "/>
<text text-anchor="middle" x="2523.5" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- biospecimen_source -->
<g id="node13" class="node">
<title>biospecimen_source</title>
<path fill="none" stroke="#000000" d="M1541,-3045C1541,-3045 1986,-3045 1986,-3045 1992,-3045 1998,-3051 1998,-3057 1998,-3057 1998,-3102 1998,-3102 1998,-3108 1992,-3114 1986,-3114 1986,-3114 1541,-3114 1541,-3114 1535,-3114 1529,-3108 1529,-3102 1529,-3102 1529,-3057 1529,-3057 1529,-3051 1535,-3045 1541,-3045"/>
<text text-anchor="middle" x="1610" y="-3075.8" font-family="Times,serif" font-size="14.00" fill="#000000">biospecimen_source</text>
<polyline fill="none" stroke="#000000" points="1691,-3045 1691,-3114 "/>
<text text-anchor="middle" x="1701.5" y="-3075.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1712,-3045 1712,-3114 "/>
<text text-anchor="middle" x="1844.5" y="-3098.8" font-family="Times,serif" font-size="14.00" fill="#000000">biospecimen_repository_acronym</text>
<polyline fill="none" stroke="#000000" points="1712,-3091 1977,-3091 "/>
<text text-anchor="middle" x="1844.5" y="-3075.8" font-family="Times,serif" font-size="14.00" fill="#000000">biospecimen_repository_full_name</text>
<polyline fill="none" stroke="#000000" points="1712,-3068 1977,-3068 "/>
<text text-anchor="middle" x="1844.5" y="-3052.8" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1977,-3045 1977,-3114 "/>
<text text-anchor="middle" x="1987.5" y="-3075.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge12" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M319.2452,-2657.6053C330.2813,-2647.5025 337,-2632.8008 337,-2613.5 337,-2598.5721 332.9808,-2586.3953 326.0535,-2576.9696"/>
<polygon fill="#000000" stroke="#000000" points="328.5331,-2574.4925 319.2452,-2569.3947 323.3269,-2579.1718 328.5331,-2574.4925"/>
<text text-anchor="middle" x="353" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge1" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M128.3192,-2394.9584C103.354,-2123.2815 109.4108,-1666.8165 383.5,-1432 425.4812,-1396.034 1190.143,-1376.5081 1502.8688,-1369.9983"/>
<polygon fill="#000000" stroke="#000000" points="1502.9695,-1373.497 1512.8949,-1369.7908 1502.8246,-1366.4985 1502.9695,-1373.497"/>
<text text-anchor="middle" x="227.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge24" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M281.0626,-2394.8485C370.3944,-2251.4356 503.6013,-2069.0955 662.5,-1950 722.913,-1904.7201 802.1256,-1874.3433 866.6239,-1855.2256"/>
<polygon fill="#000000" stroke="#000000" points="867.8125,-1858.5249 876.4361,-1852.3699 865.8564,-1851.8038 867.8125,-1858.5249"/>
<text text-anchor="middle" x="690.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- vital_signs -->
<g id="node15" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M438,-2452.5C438,-2452.5 725,-2452.5 725,-2452.5 731,-2452.5 737,-2458.5 737,-2464.5 737,-2464.5 737,-2762.5 737,-2762.5 737,-2768.5 731,-2774.5 725,-2774.5 725,-2774.5 438,-2774.5 438,-2774.5 432,-2774.5 426,-2768.5 426,-2762.5 426,-2762.5 426,-2464.5 426,-2464.5 426,-2458.5 432,-2452.5 438,-2452.5"/>
<text text-anchor="middle" x="472.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="519,-2452.5 519,-2774.5 "/>
<text text-anchor="middle" x="529.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="540,-2452.5 540,-2774.5 "/>
<text text-anchor="middle" x="628" y="-2759.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="540,-2751.5 716,-2751.5 "/>
<text text-anchor="middle" x="628" y="-2736.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="540,-2728.5 716,-2728.5 "/>
<text text-anchor="middle" x="628" y="-2713.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="540,-2705.5 716,-2705.5 "/>
<text text-anchor="middle" x="628" y="-2690.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="540,-2682.5 716,-2682.5 "/>
<text text-anchor="middle" x="628" y="-2667.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="540,-2659.5 716,-2659.5 "/>
<text text-anchor="middle" x="628" y="-2644.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="540,-2636.5 716,-2636.5 "/>
<text text-anchor="middle" x="628" y="-2621.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="540,-2613.5 716,-2613.5 "/>
<text text-anchor="middle" x="628" y="-2598.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="540,-2590.5 716,-2590.5 "/>
<text text-anchor="middle" x="628" y="-2575.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="540,-2567.5 716,-2567.5 "/>
<text text-anchor="middle" x="628" y="-2552.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="540,-2544.5 716,-2544.5 "/>
<text text-anchor="middle" x="628" y="-2529.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="540,-2521.5 716,-2521.5 "/>
<text text-anchor="middle" x="628" y="-2506.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="540,-2498.5 716,-2498.5 "/>
<text text-anchor="middle" x="628" y="-2483.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="540,-2475.5 716,-2475.5 "/>
<text text-anchor="middle" x="628" y="-2460.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs_record_id</text>
<polyline fill="none" stroke="#000000" points="716,-2452.5 716,-2774.5 "/>
<text text-anchor="middle" x="726.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge23" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M648.7327,-2452.4116C708.0081,-2315.566 799.7909,-2115.5741 896.5,-1950 909.8251,-1927.1863 926.1768,-1903.1939 941.031,-1882.58"/>
<polygon fill="#000000" stroke="#000000" points="944.0267,-1884.4113 947.0736,-1874.264 938.3638,-1880.2965 944.0267,-1884.4113"/>
<text text-anchor="middle" x="924.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- program -->
<g id="node16" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1755.5,-.5C1755.5,-.5 2063.5,-.5 2063.5,-.5 2069.5,-.5 2075.5,-6.5 2075.5,-12.5 2075.5,-12.5 2075.5,-149.5 2075.5,-149.5 2075.5,-155.5 2069.5,-161.5 2063.5,-161.5 2063.5,-161.5 1755.5,-161.5 1755.5,-161.5 1749.5,-161.5 1743.5,-155.5 1743.5,-149.5 1743.5,-149.5 1743.5,-12.5 1743.5,-12.5 1743.5,-6.5 1749.5,-.5 1755.5,-.5"/>
<text text-anchor="middle" x="1782.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="1821.5,-.5 1821.5,-161.5 "/>
<text text-anchor="middle" x="1832" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1842.5,-.5 1842.5,-161.5 "/>
<text text-anchor="middle" x="1948.5" y="-146.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1842.5,-138.5 2054.5,-138.5 "/>
<text text-anchor="middle" x="1948.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="1842.5,-115.5 2054.5,-115.5 "/>
<text text-anchor="middle" x="1948.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="1842.5,-92.5 2054.5,-92.5 "/>
<text text-anchor="middle" x="1948.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1842.5,-69.5 2054.5,-69.5 "/>
<text text-anchor="middle" x="1948.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="1842.5,-46.5 2054.5,-46.5 "/>
<text text-anchor="middle" x="1948.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="1842.5,-23.5 2054.5,-23.5 "/>
<text text-anchor="middle" x="1948.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="2054.5,-.5 2054.5,-161.5 "/>
<text text-anchor="middle" x="2065" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic -->
<g id="node17" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1260.5,-1465.5C1260.5,-1465.5 1596.5,-1465.5 1596.5,-1465.5 1602.5,-1465.5 1608.5,-1471.5 1608.5,-1477.5 1608.5,-1477.5 1608.5,-1660.5 1608.5,-1660.5 1608.5,-1666.5 1602.5,-1672.5 1596.5,-1672.5 1596.5,-1672.5 1260.5,-1672.5 1260.5,-1672.5 1254.5,-1672.5 1248.5,-1666.5 1248.5,-1660.5 1248.5,-1660.5 1248.5,-1477.5 1248.5,-1477.5 1248.5,-1471.5 1254.5,-1465.5 1260.5,-1465.5"/>
<text text-anchor="middle" x="1303.5" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1358.5,-1465.5 1358.5,-1672.5 "/>
<text text-anchor="middle" x="1369" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1379.5,-1465.5 1379.5,-1672.5 "/>
<text text-anchor="middle" x="1483.5" y="-1657.3" font-family="Times,serif" font-size="14.00" fill="#000000">additional_breed_detail</text>
<polyline fill="none" stroke="#000000" points="1379.5,-1649.5 1587.5,-1649.5 "/>
<text text-anchor="middle" x="1483.5" y="-1634.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1379.5,-1626.5 1587.5,-1626.5 "/>
<text text-anchor="middle" x="1483.5" y="-1611.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1379.5,-1603.5 1587.5,-1603.5 "/>
<text text-anchor="middle" x="1483.5" y="-1588.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1379.5,-1580.5 1587.5,-1580.5 "/>
<text text-anchor="middle" x="1483.5" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic_record_id</text>
<polyline fill="none" stroke="#000000" points="1379.5,-1557.5 1587.5,-1557.5 "/>
<text text-anchor="middle" x="1483.5" y="-1542.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1379.5,-1534.5 1587.5,-1534.5 "/>
<text text-anchor="middle" x="1483.5" y="-1519.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1379.5,-1511.5 1587.5,-1511.5 "/>
<text text-anchor="middle" x="1483.5" y="-1496.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1379.5,-1488.5 1587.5,-1488.5 "/>
<text text-anchor="middle" x="1483.5" y="-1473.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1587.5,-1465.5 1587.5,-1672.5 "/>
<text text-anchor="middle" x="1598" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge2" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1534.5172,-1465.2987C1550.2998,-1449.8608 1565.9879,-1434.5154 1580.0975,-1420.7141"/>
<polygon fill="#000000" stroke="#000000" points="1582.6229,-1423.1399 1587.3242,-1413.6452 1577.7281,-1418.1358 1582.6229,-1423.1399"/>
<text text-anchor="middle" x="1595.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event -->
<g id="node18" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1712,-786.5C1712,-786.5 2107,-786.5 2107,-786.5 2113,-786.5 2119,-792.5 2119,-798.5 2119,-798.5 2119,-1257.5 2119,-1257.5 2119,-1263.5 2113,-1269.5 2107,-1269.5 2107,-1269.5 1712,-1269.5 1712,-1269.5 1706,-1269.5 1700,-1263.5 1700,-1257.5 1700,-1257.5 1700,-798.5 1700,-798.5 1700,-792.5 1706,-786.5 1712,-786.5"/>
<text text-anchor="middle" x="1760" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1820,-786.5 1820,-1269.5 "/>
<text text-anchor="middle" x="1830.5" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1841,-786.5 1841,-1269.5 "/>
<text text-anchor="middle" x="1969.5" y="-1254.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_agent_dose</text>
<polyline fill="none" stroke="#000000" points="1841,-1246.5 2098,-1246.5 "/>
<text text-anchor="middle" x="1969.5" y="-1231.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_agent_name</text>
<polyline fill="none" stroke="#000000" points="1841,-1223.5 2098,-1223.5 "/>
<text text-anchor="middle" x="1969.5" y="-1208.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1841,-1200.5 2098,-1200.5 "/>
<text text-anchor="middle" x="1969.5" y="-1185.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1841,-1177.5 2098,-1177.5 "/>
<text text-anchor="middle" x="1969.5" y="-1162.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1841,-1154.5 2098,-1154.5 "/>
<text text-anchor="middle" x="1969.5" y="-1139.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_record_id</text>
<polyline fill="none" stroke="#000000" points="1841,-1131.5 2098,-1131.5 "/>
<text text-anchor="middle" x="1969.5" y="-1116.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1841,-1108.5 2098,-1108.5 "/>
<text text-anchor="middle" x="1969.5" y="-1093.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1841,-1085.5 2098,-1085.5 "/>
<text text-anchor="middle" x="1969.5" y="-1070.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1841,-1062.5 2098,-1062.5 "/>
<text text-anchor="middle" x="1969.5" y="-1047.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1841,-1039.5 2098,-1039.5 "/>
<text text-anchor="middle" x="1969.5" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1841,-1016.5 2098,-1016.5 "/>
<text text-anchor="middle" x="1969.5" y="-1001.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1841,-993.5 2098,-993.5 "/>
<text text-anchor="middle" x="1969.5" y="-978.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1841,-970.5 2098,-970.5 "/>
<text text-anchor="middle" x="1969.5" y="-955.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_onset</text>
<polyline fill="none" stroke="#000000" points="1841,-947.5 2098,-947.5 "/>
<text text-anchor="middle" x="1969.5" y="-932.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_resolution</text>
<polyline fill="none" stroke="#000000" points="1841,-924.5 2098,-924.5 "/>
<text text-anchor="middle" x="1969.5" y="-909.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1841,-901.5 2098,-901.5 "/>
<text text-anchor="middle" x="1969.5" y="-886.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1841,-878.5 2098,-878.5 "/>
<text text-anchor="middle" x="1969.5" y="-863.3" font-family="Times,serif" font-size="14.00" fill="#000000">existing_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1841,-855.5 2098,-855.5 "/>
<text text-anchor="middle" x="1969.5" y="-840.3" font-family="Times,serif" font-size="14.00" fill="#000000">ongoing_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1841,-832.5 2098,-832.5 "/>
<text text-anchor="middle" x="1969.5" y="-817.3" font-family="Times,serif" font-size="14.00" fill="#000000">other_attribution_description</text>
<polyline fill="none" stroke="#000000" points="1841,-809.5 2098,-809.5 "/>
<text text-anchor="middle" x="1969.5" y="-794.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="2098,-786.5 2098,-1269.5 "/>
<text text-anchor="middle" x="2108.5" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge14" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2119.2046,-1060.9793C2130.376,-1052.8906 2137,-1041.8975 2137,-1028 2137,-1017.7941 2133.4277,-1009.1544 2127.1053,-1002.0812"/>
<polygon fill="#000000" stroke="#000000" points="2128.9933,-999.0744 2119.2046,-995.0207 2124.3288,-1004.2939 2128.9933,-999.0744"/>
<text text-anchor="middle" x="2153" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge4" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1909.5807,-1269.753C1903.9957,-1281.6339 1897.0514,-1292.8302 1888.5,-1303 1871.7197,-1322.956 1819.0502,-1337.9718 1765.9916,-1348.4709"/>
<polygon fill="#000000" stroke="#000000" points="1765.2457,-1345.0501 1756.0885,-1350.3789 1766.5701,-1351.9237 1765.2457,-1345.0501"/>
<text text-anchor="middle" x="1924.5" y="-1291.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- case&#45;&gt;study_arm -->
<g id="edge27" class="edge">
<title>case&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1512.9045,-1353.5081C1398.5965,-1338.1565 1238.0159,-1310.2281 1189.5,-1270 985.4437,-1100.8017 919.6333,-765.1145 901.0342,-632.139"/>
<polygon fill="#000000" stroke="#000000" points="904.4934,-631.6012 899.6751,-622.1654 897.5575,-632.5464 904.4934,-631.6012"/>
<text text-anchor="middle" x="1238" y="-1024.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge33" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1557.44,-1321.2294C1550.9157,-1315.5748 1544.7986,-1309.4829 1539.5,-1303 1485.9427,-1237.4717 1453.8817,-1143.439 1437.7088,-1084.0623"/>
<polygon fill="#000000" stroke="#000000" points="1441.016,-1082.88 1435.0604,-1074.1175 1434.2518,-1084.6814 1441.016,-1082.88"/>
<text text-anchor="middle" x="1580" y="-1291.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;canine_individual -->
<g id="edge36" class="edge">
<title>case&#45;&gt;canine_individual</title>
<path fill="none" stroke="#000000" d="M1756.1152,-1356.0408C1893.9751,-1341.2672 2108.5241,-1312.3372 2177.5,-1270 2261.1781,-1218.6387 2320.0197,-1113.7736 2345.8302,-1060.5486"/>
<polygon fill="#000000" stroke="#000000" points="2349.1254,-1061.7693 2350.2637,-1051.2358 2342.805,-1058.7604 2349.1254,-1061.7693"/>
<text text-anchor="middle" x="2176.5" y="-1291.8" font-family="Times,serif" font-size="14.00" fill="#000000">represents</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge28" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1707.2865,-1321.1582C1714.4326,-1315.4109 1721.3161,-1309.3199 1727.5,-1303 1735.4745,-1294.8502 1743.3098,-1286.304 1750.9792,-1277.4725"/>
<polygon fill="#000000" stroke="#000000" points="1753.837,-1279.5158 1757.6756,-1269.6408 1748.5167,-1274.9667 1753.837,-1279.5158"/>
<text text-anchor="middle" x="1809.5" y="-1291.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- consent_group -->
<g id="node22" class="node">
<title>consent_group</title>
<path fill="none" stroke="#000000" d="M1773.5,-675.5C1773.5,-675.5 2111.5,-675.5 2111.5,-675.5 2117.5,-675.5 2123.5,-681.5 2123.5,-687.5 2123.5,-687.5 2123.5,-755.5 2123.5,-755.5 2123.5,-761.5 2117.5,-767.5 2111.5,-767.5 2111.5,-767.5 1773.5,-767.5 1773.5,-767.5 1767.5,-767.5 1761.5,-761.5 1761.5,-755.5 1761.5,-755.5 1761.5,-687.5 1761.5,-687.5 1761.5,-681.5 1767.5,-675.5 1773.5,-675.5"/>
<text text-anchor="middle" x="1822.5" y="-717.8" font-family="Times,serif" font-size="14.00" fill="#000000">consent_group</text>
<polyline fill="none" stroke="#000000" points="1883.5,-675.5 1883.5,-767.5 "/>
<text text-anchor="middle" x="1894" y="-717.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1904.5,-675.5 1904.5,-767.5 "/>
<text text-anchor="middle" x="2003.5" y="-752.3" font-family="Times,serif" font-size="14.00" fill="#000000">consent_group_name</text>
<polyline fill="none" stroke="#000000" points="1904.5,-744.5 2102.5,-744.5 "/>
<text text-anchor="middle" x="2003.5" y="-729.3" font-family="Times,serif" font-size="14.00" fill="#000000">consent_group_number</text>
<polyline fill="none" stroke="#000000" points="1904.5,-721.5 2102.5,-721.5 "/>
<text text-anchor="middle" x="2003.5" y="-706.3" font-family="Times,serif" font-size="14.00" fill="#000000">consent_group_record_id</text>
<polyline fill="none" stroke="#000000" points="1904.5,-698.5 2102.5,-698.5 "/>
<text text-anchor="middle" x="2003.5" y="-683.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="2102.5,-675.5 2102.5,-767.5 "/>
<text text-anchor="middle" x="2113" y="-717.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;consent_group -->
<g id="edge5" class="edge">
<title>case&#45;&gt;consent_group</title>
<path fill="none" stroke="#000000" d="M1645.2657,-1321.4811C1646.4854,-1315.2917 1647.6081,-1309.0072 1648.5,-1303 1656.9644,-1245.9913 1653.3431,-830.0568 1690.5,-786 1693.357,-782.6125 1718.1576,-775.2375 1751.1753,-766.6391"/>
<polygon fill="#000000" stroke="#000000" points="1752.3706,-769.9455 1761.1801,-764.0597 1750.623,-763.1671 1752.3706,-769.9455"/>
<text text-anchor="middle" x="1677.5" y="-1291.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge34" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1632.7989,-1321.3223C1629.781,-1222.6602 1625.7743,-984.1447 1648.5,-786 1654.2407,-735.9469 1633.7707,-708.3881 1671.5,-675 1707.9024,-642.7861 1855.5008,-691.7407 1889.5,-657 1917.2853,-628.6087 1920.7868,-534.14 1918.1875,-453.7536"/>
<polygon fill="#000000" stroke="#000000" points="1921.6769,-453.3914 1917.8219,-443.5228 1914.6814,-453.6415 1921.6769,-453.3914"/>
<text text-anchor="middle" x="1712" y="-717.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge29" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M983.7434,-1781.9944C984.8318,-1741.7218 986.4279,-1682.6687 987.6635,-1636.9513"/>
<polygon fill="#000000" stroke="#000000" points="991.1657,-1636.9121 987.9373,-1626.8212 984.1683,-1636.7229 991.1657,-1636.9121"/>
<text text-anchor="middle" x="1016" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge3" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1035.5943,-1781.6854C1065.4989,-1753.0453 1101.3751,-1714.0078 1124.5,-1673 1171.8208,-1589.085 1114.9895,-1530.6449 1185.5,-1465 1230.99,-1422.6491 1387.4726,-1395.7301 1502.9642,-1381.1484"/>
<polygon fill="#000000" stroke="#000000" points="1503.4632,-1384.6134 1512.9542,-1379.9048 1502.5984,-1377.667 1503.4632,-1384.6134"/>
<text text-anchor="middle" x="1212.5" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge15" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1088.7728,-1847.7285C1099.5926,-1843.8262 1106.5,-1837.25 1106.5,-1828 1106.5,-1821.7852 1103.3819,-1816.7773 1098.0541,-1812.9765"/>
<polygon fill="#000000" stroke="#000000" points="1099.2748,-1809.6713 1088.7728,-1808.2715 1096.1097,-1815.9149 1099.2748,-1809.6713"/>
<text text-anchor="middle" x="1122.5" y="-1824.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_surgery -->
<g id="node21" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M1528.5,-2521.5C1528.5,-2521.5 1874.5,-2521.5 1874.5,-2521.5 1880.5,-2521.5 1886.5,-2527.5 1886.5,-2533.5 1886.5,-2533.5 1886.5,-2693.5 1886.5,-2693.5 1886.5,-2699.5 1880.5,-2705.5 1874.5,-2705.5 1874.5,-2705.5 1528.5,-2705.5 1528.5,-2705.5 1522.5,-2705.5 1516.5,-2699.5 1516.5,-2693.5 1516.5,-2693.5 1516.5,-2533.5 1516.5,-2533.5 1516.5,-2527.5 1522.5,-2521.5 1528.5,-2521.5"/>
<text text-anchor="middle" x="1574" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="1631.5,-2521.5 1631.5,-2705.5 "/>
<text text-anchor="middle" x="1642" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1652.5,-2521.5 1652.5,-2705.5 "/>
<text text-anchor="middle" x="1759" y="-2690.3" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1652.5,-2682.5 1865.5,-2682.5 "/>
<text text-anchor="middle" x="1759" y="-2667.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1652.5,-2659.5 1865.5,-2659.5 "/>
<text text-anchor="middle" x="1759" y="-2644.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1652.5,-2636.5 1865.5,-2636.5 "/>
<text text-anchor="middle" x="1759" y="-2621.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery_record_id</text>
<polyline fill="none" stroke="#000000" points="1652.5,-2613.5 1865.5,-2613.5 "/>
<text text-anchor="middle" x="1759" y="-2598.3" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="1652.5,-2590.5 1865.5,-2590.5 "/>
<text text-anchor="middle" x="1759" y="-2575.3" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="1652.5,-2567.5 1865.5,-2567.5 "/>
<text text-anchor="middle" x="1759" y="-2552.3" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="1652.5,-2544.5 1865.5,-2544.5 "/>
<text text-anchor="middle" x="1759" y="-2529.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="1865.5,-2521.5 1865.5,-2705.5 "/>
<text text-anchor="middle" x="1876" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge38" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1699.9769,-2521.4699C1697.5904,-2377.2718 1692.9754,-2098.4203 1690.3838,-1941.8222"/>
<polygon fill="#000000" stroke="#000000" points="1693.8811,-1941.6275 1690.216,-1931.6868 1686.8821,-1941.7434 1693.8811,-1941.6275"/>
<text text-anchor="middle" x="1746.5" y="-2119.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge11" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M1886.613,-2655.5585C1897.7907,-2645.5547 1904.5,-2631.5352 1904.5,-2613.5 1904.5,-2599.5509 1900.4865,-2588.004 1893.4962,-2578.8593"/>
<polygon fill="#000000" stroke="#000000" points="1895.9806,-2576.3911 1886.613,-2571.4415 1890.8494,-2581.1525 1895.9806,-2576.3911"/>
<text text-anchor="middle" x="1920.5" y="-2609.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- consent_group&#45;&gt;study -->
<g id="edge21" class="edge">
<title>consent_group&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1939.5407,-675.0566C1936.1279,-623.106 1930.1291,-536.4663 1923.5,-462 1923.2566,-459.2653 1923.0059,-456.4995 1922.7491,-453.7114"/>
<polygon fill="#000000" stroke="#000000" points="1926.2132,-453.1635 1921.7951,-443.5339 1919.2437,-453.8169 1926.2132,-453.1635"/>
<text text-anchor="middle" x="2002" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_consent_group</text>
</g>
<!-- publication -->
<g id="node23" class="node">
<title>publication</title>
<path fill="none" stroke="#000000" d="M2601.5,-495.5C2601.5,-495.5 2873.5,-495.5 2873.5,-495.5 2879.5,-495.5 2885.5,-501.5 2885.5,-507.5 2885.5,-507.5 2885.5,-644.5 2885.5,-644.5 2885.5,-650.5 2879.5,-656.5 2873.5,-656.5 2873.5,-656.5 2601.5,-656.5 2601.5,-656.5 2595.5,-656.5 2589.5,-650.5 2589.5,-644.5 2589.5,-644.5 2589.5,-507.5 2589.5,-507.5 2589.5,-501.5 2595.5,-495.5 2601.5,-495.5"/>
<text text-anchor="middle" x="2638" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">publication</text>
<polyline fill="none" stroke="#000000" points="2686.5,-495.5 2686.5,-656.5 "/>
<text text-anchor="middle" x="2697" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2707.5,-495.5 2707.5,-656.5 "/>
<text text-anchor="middle" x="2786" y="-641.3" font-family="Times,serif" font-size="14.00" fill="#000000">authorship</text>
<polyline fill="none" stroke="#000000" points="2707.5,-633.5 2864.5,-633.5 "/>
<text text-anchor="middle" x="2786" y="-618.3" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="2707.5,-610.5 2864.5,-610.5 "/>
<text text-anchor="middle" x="2786" y="-595.3" font-family="Times,serif" font-size="14.00" fill="#000000">digital_object_id</text>
<polyline fill="none" stroke="#000000" points="2707.5,-587.5 2864.5,-587.5 "/>
<text text-anchor="middle" x="2786" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">journal_citation</text>
<polyline fill="none" stroke="#000000" points="2707.5,-564.5 2864.5,-564.5 "/>
<text text-anchor="middle" x="2786" y="-549.3" font-family="Times,serif" font-size="14.00" fill="#000000">publication_title</text>
<polyline fill="none" stroke="#000000" points="2707.5,-541.5 2864.5,-541.5 "/>
<text text-anchor="middle" x="2786" y="-526.3" font-family="Times,serif" font-size="14.00" fill="#000000">pubmed_id</text>
<polyline fill="none" stroke="#000000" points="2707.5,-518.5 2864.5,-518.5 "/>
<text text-anchor="middle" x="2786" y="-503.3" font-family="Times,serif" font-size="14.00" fill="#000000">year_of_publication</text>
<polyline fill="none" stroke="#000000" points="2864.5,-495.5 2864.5,-656.5 "/>
<text text-anchor="middle" x="2875" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- publication&#45;&gt;study -->
<g id="edge16" class="edge">
<title>publication&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2636.2747,-495.3322C2616.9112,-482.6883 2596.1991,-470.8864 2575.5,-462 2412.1694,-391.8801 2210.293,-358.0512 2071.8816,-342.0864"/>
<polygon fill="#000000" stroke="#000000" points="2071.942,-338.5709 2061.6112,-340.9211 2071.1528,-345.5262 2071.942,-338.5709"/>
<text text-anchor="middle" x="2635" y="-465.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge35" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M1909.5,-213.4448C1909.5,-199.4621 1909.5,-185.3307 1909.5,-171.7693"/>
<polygon fill="#000000" stroke="#000000" points="1913.0001,-171.5218 1909.5,-161.5218 1906.0001,-171.5219 1913.0001,-171.5218"/>
<text text-anchor="middle" x="1950" y="-183.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- registration -->
<g id="node25" class="node">
<title>registration</title>
<path fill="none" stroke="#000000" d="M1728.5,-1523C1728.5,-1523 2024.5,-1523 2024.5,-1523 2030.5,-1523 2036.5,-1529 2036.5,-1535 2036.5,-1535 2036.5,-1603 2036.5,-1603 2036.5,-1609 2030.5,-1615 2024.5,-1615 2024.5,-1615 1728.5,-1615 1728.5,-1615 1722.5,-1615 1716.5,-1609 1716.5,-1603 1716.5,-1603 1716.5,-1535 1716.5,-1535 1716.5,-1529 1722.5,-1523 1728.5,-1523"/>
<text text-anchor="middle" x="1767" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000">registration</text>
<polyline fill="none" stroke="#000000" points="1817.5,-1523 1817.5,-1615 "/>
<text text-anchor="middle" x="1828" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1838.5,-1523 1838.5,-1615 "/>
<text text-anchor="middle" x="1927" y="-1599.8" font-family="Times,serif" font-size="14.00" fill="#000000">crdc_id</text>
<polyline fill="none" stroke="#000000" points="1838.5,-1592 2015.5,-1592 "/>
<text text-anchor="middle" x="1927" y="-1576.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration_id</text>
<polyline fill="none" stroke="#000000" points="1838.5,-1569 2015.5,-1569 "/>
<text text-anchor="middle" x="1927" y="-1553.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration_origin</text>
<polyline fill="none" stroke="#000000" points="1838.5,-1546 2015.5,-1546 "/>
<text text-anchor="middle" x="1927" y="-1530.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration_record_id</text>
<polyline fill="none" stroke="#000000" points="2015.5,-1523 2015.5,-1615 "/>
<text text-anchor="middle" x="2026" y="-1565.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- registration&#45;&gt;case -->
<g id="edge10" class="edge">
<title>registration&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1820.9803,-1522.7718C1784.242,-1492.1819 1735.979,-1451.9959 1697.7573,-1420.1708"/>
<polygon fill="#000000" stroke="#000000" points="1699.6857,-1417.2221 1689.7613,-1413.5131 1695.2066,-1422.6015 1699.6857,-1417.2221"/>
<text text-anchor="middle" x="1754.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- human_relevance -->
<g id="node26" class="node">
<title>human_relevance</title>
<path fill="none" stroke="#000000" d="M2916,-495.5C2916,-495.5 3441,-495.5 3441,-495.5 3447,-495.5 3453,-501.5 3453,-507.5 3453,-507.5 3453,-644.5 3453,-644.5 3453,-650.5 3447,-656.5 3441,-656.5 3441,-656.5 2916,-656.5 2916,-656.5 2910,-656.5 2904,-650.5 2904,-644.5 2904,-644.5 2904,-507.5 2904,-507.5 2904,-501.5 2910,-495.5 2916,-495.5"/>
<text text-anchor="middle" x="2975.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">human_relevance</text>
<polyline fill="none" stroke="#000000" points="3047,-495.5 3047,-656.5 "/>
<text text-anchor="middle" x="3057.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3068,-495.5 3068,-656.5 "/>
<text text-anchor="middle" x="3250" y="-641.3" font-family="Times,serif" font-size="14.00" fill="#000000">human_relevance_record_id</text>
<polyline fill="none" stroke="#000000" points="3068,-633.5 3432,-633.5 "/>
<text text-anchor="middle" x="3250" y="-618.3" font-family="Times,serif" font-size="14.00" fill="#000000">human_relevance_statement</text>
<polyline fill="none" stroke="#000000" points="3068,-610.5 3432,-610.5 "/>
<text text-anchor="middle" x="3250" y="-595.3" font-family="Times,serif" font-size="14.00" fill="#000000">nci_link_to_relevant_human_cancer</text>
<polyline fill="none" stroke="#000000" points="3068,-587.5 3432,-587.5 "/>
<text text-anchor="middle" x="3250" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">relevant_experimental_therapeutic_intervention</text>
<polyline fill="none" stroke="#000000" points="3068,-564.5 3432,-564.5 "/>
<text text-anchor="middle" x="3250" y="-549.3" font-family="Times,serif" font-size="14.00" fill="#000000">relevant_human_cancer</text>
<polyline fill="none" stroke="#000000" points="3068,-541.5 3432,-541.5 "/>
<text text-anchor="middle" x="3250" y="-526.3" font-family="Times,serif" font-size="14.00" fill="#000000">relevant_human_genes</text>
<polyline fill="none" stroke="#000000" points="3068,-518.5 3432,-518.5 "/>
<text text-anchor="middle" x="3250" y="-503.3" font-family="Times,serif" font-size="14.00" fill="#000000">relevant_human_pathways</text>
<polyline fill="none" stroke="#000000" points="3432,-495.5 3432,-656.5 "/>
<text text-anchor="middle" x="3442.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- human_relevance&#45;&gt;study -->
<g id="edge19" class="edge">
<title>human_relevance&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2903.9235,-497.1628C2900.7674,-496.4289 2897.6254,-495.7076 2894.5,-495 2607.2837,-429.9751 2267.7414,-377.9603 2071.641,-350.3035"/>
<polygon fill="#000000" stroke="#000000" points="2071.9334,-346.8102 2061.5433,-348.883 2070.9583,-353.742 2071.9334,-346.8102"/>
<text text-anchor="middle" x="2819" y="-465.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
</g>
</svg>
</div>
