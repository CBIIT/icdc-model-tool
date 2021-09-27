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
<svg width="3800pt" height="3150pt"
 viewBox="0.00 0.00 3799.50 3150.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 3146)">
<title>Perl</title>
<polygon fill="white" stroke="transparent" points="-4,4 -4,-3146 3795.5,-3146 3795.5,4 -4,4"/>
<!-- publication -->
<g id="node1" class="node">
<title>publication</title>
<path fill="none" stroke="black" d="M12,-449.5C12,-449.5 236,-449.5 236,-449.5 242,-449.5 248,-455.5 248,-461.5 248,-461.5 248,-575.5 248,-575.5 248,-581.5 242,-587.5 236,-587.5 236,-587.5 12,-587.5 12,-587.5 6,-587.5 0,-581.5 0,-575.5 0,-575.5 0,-461.5 0,-461.5 0,-455.5 6,-449.5 12,-449.5"/>
<text text-anchor="middle" x="39.5" y="-514.8" font-family="Times,serif" font-size="14.00">publication</text>
<polyline fill="none" stroke="black" points="79,-449.5 79,-587.5 "/>
<text text-anchor="middle" x="89" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="99,-449.5 99,-587.5 "/>
<text text-anchor="middle" x="163.5" y="-572.3" font-family="Times,serif" font-size="14.00">authorship</text>
<polyline fill="none" stroke="black" points="99,-564.5 228,-564.5 "/>
<text text-anchor="middle" x="163.5" y="-549.3" font-family="Times,serif" font-size="14.00">digital_object_id</text>
<polyline fill="none" stroke="black" points="99,-541.5 228,-541.5 "/>
<text text-anchor="middle" x="163.5" y="-526.3" font-family="Times,serif" font-size="14.00">journal_citation</text>
<polyline fill="none" stroke="black" points="99,-518.5 228,-518.5 "/>
<text text-anchor="middle" x="163.5" y="-503.3" font-family="Times,serif" font-size="14.00">publication_title</text>
<polyline fill="none" stroke="black" points="99,-495.5 228,-495.5 "/>
<text text-anchor="middle" x="163.5" y="-480.3" font-family="Times,serif" font-size="14.00">pubmed_id</text>
<polyline fill="none" stroke="black" points="99,-472.5 228,-472.5 "/>
<text text-anchor="middle" x="163.5" y="-457.3" font-family="Times,serif" font-size="14.00">year_of_publication</text>
<polyline fill="none" stroke="black" points="228,-449.5 228,-587.5 "/>
<text text-anchor="middle" x="238" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- study -->
<g id="node3" class="node">
<title>study</title>
<path fill="none" stroke="black" d="M827,-190.5C827,-190.5 1057,-190.5 1057,-190.5 1063,-190.5 1069,-196.5 1069,-202.5 1069,-202.5 1069,-385.5 1069,-385.5 1069,-391.5 1063,-397.5 1057,-397.5 1057,-397.5 827,-397.5 827,-397.5 821,-397.5 815,-391.5 815,-385.5 815,-385.5 815,-202.5 815,-202.5 815,-196.5 821,-190.5 827,-190.5"/>
<text text-anchor="middle" x="838.5" y="-290.3" font-family="Times,serif" font-size="14.00">study</text>
<polyline fill="none" stroke="black" points="862,-190.5 862,-397.5 "/>
<text text-anchor="middle" x="872" y="-290.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="882,-190.5 882,-397.5 "/>
<text text-anchor="middle" x="965.5" y="-382.3" font-family="Times,serif" font-size="14.00">accession_id</text>
<polyline fill="none" stroke="black" points="882,-374.5 1049,-374.5 "/>
<text text-anchor="middle" x="965.5" y="-359.3" font-family="Times,serif" font-size="14.00">clinical_study_description</text>
<polyline fill="none" stroke="black" points="882,-351.5 1049,-351.5 "/>
<text text-anchor="middle" x="965.5" y="-336.3" font-family="Times,serif" font-size="14.00">clinical_study_designation</text>
<polyline fill="none" stroke="black" points="882,-328.5 1049,-328.5 "/>
<text text-anchor="middle" x="965.5" y="-313.3" font-family="Times,serif" font-size="14.00">clinical_study_id</text>
<polyline fill="none" stroke="black" points="882,-305.5 1049,-305.5 "/>
<text text-anchor="middle" x="965.5" y="-290.3" font-family="Times,serif" font-size="14.00">clinical_study_name</text>
<polyline fill="none" stroke="black" points="882,-282.5 1049,-282.5 "/>
<text text-anchor="middle" x="965.5" y="-267.3" font-family="Times,serif" font-size="14.00">clinical_study_type</text>
<polyline fill="none" stroke="black" points="882,-259.5 1049,-259.5 "/>
<text text-anchor="middle" x="965.5" y="-244.3" font-family="Times,serif" font-size="14.00">date_of_iacuc_approval</text>
<polyline fill="none" stroke="black" points="882,-236.5 1049,-236.5 "/>
<text text-anchor="middle" x="965.5" y="-221.3" font-family="Times,serif" font-size="14.00">dates_of_conduct</text>
<polyline fill="none" stroke="black" points="882,-213.5 1049,-213.5 "/>
<text text-anchor="middle" x="965.5" y="-198.3" font-family="Times,serif" font-size="14.00">study_disposition</text>
<polyline fill="none" stroke="black" points="1049,-190.5 1049,-397.5 "/>
<text text-anchor="middle" x="1059" y="-290.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- publication&#45;&gt;study -->
<g id="edge20" class="edge">
<title>publication&#45;&gt;study</title>
<path fill="none" stroke="black" d="M248.17,-452.34C251.12,-451.18 254.07,-450.06 257,-449 441.33,-382.05 664.53,-338.43 804.93,-315.25"/>
<polygon fill="black" stroke="black" points="805.59,-318.69 814.89,-313.62 804.46,-311.78 805.59,-318.69"/>
<text text-anchor="middle" x="372.5" y="-419.8" font-family="Times,serif" font-size="14.00">of_study</text>
</g>
<!-- demographic -->
<g id="node2" class="node">
<title>demographic</title>
<path fill="none" stroke="black" d="M2143,-1370.5C2143,-1370.5 2415,-1370.5 2415,-1370.5 2421,-1370.5 2427,-1376.5 2427,-1382.5 2427,-1382.5 2427,-1519.5 2427,-1519.5 2427,-1525.5 2421,-1531.5 2415,-1531.5 2415,-1531.5 2143,-1531.5 2143,-1531.5 2137,-1531.5 2131,-1525.5 2131,-1519.5 2131,-1519.5 2131,-1382.5 2131,-1382.5 2131,-1376.5 2137,-1370.5 2143,-1370.5"/>
<text text-anchor="middle" x="2176" y="-1447.3" font-family="Times,serif" font-size="14.00">demographic</text>
<polyline fill="none" stroke="black" points="2221,-1370.5 2221,-1531.5 "/>
<text text-anchor="middle" x="2231" y="-1447.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2241,-1370.5 2241,-1531.5 "/>
<text text-anchor="middle" x="2324" y="-1516.3" font-family="Times,serif" font-size="14.00">breed</text>
<polyline fill="none" stroke="black" points="2241,-1508.5 2407,-1508.5 "/>
<text text-anchor="middle" x="2324" y="-1493.3" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="2241,-1485.5 2407,-1485.5 "/>
<text text-anchor="middle" x="2324" y="-1470.3" font-family="Times,serif" font-size="14.00">date_of_birth</text>
<polyline fill="none" stroke="black" points="2241,-1462.5 2407,-1462.5 "/>
<text text-anchor="middle" x="2324" y="-1447.3" font-family="Times,serif" font-size="14.00">neutered_indicator</text>
<polyline fill="none" stroke="black" points="2241,-1439.5 2407,-1439.5 "/>
<text text-anchor="middle" x="2324" y="-1424.3" font-family="Times,serif" font-size="14.00">patient_age_at_enrollment</text>
<polyline fill="none" stroke="black" points="2241,-1416.5 2407,-1416.5 "/>
<text text-anchor="middle" x="2324" y="-1401.3" font-family="Times,serif" font-size="14.00">sex</text>
<polyline fill="none" stroke="black" points="2241,-1393.5 2407,-1393.5 "/>
<text text-anchor="middle" x="2324" y="-1378.3" font-family="Times,serif" font-size="14.00">weight</text>
<polyline fill="none" stroke="black" points="2407,-1370.5 2407,-1531.5 "/>
<text text-anchor="middle" x="2417" y="-1447.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- case -->
<g id="node16" class="node">
<title>case</title>
<path fill="none" stroke="black" d="M1981,-1203.5C1981,-1203.5 2159,-1203.5 2159,-1203.5 2165,-1203.5 2171,-1209.5 2171,-1215.5 2171,-1215.5 2171,-1283.5 2171,-1283.5 2171,-1289.5 2165,-1295.5 2159,-1295.5 2159,-1295.5 1981,-1295.5 1981,-1295.5 1975,-1295.5 1969,-1289.5 1969,-1283.5 1969,-1283.5 1969,-1215.5 1969,-1215.5 1969,-1209.5 1975,-1203.5 1981,-1203.5"/>
<text text-anchor="middle" x="1989.5" y="-1245.8" font-family="Times,serif" font-size="14.00">case</text>
<polyline fill="none" stroke="black" points="2010,-1203.5 2010,-1295.5 "/>
<text text-anchor="middle" x="2020" y="-1245.8" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2030,-1203.5 2030,-1295.5 "/>
<text text-anchor="middle" x="2090.5" y="-1280.3" font-family="Times,serif" font-size="14.00">case_id</text>
<polyline fill="none" stroke="black" points="2030,-1272.5 2151,-1272.5 "/>
<text text-anchor="middle" x="2090.5" y="-1257.3" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="2030,-1249.5 2151,-1249.5 "/>
<text text-anchor="middle" x="2090.5" y="-1234.3" font-family="Times,serif" font-size="14.00">patient_first_name</text>
<polyline fill="none" stroke="black" points="2030,-1226.5 2151,-1226.5 "/>
<text text-anchor="middle" x="2090.5" y="-1211.3" font-family="Times,serif" font-size="14.00">patient_id</text>
<polyline fill="none" stroke="black" points="2151,-1203.5 2151,-1295.5 "/>
<text text-anchor="middle" x="2161" y="-1245.8" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge9" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="black" d="M2195.5,-1370.29C2171.7,-1347.57 2146.38,-1323.41 2124.77,-1302.78"/>
<polygon fill="black" stroke="black" points="2126.94,-1300.01 2117.29,-1295.64 2122.1,-1305.07 2126.94,-1300.01"/>
<text text-anchor="middle" x="2171.5" y="-1317.8" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
<!-- program -->
<g id="node19" class="node">
<title>program</title>
<path fill="none" stroke="black" d="M818,-0.5C818,-0.5 1066,-0.5 1066,-0.5 1072,-0.5 1078,-6.5 1078,-12.5 1078,-12.5 1078,-126.5 1078,-126.5 1078,-132.5 1072,-138.5 1066,-138.5 1066,-138.5 818,-138.5 818,-138.5 812,-138.5 806,-132.5 806,-126.5 806,-126.5 806,-12.5 806,-12.5 806,-6.5 812,-0.5 818,-0.5"/>
<text text-anchor="middle" x="838" y="-65.8" font-family="Times,serif" font-size="14.00">program</text>
<polyline fill="none" stroke="black" points="870,-0.5 870,-138.5 "/>
<text text-anchor="middle" x="880" y="-65.8" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="890,-0.5 890,-138.5 "/>
<text text-anchor="middle" x="974" y="-123.3" font-family="Times,serif" font-size="14.00">program_acronym</text>
<polyline fill="none" stroke="black" points="890,-115.5 1058,-115.5 "/>
<text text-anchor="middle" x="974" y="-100.3" font-family="Times,serif" font-size="14.00">program_external_url</text>
<polyline fill="none" stroke="black" points="890,-92.5 1058,-92.5 "/>
<text text-anchor="middle" x="974" y="-77.3" font-family="Times,serif" font-size="14.00">program_full_description</text>
<polyline fill="none" stroke="black" points="890,-69.5 1058,-69.5 "/>
<text text-anchor="middle" x="974" y="-54.3" font-family="Times,serif" font-size="14.00">program_name</text>
<polyline fill="none" stroke="black" points="890,-46.5 1058,-46.5 "/>
<text text-anchor="middle" x="974" y="-31.3" font-family="Times,serif" font-size="14.00">program_short_description</text>
<polyline fill="none" stroke="black" points="890,-23.5 1058,-23.5 "/>
<text text-anchor="middle" x="974" y="-8.3" font-family="Times,serif" font-size="14.00">program_sort_order</text>
<polyline fill="none" stroke="black" points="1058,-0.5 1058,-138.5 "/>
<text text-anchor="middle" x="1068" y="-65.8" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge49" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="black" d="M942,-190.22C942,-176.24 942,-162.09 942,-148.65"/>
<polygon fill="black" stroke="black" points="945.5,-148.52 942,-138.52 938.5,-148.52 945.5,-148.52"/>
<text text-anchor="middle" x="974.5" y="-160.8" font-family="Times,serif" font-size="14.00">member_of</text>
</g>
<!-- assay -->
<g id="node4" class="node">
<title>assay</title>
<path fill="none" stroke="black" d="M2921,-2846.5C2921,-2846.5 2951,-2846.5 2951,-2846.5 2957,-2846.5 2963,-2852.5 2963,-2858.5 2963,-2858.5 2963,-2870.5 2963,-2870.5 2963,-2876.5 2957,-2882.5 2951,-2882.5 2951,-2882.5 2921,-2882.5 2921,-2882.5 2915,-2882.5 2909,-2876.5 2909,-2870.5 2909,-2870.5 2909,-2858.5 2909,-2858.5 2909,-2852.5 2915,-2846.5 2921,-2846.5"/>
<text text-anchor="middle" x="2936" y="-2860.8" font-family="Times,serif" font-size="14.00">assay</text>
</g>
<!-- sample -->
<g id="node29" class="node">
<title>sample</title>
<path fill="none" stroke="black" d="M1304,-1865.5C1304,-1865.5 1642,-1865.5 1642,-1865.5 1648,-1865.5 1654,-1871.5 1654,-1877.5 1654,-1877.5 1654,-2474.5 1654,-2474.5 1654,-2480.5 1648,-2486.5 1642,-2486.5 1642,-2486.5 1304,-2486.5 1304,-2486.5 1298,-2486.5 1292,-2480.5 1292,-2474.5 1292,-2474.5 1292,-1877.5 1292,-1877.5 1292,-1871.5 1298,-1865.5 1304,-1865.5"/>
<text text-anchor="middle" x="1320" y="-2172.3" font-family="Times,serif" font-size="14.00">sample</text>
<polyline fill="none" stroke="black" points="1348,-1865.5 1348,-2486.5 "/>
<text text-anchor="middle" x="1358" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1368,-1865.5 1368,-2486.5 "/>
<text text-anchor="middle" x="1501" y="-2471.3" font-family="Times,serif" font-size="14.00">analysis_area</text>
<polyline fill="none" stroke="black" points="1368,-2463.5 1634,-2463.5 "/>
<text text-anchor="middle" x="1501" y="-2448.3" font-family="Times,serif" font-size="14.00">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="black" points="1368,-2440.5 1634,-2440.5 "/>
<text text-anchor="middle" x="1501" y="-2425.3" font-family="Times,serif" font-size="14.00">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="black" points="1368,-2417.5 1634,-2417.5 "/>
<text text-anchor="middle" x="1501" y="-2402.3" font-family="Times,serif" font-size="14.00">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="black" points="1368,-2394.5 1634,-2394.5 "/>
<text text-anchor="middle" x="1501" y="-2379.3" font-family="Times,serif" font-size="14.00">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="black" points="1368,-2371.5 1634,-2371.5 "/>
<text text-anchor="middle" x="1501" y="-2356.3" font-family="Times,serif" font-size="14.00">comment</text>
<polyline fill="none" stroke="black" points="1368,-2348.5 1634,-2348.5 "/>
<text text-anchor="middle" x="1501" y="-2333.3" font-family="Times,serif" font-size="14.00">date_of_sample_collection</text>
<polyline fill="none" stroke="black" points="1368,-2325.5 1634,-2325.5 "/>
<text text-anchor="middle" x="1501" y="-2310.3" font-family="Times,serif" font-size="14.00">general_sample_pathology</text>
<polyline fill="none" stroke="black" points="1368,-2302.5 1634,-2302.5 "/>
<text text-anchor="middle" x="1501" y="-2287.3" font-family="Times,serif" font-size="14.00">length_of_tumor</text>
<polyline fill="none" stroke="black" points="1368,-2279.5 1634,-2279.5 "/>
<text text-anchor="middle" x="1501" y="-2264.3" font-family="Times,serif" font-size="14.00">molecular_subtype</text>
<polyline fill="none" stroke="black" points="1368,-2256.5 1634,-2256.5 "/>
<text text-anchor="middle" x="1501" y="-2241.3" font-family="Times,serif" font-size="14.00">necropsy_sample</text>
<polyline fill="none" stroke="black" points="1368,-2233.5 1634,-2233.5 "/>
<text text-anchor="middle" x="1501" y="-2218.3" font-family="Times,serif" font-size="14.00">non_tumor_tissue_area</text>
<polyline fill="none" stroke="black" points="1368,-2210.5 1634,-2210.5 "/>
<text text-anchor="middle" x="1501" y="-2195.3" font-family="Times,serif" font-size="14.00">percentage_stroma</text>
<polyline fill="none" stroke="black" points="1368,-2187.5 1634,-2187.5 "/>
<text text-anchor="middle" x="1501" y="-2172.3" font-family="Times,serif" font-size="14.00">percentage_tumor</text>
<polyline fill="none" stroke="black" points="1368,-2164.5 1634,-2164.5 "/>
<text text-anchor="middle" x="1501" y="-2149.3" font-family="Times,serif" font-size="14.00">physical_sample_type</text>
<polyline fill="none" stroke="black" points="1368,-2141.5 1634,-2141.5 "/>
<text text-anchor="middle" x="1501" y="-2126.3" font-family="Times,serif" font-size="14.00">sample_chronology</text>
<polyline fill="none" stroke="black" points="1368,-2118.5 1634,-2118.5 "/>
<text text-anchor="middle" x="1501" y="-2103.3" font-family="Times,serif" font-size="14.00">sample_id</text>
<polyline fill="none" stroke="black" points="1368,-2095.5 1634,-2095.5 "/>
<text text-anchor="middle" x="1501" y="-2080.3" font-family="Times,serif" font-size="14.00">sample_preservation</text>
<polyline fill="none" stroke="black" points="1368,-2072.5 1634,-2072.5 "/>
<text text-anchor="middle" x="1501" y="-2057.3" font-family="Times,serif" font-size="14.00">sample_site</text>
<polyline fill="none" stroke="black" points="1368,-2049.5 1634,-2049.5 "/>
<text text-anchor="middle" x="1501" y="-2034.3" font-family="Times,serif" font-size="14.00">specific_sample_pathology</text>
<polyline fill="none" stroke="black" points="1368,-2026.5 1634,-2026.5 "/>
<text text-anchor="middle" x="1501" y="-2011.3" font-family="Times,serif" font-size="14.00">summarized_sample_type</text>
<polyline fill="none" stroke="black" points="1368,-2003.5 1634,-2003.5 "/>
<text text-anchor="middle" x="1501" y="-1988.3" font-family="Times,serif" font-size="14.00">total_tissue_area</text>
<polyline fill="none" stroke="black" points="1368,-1980.5 1634,-1980.5 "/>
<text text-anchor="middle" x="1501" y="-1965.3" font-family="Times,serif" font-size="14.00">tumor_grade</text>
<polyline fill="none" stroke="black" points="1368,-1957.5 1634,-1957.5 "/>
<text text-anchor="middle" x="1501" y="-1942.3" font-family="Times,serif" font-size="14.00">tumor_sample_origin</text>
<polyline fill="none" stroke="black" points="1368,-1934.5 1634,-1934.5 "/>
<text text-anchor="middle" x="1501" y="-1919.3" font-family="Times,serif" font-size="14.00">tumor_tissue_area</text>
<polyline fill="none" stroke="black" points="1368,-1911.5 1634,-1911.5 "/>
<text text-anchor="middle" x="1501" y="-1896.3" font-family="Times,serif" font-size="14.00">volume_of_tumor</text>
<polyline fill="none" stroke="black" points="1368,-1888.5 1634,-1888.5 "/>
<text text-anchor="middle" x="1501" y="-1873.3" font-family="Times,serif" font-size="14.00">width_of_tumor</text>
<polyline fill="none" stroke="black" points="1634,-1865.5 1634,-2486.5 "/>
<text text-anchor="middle" x="1644" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge38" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="black" d="M2908.95,-2856.3C2738.06,-2810.7 1812.16,-2561.46 1706,-2487 1690.63,-2476.22 1675.84,-2464.11 1661.69,-2451.08"/>
<polygon fill="black" stroke="black" points="1664.04,-2448.48 1654.35,-2444.19 1659.24,-2453.59 1664.04,-2448.48"/>
<text text-anchor="middle" x="2825.5" y="-2662.8" font-family="Times,serif" font-size="14.00">of_sample</text>
</g>
<!-- vital_signs -->
<g id="node5" class="node">
<title>vital_signs</title>
<path fill="none" stroke="black" d="M1727,-2015C1727,-2015 1959,-2015 1959,-2015 1965,-2015 1971,-2021 1971,-2027 1971,-2027 1971,-2325 1971,-2325 1971,-2331 1965,-2337 1959,-2337 1959,-2337 1727,-2337 1727,-2337 1721,-2337 1715,-2331 1715,-2325 1715,-2325 1715,-2027 1715,-2027 1715,-2021 1721,-2015 1727,-2015"/>
<text text-anchor="middle" x="1753.5" y="-2172.3" font-family="Times,serif" font-size="14.00">vital_signs</text>
<polyline fill="none" stroke="black" points="1792,-2015 1792,-2337 "/>
<text text-anchor="middle" x="1802" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1812,-2015 1812,-2337 "/>
<text text-anchor="middle" x="1881.5" y="-2321.8" font-family="Times,serif" font-size="14.00">assessment_timepoint</text>
<polyline fill="none" stroke="black" points="1812,-2314 1951,-2314 "/>
<text text-anchor="middle" x="1881.5" y="-2298.8" font-family="Times,serif" font-size="14.00">body_surface_area</text>
<polyline fill="none" stroke="black" points="1812,-2291 1951,-2291 "/>
<text text-anchor="middle" x="1881.5" y="-2275.8" font-family="Times,serif" font-size="14.00">body_temperature</text>
<polyline fill="none" stroke="black" points="1812,-2268 1951,-2268 "/>
<text text-anchor="middle" x="1881.5" y="-2252.8" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="1812,-2245 1951,-2245 "/>
<text text-anchor="middle" x="1881.5" y="-2229.8" font-family="Times,serif" font-size="14.00">date_of_vital_signs</text>
<polyline fill="none" stroke="black" points="1812,-2222 1951,-2222 "/>
<text text-anchor="middle" x="1881.5" y="-2206.8" font-family="Times,serif" font-size="14.00">ecg</text>
<polyline fill="none" stroke="black" points="1812,-2199 1951,-2199 "/>
<text text-anchor="middle" x="1881.5" y="-2183.8" font-family="Times,serif" font-size="14.00">modified_ecog</text>
<polyline fill="none" stroke="black" points="1812,-2176 1951,-2176 "/>
<text text-anchor="middle" x="1881.5" y="-2160.8" font-family="Times,serif" font-size="14.00">patient_weight</text>
<polyline fill="none" stroke="black" points="1812,-2153 1951,-2153 "/>
<text text-anchor="middle" x="1881.5" y="-2137.8" font-family="Times,serif" font-size="14.00">phase</text>
<polyline fill="none" stroke="black" points="1812,-2130 1951,-2130 "/>
<text text-anchor="middle" x="1881.5" y="-2114.8" font-family="Times,serif" font-size="14.00">pulse</text>
<polyline fill="none" stroke="black" points="1812,-2107 1951,-2107 "/>
<text text-anchor="middle" x="1881.5" y="-2091.8" font-family="Times,serif" font-size="14.00">pulse_ox</text>
<polyline fill="none" stroke="black" points="1812,-2084 1951,-2084 "/>
<text text-anchor="middle" x="1881.5" y="-2068.8" font-family="Times,serif" font-size="14.00">respiration_pattern</text>
<polyline fill="none" stroke="black" points="1812,-2061 1951,-2061 "/>
<text text-anchor="middle" x="1881.5" y="-2045.8" font-family="Times,serif" font-size="14.00">respiration_rate</text>
<polyline fill="none" stroke="black" points="1812,-2038 1951,-2038 "/>
<text text-anchor="middle" x="1881.5" y="-2022.8" font-family="Times,serif" font-size="14.00">systolic_bp</text>
<polyline fill="none" stroke="black" points="1951,-2015 1951,-2337 "/>
<text text-anchor="middle" x="1961" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- visit -->
<g id="node31" class="node">
<title>visit</title>
<path fill="none" stroke="black" d="M1781.5,-1687C1781.5,-1687 1928.5,-1687 1928.5,-1687 1934.5,-1687 1940.5,-1693 1940.5,-1699 1940.5,-1699 1940.5,-1721 1940.5,-1721 1940.5,-1727 1934.5,-1733 1928.5,-1733 1928.5,-1733 1781.5,-1733 1781.5,-1733 1775.5,-1733 1769.5,-1727 1769.5,-1721 1769.5,-1721 1769.5,-1699 1769.5,-1699 1769.5,-1693 1775.5,-1687 1781.5,-1687"/>
<text text-anchor="middle" x="1790" y="-1706.3" font-family="Times,serif" font-size="14.00">visit</text>
<polyline fill="none" stroke="black" points="1810.5,-1687 1810.5,-1733 "/>
<text text-anchor="middle" x="1820.5" y="-1706.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1830.5,-1687 1830.5,-1733 "/>
<text text-anchor="middle" x="1875.5" y="-1717.8" font-family="Times,serif" font-size="14.00">visit_date</text>
<polyline fill="none" stroke="black" points="1830.5,-1710 1920.5,-1710 "/>
<text text-anchor="middle" x="1875.5" y="-1694.8" font-family="Times,serif" font-size="14.00">visit_number</text>
<polyline fill="none" stroke="black" points="1920.5,-1687 1920.5,-1733 "/>
<text text-anchor="middle" x="1930.5" y="-1706.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge35" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="black" d="M1847.14,-2014.99C1849.68,-1916.73 1852.72,-1799.33 1854.16,-1743.54"/>
<polygon fill="black" stroke="black" points="1857.67,-1743.32 1854.43,-1733.23 1850.67,-1743.13 1857.67,-1743.32"/>
<text text-anchor="middle" x="1875" y="-1835.8" font-family="Times,serif" font-size="14.00">on_visit</text>
</g>
<!-- image -->
<g id="node6" class="node">
<title>image</title>
<path fill="none" stroke="black" d="M3605,-3020C3605,-3020 3635,-3020 3635,-3020 3641,-3020 3647,-3026 3647,-3032 3647,-3032 3647,-3044 3647,-3044 3647,-3050 3641,-3056 3635,-3056 3635,-3056 3605,-3056 3605,-3056 3599,-3056 3593,-3050 3593,-3044 3593,-3044 3593,-3032 3593,-3032 3593,-3026 3599,-3020 3605,-3020"/>
<text text-anchor="middle" x="3620" y="-3034.3" font-family="Times,serif" font-size="14.00">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge23" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="black" d="M3623.25,-3019.67C3627.63,-2990.31 3631.45,-2931.05 3598,-2901 3574.66,-2880.03 3110.62,-2869.02 2973.71,-2866.23"/>
<polygon fill="black" stroke="black" points="2973.39,-2862.72 2963.32,-2866.02 2973.25,-2869.72 2973.39,-2862.72"/>
<text text-anchor="middle" x="3633.5" y="-2904.8" font-family="Times,serif" font-size="14.00">of_assay</text>
</g>
<!-- principal_investigator -->
<g id="node7" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="black" d="M278,-484C278,-484 546,-484 546,-484 552,-484 558,-490 558,-496 558,-496 558,-541 558,-541 558,-547 552,-553 546,-553 546,-553 278,-553 278,-553 272,-553 266,-547 266,-541 266,-541 266,-496 266,-496 266,-490 272,-484 278,-484"/>
<text text-anchor="middle" x="335.5" y="-514.8" font-family="Times,serif" font-size="14.00">principal_investigator</text>
<polyline fill="none" stroke="black" points="405,-484 405,-553 "/>
<text text-anchor="middle" x="415" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="425,-484 425,-553 "/>
<text text-anchor="middle" x="481.5" y="-537.8" font-family="Times,serif" font-size="14.00">pi_first_name</text>
<polyline fill="none" stroke="black" points="425,-530 538,-530 "/>
<text text-anchor="middle" x="481.5" y="-514.8" font-family="Times,serif" font-size="14.00">pi_last_name</text>
<polyline fill="none" stroke="black" points="425,-507 538,-507 "/>
<text text-anchor="middle" x="481.5" y="-491.8" font-family="Times,serif" font-size="14.00">pi_middle_initial</text>
<polyline fill="none" stroke="black" points="538,-484 538,-553 "/>
<text text-anchor="middle" x="548" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge17" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="black" d="M486.72,-484C512.14,-472.73 540.75,-460.19 567,-449 645.69,-415.46 734.19,-379.05 805.45,-350.06"/>
<polygon fill="black" stroke="black" points="806.99,-353.21 814.94,-346.21 804.36,-346.73 806.99,-353.21"/>
<text text-anchor="middle" x="663.5" y="-419.8" font-family="Times,serif" font-size="14.00">of_study</text>
</g>
<!-- physical_exam -->
<g id="node8" class="node">
<title>physical_exam</title>
<path fill="none" stroke="black" d="M2385.5,-2084C2385.5,-2084 2640.5,-2084 2640.5,-2084 2646.5,-2084 2652.5,-2090 2652.5,-2096 2652.5,-2096 2652.5,-2256 2652.5,-2256 2652.5,-2262 2646.5,-2268 2640.5,-2268 2640.5,-2268 2385.5,-2268 2385.5,-2268 2379.5,-2268 2373.5,-2262 2373.5,-2256 2373.5,-2256 2373.5,-2096 2373.5,-2096 2373.5,-2090 2379.5,-2084 2385.5,-2084"/>
<text text-anchor="middle" x="2423.5" y="-2172.3" font-family="Times,serif" font-size="14.00">physical_exam</text>
<polyline fill="none" stroke="black" points="2473.5,-2084 2473.5,-2268 "/>
<text text-anchor="middle" x="2483.5" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2493.5,-2084 2493.5,-2268 "/>
<text text-anchor="middle" x="2563" y="-2252.8" font-family="Times,serif" font-size="14.00">assessment_timepoint</text>
<polyline fill="none" stroke="black" points="2493.5,-2245 2632.5,-2245 "/>
<text text-anchor="middle" x="2563" y="-2229.8" font-family="Times,serif" font-size="14.00">body_system</text>
<polyline fill="none" stroke="black" points="2493.5,-2222 2632.5,-2222 "/>
<text text-anchor="middle" x="2563" y="-2206.8" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="2493.5,-2199 2632.5,-2199 "/>
<text text-anchor="middle" x="2563" y="-2183.8" font-family="Times,serif" font-size="14.00">date_of_examination</text>
<polyline fill="none" stroke="black" points="2493.5,-2176 2632.5,-2176 "/>
<text text-anchor="middle" x="2563" y="-2160.8" font-family="Times,serif" font-size="14.00">day_in_cycle</text>
<polyline fill="none" stroke="black" points="2493.5,-2153 2632.5,-2153 "/>
<text text-anchor="middle" x="2563" y="-2137.8" font-family="Times,serif" font-size="14.00">pe_comment</text>
<polyline fill="none" stroke="black" points="2493.5,-2130 2632.5,-2130 "/>
<text text-anchor="middle" x="2563" y="-2114.8" font-family="Times,serif" font-size="14.00">pe_finding</text>
<polyline fill="none" stroke="black" points="2493.5,-2107 2632.5,-2107 "/>
<text text-anchor="middle" x="2563" y="-2091.8" font-family="Times,serif" font-size="14.00">phase_pe</text>
<polyline fill="none" stroke="black" points="2632.5,-2084 2632.5,-2268 "/>
<text text-anchor="middle" x="2642.5" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge32" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="black" d="M2490.79,-2083.89C2469.37,-2014.57 2430.21,-1921.71 2364,-1865 2245.69,-1763.66 2062.21,-1729.01 1950.87,-1717.16"/>
<polygon fill="black" stroke="black" points="1950.97,-1713.65 1940.66,-1716.11 1950.25,-1720.61 1950.97,-1713.65"/>
<text text-anchor="middle" x="2354" y="-1835.8" font-family="Times,serif" font-size="14.00">on_visit</text>
</g>
<!-- enrollment -->
<g id="node32" class="node">
<title>enrollment</title>
<path fill="none" stroke="black" d="M2597,-1606.5C2597,-1606.5 2879,-1606.5 2879,-1606.5 2885,-1606.5 2891,-1612.5 2891,-1618.5 2891,-1618.5 2891,-1801.5 2891,-1801.5 2891,-1807.5 2885,-1813.5 2879,-1813.5 2879,-1813.5 2597,-1813.5 2597,-1813.5 2591,-1813.5 2585,-1807.5 2585,-1801.5 2585,-1801.5 2585,-1618.5 2585,-1618.5 2585,-1612.5 2591,-1606.5 2597,-1606.5"/>
<text text-anchor="middle" x="2623.5" y="-1706.3" font-family="Times,serif" font-size="14.00">enrollment</text>
<polyline fill="none" stroke="black" points="2662,-1606.5 2662,-1813.5 "/>
<text text-anchor="middle" x="2672" y="-1706.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2682,-1606.5 2682,-1813.5 "/>
<text text-anchor="middle" x="2776.5" y="-1798.3" font-family="Times,serif" font-size="14.00">cohort_description</text>
<polyline fill="none" stroke="black" points="2682,-1790.5 2871,-1790.5 "/>
<text text-anchor="middle" x="2776.5" y="-1775.3" font-family="Times,serif" font-size="14.00">date_of_informed_consent</text>
<polyline fill="none" stroke="black" points="2682,-1767.5 2871,-1767.5 "/>
<text text-anchor="middle" x="2776.5" y="-1752.3" font-family="Times,serif" font-size="14.00">date_of_registration</text>
<polyline fill="none" stroke="black" points="2682,-1744.5 2871,-1744.5 "/>
<text text-anchor="middle" x="2776.5" y="-1729.3" font-family="Times,serif" font-size="14.00">enrollment_document_number</text>
<polyline fill="none" stroke="black" points="2682,-1721.5 2871,-1721.5 "/>
<text text-anchor="middle" x="2776.5" y="-1706.3" font-family="Times,serif" font-size="14.00">initials</text>
<polyline fill="none" stroke="black" points="2682,-1698.5 2871,-1698.5 "/>
<text text-anchor="middle" x="2776.5" y="-1683.3" font-family="Times,serif" font-size="14.00">patient_subgroup</text>
<polyline fill="none" stroke="black" points="2682,-1675.5 2871,-1675.5 "/>
<text text-anchor="middle" x="2776.5" y="-1660.3" font-family="Times,serif" font-size="14.00">registering_institution</text>
<polyline fill="none" stroke="black" points="2682,-1652.5 2871,-1652.5 "/>
<text text-anchor="middle" x="2776.5" y="-1637.3" font-family="Times,serif" font-size="14.00">site_short_name</text>
<polyline fill="none" stroke="black" points="2682,-1629.5 2871,-1629.5 "/>
<text text-anchor="middle" x="2776.5" y="-1614.3" font-family="Times,serif" font-size="14.00">veterinary_medical_center</text>
<polyline fill="none" stroke="black" points="2871,-1606.5 2871,-1813.5 "/>
<text text-anchor="middle" x="2881" y="-1706.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge29" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="black" d="M2556.4,-2083.83C2589.46,-2014.61 2636.25,-1917.14 2678,-1832 2679.52,-1828.91 2681.06,-1825.77 2682.61,-1822.6"/>
<polygon fill="black" stroke="black" points="2685.76,-1824.14 2687.04,-1813.62 2679.48,-1821.05 2685.76,-1824.14"/>
<text text-anchor="middle" x="2717" y="-1835.8" font-family="Times,serif" font-size="14.00">at_enrollment</text>
</g>
<!-- follow_up -->
<g id="node9" class="node">
<title>follow_up</title>
<path fill="none" stroke="black" d="M2457.5,-1347.5C2457.5,-1347.5 2726.5,-1347.5 2726.5,-1347.5 2732.5,-1347.5 2738.5,-1353.5 2738.5,-1359.5 2738.5,-1359.5 2738.5,-1542.5 2738.5,-1542.5 2738.5,-1548.5 2732.5,-1554.5 2726.5,-1554.5 2726.5,-1554.5 2457.5,-1554.5 2457.5,-1554.5 2451.5,-1554.5 2445.5,-1548.5 2445.5,-1542.5 2445.5,-1542.5 2445.5,-1359.5 2445.5,-1359.5 2445.5,-1353.5 2451.5,-1347.5 2457.5,-1347.5"/>
<text text-anchor="middle" x="2482.5" y="-1447.3" font-family="Times,serif" font-size="14.00">follow_up</text>
<polyline fill="none" stroke="black" points="2519.5,-1347.5 2519.5,-1554.5 "/>
<text text-anchor="middle" x="2529.5" y="-1447.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2539.5,-1347.5 2539.5,-1554.5 "/>
<text text-anchor="middle" x="2629" y="-1539.3" font-family="Times,serif" font-size="14.00">contact_type</text>
<polyline fill="none" stroke="black" points="2539.5,-1531.5 2718.5,-1531.5 "/>
<text text-anchor="middle" x="2629" y="-1516.3" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="2539.5,-1508.5 2718.5,-1508.5 "/>
<text text-anchor="middle" x="2629" y="-1493.3" font-family="Times,serif" font-size="14.00">date_of_last_contact</text>
<polyline fill="none" stroke="black" points="2539.5,-1485.5 2718.5,-1485.5 "/>
<text text-anchor="middle" x="2629" y="-1470.3" font-family="Times,serif" font-size="14.00">document_number</text>
<polyline fill="none" stroke="black" points="2539.5,-1462.5 2718.5,-1462.5 "/>
<text text-anchor="middle" x="2629" y="-1447.3" font-family="Times,serif" font-size="14.00">explain_unknown_status</text>
<polyline fill="none" stroke="black" points="2539.5,-1439.5 2718.5,-1439.5 "/>
<text text-anchor="middle" x="2629" y="-1424.3" font-family="Times,serif" font-size="14.00">patient_status</text>
<polyline fill="none" stroke="black" points="2539.5,-1416.5 2718.5,-1416.5 "/>
<text text-anchor="middle" x="2629" y="-1401.3" font-family="Times,serif" font-size="14.00">physical_exam_changes</text>
<polyline fill="none" stroke="black" points="2539.5,-1393.5 2718.5,-1393.5 "/>
<text text-anchor="middle" x="2629" y="-1378.3" font-family="Times,serif" font-size="14.00">physical_exam_performed</text>
<polyline fill="none" stroke="black" points="2539.5,-1370.5 2718.5,-1370.5 "/>
<text text-anchor="middle" x="2629" y="-1355.3" font-family="Times,serif" font-size="14.00">treatment_since_last_contact</text>
<polyline fill="none" stroke="black" points="2718.5,-1347.5 2718.5,-1554.5 "/>
<text text-anchor="middle" x="2728.5" y="-1447.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge8" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="black" d="M2445.35,-1351.35C2442.23,-1349.84 2439.11,-1348.39 2436,-1347 2354.05,-1310.34 2255.34,-1285.32 2181.09,-1269.97"/>
<polygon fill="black" stroke="black" points="2181.73,-1266.53 2171.24,-1267.96 2180.33,-1273.39 2181.73,-1266.53"/>
<text text-anchor="middle" x="2409.5" y="-1317.8" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
<!-- study_site -->
<g id="node10" class="node">
<title>study_site</title>
<path fill="none" stroke="black" d="M588.5,-484C588.5,-484 843.5,-484 843.5,-484 849.5,-484 855.5,-490 855.5,-496 855.5,-496 855.5,-541 855.5,-541 855.5,-547 849.5,-553 843.5,-553 843.5,-553 588.5,-553 588.5,-553 582.5,-553 576.5,-547 576.5,-541 576.5,-541 576.5,-496 576.5,-496 576.5,-490 582.5,-484 588.5,-484"/>
<text text-anchor="middle" x="613" y="-514.8" font-family="Times,serif" font-size="14.00">study_site</text>
<polyline fill="none" stroke="black" points="649.5,-484 649.5,-553 "/>
<text text-anchor="middle" x="659.5" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="669.5,-484 669.5,-553 "/>
<text text-anchor="middle" x="752.5" y="-537.8" font-family="Times,serif" font-size="14.00">registering_institution</text>
<polyline fill="none" stroke="black" points="669.5,-530 835.5,-530 "/>
<text text-anchor="middle" x="752.5" y="-514.8" font-family="Times,serif" font-size="14.00">site_short_name</text>
<polyline fill="none" stroke="black" points="669.5,-507 835.5,-507 "/>
<text text-anchor="middle" x="752.5" y="-491.8" font-family="Times,serif" font-size="14.00">veterinary_medical_center</text>
<polyline fill="none" stroke="black" points="835.5,-484 835.5,-553 "/>
<text text-anchor="middle" x="845.5" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge18" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="black" d="M750.32,-483.71C771.95,-462.41 801.22,-433.6 830.36,-404.91"/>
<polygon fill="black" stroke="black" points="833.09,-407.14 837.76,-397.63 828.18,-402.15 833.09,-407.14"/>
<text text-anchor="middle" x="840.5" y="-419.8" font-family="Times,serif" font-size="14.00">of_study</text>
</g>
<!-- lab_exam -->
<g id="node11" class="node">
<title>lab_exam</title>
<path fill="none" stroke="black" d="M2001.5,-2158C2001.5,-2158 2048.5,-2158 2048.5,-2158 2054.5,-2158 2060.5,-2164 2060.5,-2170 2060.5,-2170 2060.5,-2182 2060.5,-2182 2060.5,-2188 2054.5,-2194 2048.5,-2194 2048.5,-2194 2001.5,-2194 2001.5,-2194 1995.5,-2194 1989.5,-2188 1989.5,-2182 1989.5,-2182 1989.5,-2170 1989.5,-2170 1989.5,-2164 1995.5,-2158 2001.5,-2158"/>
<text text-anchor="middle" x="2025" y="-2172.3" font-family="Times,serif" font-size="14.00">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge37" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="black" d="M2025.63,-2157.67C2026.74,-2109.17 2025.51,-1968.86 1980,-1865 1958.37,-1815.64 1916.46,-1769.07 1887.16,-1740.33"/>
<polygon fill="black" stroke="black" points="1889.26,-1737.49 1879.63,-1733.06 1884.4,-1742.53 1889.26,-1737.49"/>
<text text-anchor="middle" x="1994" y="-1835.8" font-family="Times,serif" font-size="14.00">on_visit</text>
</g>
<!-- disease_extent -->
<g id="node12" class="node">
<title>disease_extent</title>
<path fill="none" stroke="black" d="M2090.5,-2026.5C2090.5,-2026.5 2343.5,-2026.5 2343.5,-2026.5 2349.5,-2026.5 2355.5,-2032.5 2355.5,-2038.5 2355.5,-2038.5 2355.5,-2313.5 2355.5,-2313.5 2355.5,-2319.5 2349.5,-2325.5 2343.5,-2325.5 2343.5,-2325.5 2090.5,-2325.5 2090.5,-2325.5 2084.5,-2325.5 2078.5,-2319.5 2078.5,-2313.5 2078.5,-2313.5 2078.5,-2038.5 2078.5,-2038.5 2078.5,-2032.5 2084.5,-2026.5 2090.5,-2026.5"/>
<text text-anchor="middle" x="2127.5" y="-2172.3" font-family="Times,serif" font-size="14.00">disease_extent</text>
<polyline fill="none" stroke="black" points="2176.5,-2026.5 2176.5,-2325.5 "/>
<text text-anchor="middle" x="2186.5" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2196.5,-2026.5 2196.5,-2325.5 "/>
<text text-anchor="middle" x="2266" y="-2310.3" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="2196.5,-2302.5 2335.5,-2302.5 "/>
<text text-anchor="middle" x="2266" y="-2287.3" font-family="Times,serif" font-size="14.00">date_of_evaluation</text>
<polyline fill="none" stroke="black" points="2196.5,-2279.5 2335.5,-2279.5 "/>
<text text-anchor="middle" x="2266" y="-2264.3" font-family="Times,serif" font-size="14.00">evaluation_code</text>
<polyline fill="none" stroke="black" points="2196.5,-2256.5 2335.5,-2256.5 "/>
<text text-anchor="middle" x="2266" y="-2241.3" font-family="Times,serif" font-size="14.00">evaluation_number</text>
<polyline fill="none" stroke="black" points="2196.5,-2233.5 2335.5,-2233.5 "/>
<text text-anchor="middle" x="2266" y="-2218.3" font-family="Times,serif" font-size="14.00">lesion_description</text>
<polyline fill="none" stroke="black" points="2196.5,-2210.5 2335.5,-2210.5 "/>
<text text-anchor="middle" x="2266" y="-2195.3" font-family="Times,serif" font-size="14.00">lesion_number</text>
<polyline fill="none" stroke="black" points="2196.5,-2187.5 2335.5,-2187.5 "/>
<text text-anchor="middle" x="2266" y="-2172.3" font-family="Times,serif" font-size="14.00">lesion_site</text>
<polyline fill="none" stroke="black" points="2196.5,-2164.5 2335.5,-2164.5 "/>
<text text-anchor="middle" x="2266" y="-2149.3" font-family="Times,serif" font-size="14.00">longest_measurement</text>
<polyline fill="none" stroke="black" points="2196.5,-2141.5 2335.5,-2141.5 "/>
<text text-anchor="middle" x="2266" y="-2126.3" font-family="Times,serif" font-size="14.00">measurable_lesion</text>
<polyline fill="none" stroke="black" points="2196.5,-2118.5 2335.5,-2118.5 "/>
<text text-anchor="middle" x="2266" y="-2103.3" font-family="Times,serif" font-size="14.00">measured_how</text>
<polyline fill="none" stroke="black" points="2196.5,-2095.5 2335.5,-2095.5 "/>
<text text-anchor="middle" x="2266" y="-2080.3" font-family="Times,serif" font-size="14.00">previously_irradiated</text>
<polyline fill="none" stroke="black" points="2196.5,-2072.5 2335.5,-2072.5 "/>
<text text-anchor="middle" x="2266" y="-2057.3" font-family="Times,serif" font-size="14.00">previously_treated</text>
<polyline fill="none" stroke="black" points="2196.5,-2049.5 2335.5,-2049.5 "/>
<text text-anchor="middle" x="2266" y="-2034.3" font-family="Times,serif" font-size="14.00">target_lesion</text>
<polyline fill="none" stroke="black" points="2335.5,-2026.5 2335.5,-2325.5 "/>
<text text-anchor="middle" x="2345.5" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge34" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="black" d="M2164.16,-2026.46C2140.35,-1972.1 2108.59,-1912.36 2069,-1865 2023.22,-1810.23 1953.8,-1765.04 1906.53,-1738.08"/>
<polygon fill="black" stroke="black" points="1908.11,-1734.96 1897.68,-1733.1 1904.68,-1741.06 1908.11,-1734.96"/>
<text text-anchor="middle" x="2073" y="-1835.8" font-family="Times,serif" font-size="14.00">on_visit</text>
</g>
<!-- file -->
<g id="node13" class="node">
<title>file</title>
<path fill="none" stroke="black" d="M2859,-2934.5C2859,-2934.5 3013,-2934.5 3013,-2934.5 3019,-2934.5 3025,-2940.5 3025,-2946.5 3025,-2946.5 3025,-3129.5 3025,-3129.5 3025,-3135.5 3019,-3141.5 3013,-3141.5 3013,-3141.5 2859,-3141.5 2859,-3141.5 2853,-3141.5 2847,-3135.5 2847,-3129.5 2847,-3129.5 2847,-2946.5 2847,-2946.5 2847,-2940.5 2853,-2934.5 2859,-2934.5"/>
<text text-anchor="middle" x="2864" y="-3034.3" font-family="Times,serif" font-size="14.00">file</text>
<polyline fill="none" stroke="black" points="2881,-2934.5 2881,-3141.5 "/>
<text text-anchor="middle" x="2891" y="-3034.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2901,-2934.5 2901,-3141.5 "/>
<text text-anchor="middle" x="2953" y="-3126.3" font-family="Times,serif" font-size="14.00">file_description</text>
<polyline fill="none" stroke="black" points="2901,-3118.5 3005,-3118.5 "/>
<text text-anchor="middle" x="2953" y="-3103.3" font-family="Times,serif" font-size="14.00">file_format</text>
<polyline fill="none" stroke="black" points="2901,-3095.5 3005,-3095.5 "/>
<text text-anchor="middle" x="2953" y="-3080.3" font-family="Times,serif" font-size="14.00">file_location</text>
<polyline fill="none" stroke="black" points="2901,-3072.5 3005,-3072.5 "/>
<text text-anchor="middle" x="2953" y="-3057.3" font-family="Times,serif" font-size="14.00">file_name</text>
<polyline fill="none" stroke="black" points="2901,-3049.5 3005,-3049.5 "/>
<text text-anchor="middle" x="2953" y="-3034.3" font-family="Times,serif" font-size="14.00">file_size</text>
<polyline fill="none" stroke="black" points="2901,-3026.5 3005,-3026.5 "/>
<text text-anchor="middle" x="2953" y="-3011.3" font-family="Times,serif" font-size="14.00">file_status</text>
<polyline fill="none" stroke="black" points="2901,-3003.5 3005,-3003.5 "/>
<text text-anchor="middle" x="2953" y="-2988.3" font-family="Times,serif" font-size="14.00">file_type</text>
<polyline fill="none" stroke="black" points="2901,-2980.5 3005,-2980.5 "/>
<text text-anchor="middle" x="2953" y="-2965.3" font-family="Times,serif" font-size="14.00">md5sum</text>
<polyline fill="none" stroke="black" points="2901,-2957.5 3005,-2957.5 "/>
<text text-anchor="middle" x="2953" y="-2942.3" font-family="Times,serif" font-size="14.00">uuid</text>
<polyline fill="none" stroke="black" points="3005,-2934.5 3005,-3141.5 "/>
<text text-anchor="middle" x="3015" y="-3034.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge19" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="black" d="M2846.78,-3034.43C2447.48,-3022.37 844,-2967.59 844,-2865.5 844,-2865.5 844,-2865.5 844,-1450 844,-1004.06 854.18,-891.05 913,-449 914.78,-435.65 916.95,-421.71 919.3,-407.91"/>
<polygon fill="black" stroke="black" points="922.78,-408.34 921.04,-397.89 915.88,-407.14 922.78,-408.34"/>
<text text-anchor="middle" x="869.5" y="-1317.8" font-family="Times,serif" font-size="14.00">of_study</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge24" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="black" d="M2936,-2934.27C2936,-2919.13 2936,-2904.73 2936,-2893.05"/>
<polygon fill="black" stroke="black" points="2939.5,-2892.76 2936,-2882.76 2932.5,-2892.76 2939.5,-2892.76"/>
<text text-anchor="middle" x="2960.5" y="-2904.8" font-family="Times,serif" font-size="14.00">of_assay</text>
</g>
<!-- file&#45;&gt;case -->
<g id="edge6" class="edge">
<title>file&#45;&gt;case</title>
<path fill="none" stroke="black" d="M3025.14,-2979.85C3153.26,-2891.87 3384.56,-2709.84 3480,-2487 3593.17,-2222.76 3499,-2127.96 3499,-1840.5 3499,-1840.5 3499,-1840.5 3499,-1450 3499,-1317.13 2517.37,-1267.46 2181.29,-1254.36"/>
<polygon fill="black" stroke="black" points="2181.18,-1250.85 2171.05,-1253.96 2180.91,-1257.84 2181.18,-1250.85"/>
<text text-anchor="middle" x="3520.5" y="-1835.8" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
<!-- diagnosis -->
<g id="node23" class="node">
<title>diagnosis</title>
<path fill="none" stroke="black" d="M3498.5,-2505.5C3498.5,-2505.5 3779.5,-2505.5 3779.5,-2505.5 3785.5,-2505.5 3791.5,-2511.5 3791.5,-2517.5 3791.5,-2517.5 3791.5,-2815.5 3791.5,-2815.5 3791.5,-2821.5 3785.5,-2827.5 3779.5,-2827.5 3779.5,-2827.5 3498.5,-2827.5 3498.5,-2827.5 3492.5,-2827.5 3486.5,-2821.5 3486.5,-2815.5 3486.5,-2815.5 3486.5,-2517.5 3486.5,-2517.5 3486.5,-2511.5 3492.5,-2505.5 3498.5,-2505.5"/>
<text text-anchor="middle" x="3521" y="-2662.8" font-family="Times,serif" font-size="14.00">diagnosis</text>
<polyline fill="none" stroke="black" points="3555.5,-2505.5 3555.5,-2827.5 "/>
<text text-anchor="middle" x="3565.5" y="-2662.8" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="3575.5,-2505.5 3575.5,-2827.5 "/>
<text text-anchor="middle" x="3673.5" y="-2812.3" font-family="Times,serif" font-size="14.00">best_response</text>
<polyline fill="none" stroke="black" points="3575.5,-2804.5 3771.5,-2804.5 "/>
<text text-anchor="middle" x="3673.5" y="-2789.3" font-family="Times,serif" font-size="14.00">concurrent_disease</text>
<polyline fill="none" stroke="black" points="3575.5,-2781.5 3771.5,-2781.5 "/>
<text text-anchor="middle" x="3673.5" y="-2766.3" font-family="Times,serif" font-size="14.00">concurrent_disease_type</text>
<polyline fill="none" stroke="black" points="3575.5,-2758.5 3771.5,-2758.5 "/>
<text text-anchor="middle" x="3673.5" y="-2743.3" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="3575.5,-2735.5 3771.5,-2735.5 "/>
<text text-anchor="middle" x="3673.5" y="-2720.3" font-family="Times,serif" font-size="14.00">date_of_diagnosis</text>
<polyline fill="none" stroke="black" points="3575.5,-2712.5 3771.5,-2712.5 "/>
<text text-anchor="middle" x="3673.5" y="-2697.3" font-family="Times,serif" font-size="14.00">date_of_histology_confirmation</text>
<polyline fill="none" stroke="black" points="3575.5,-2689.5 3771.5,-2689.5 "/>
<text text-anchor="middle" x="3673.5" y="-2674.3" font-family="Times,serif" font-size="14.00">disease_term</text>
<polyline fill="none" stroke="black" points="3575.5,-2666.5 3771.5,-2666.5 "/>
<text text-anchor="middle" x="3673.5" y="-2651.3" font-family="Times,serif" font-size="14.00">follow_up_data</text>
<polyline fill="none" stroke="black" points="3575.5,-2643.5 3771.5,-2643.5 "/>
<text text-anchor="middle" x="3673.5" y="-2628.3" font-family="Times,serif" font-size="14.00">histological_grade</text>
<polyline fill="none" stroke="black" points="3575.5,-2620.5 3771.5,-2620.5 "/>
<text text-anchor="middle" x="3673.5" y="-2605.3" font-family="Times,serif" font-size="14.00">histology_cytopathology</text>
<polyline fill="none" stroke="black" points="3575.5,-2597.5 3771.5,-2597.5 "/>
<text text-anchor="middle" x="3673.5" y="-2582.3" font-family="Times,serif" font-size="14.00">pathology_report</text>
<polyline fill="none" stroke="black" points="3575.5,-2574.5 3771.5,-2574.5 "/>
<text text-anchor="middle" x="3673.5" y="-2559.3" font-family="Times,serif" font-size="14.00">primary_disease_site</text>
<polyline fill="none" stroke="black" points="3575.5,-2551.5 3771.5,-2551.5 "/>
<text text-anchor="middle" x="3673.5" y="-2536.3" font-family="Times,serif" font-size="14.00">stage_of_disease</text>
<polyline fill="none" stroke="black" points="3575.5,-2528.5 3771.5,-2528.5 "/>
<text text-anchor="middle" x="3673.5" y="-2513.3" font-family="Times,serif" font-size="14.00">treatment_data</text>
<polyline fill="none" stroke="black" points="3771.5,-2505.5 3771.5,-2827.5 "/>
<text text-anchor="middle" x="3781.5" y="-2662.8" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge16" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="black" d="M3025.02,-3025.91C3160.86,-3007.6 3411.84,-2967.84 3485,-2916 3514.53,-2895.08 3539.55,-2866.54 3560.29,-2836.24"/>
<polygon fill="black" stroke="black" points="3563.38,-2837.91 3566.03,-2827.65 3557.56,-2834.02 3563.38,-2837.91"/>
<text text-anchor="middle" x="3546" y="-2904.8" font-family="Times,serif" font-size="14.00">from_diagnosis</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge39" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="black" d="M2846.64,-3032.14C2600.54,-3017.1 1919.81,-2963.89 1749,-2828 1645.53,-2745.68 1580.27,-2617.39 1539.38,-2496.39"/>
<polygon fill="black" stroke="black" points="1542.6,-2494.96 1536.12,-2486.57 1535.95,-2497.17 1542.6,-2494.96"/>
<text text-anchor="middle" x="1874.5" y="-2860.8" font-family="Times,serif" font-size="14.00">of_sample</text>
</g>
<!-- registration -->
<g id="node14" class="node">
<title>registration</title>
<path fill="none" stroke="black" d="M2768.5,-1428C2768.5,-1428 2985.5,-1428 2985.5,-1428 2991.5,-1428 2997.5,-1434 2997.5,-1440 2997.5,-1440 2997.5,-1462 2997.5,-1462 2997.5,-1468 2991.5,-1474 2985.5,-1474 2985.5,-1474 2768.5,-1474 2768.5,-1474 2762.5,-1474 2756.5,-1468 2756.5,-1462 2756.5,-1462 2756.5,-1440 2756.5,-1440 2756.5,-1434 2762.5,-1428 2768.5,-1428"/>
<text text-anchor="middle" x="2796.5" y="-1447.3" font-family="Times,serif" font-size="14.00">registration</text>
<polyline fill="none" stroke="black" points="2836.5,-1428 2836.5,-1474 "/>
<text text-anchor="middle" x="2846.5" y="-1447.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2856.5,-1428 2856.5,-1474 "/>
<text text-anchor="middle" x="2917" y="-1458.8" font-family="Times,serif" font-size="14.00">registration_id</text>
<polyline fill="none" stroke="black" points="2856.5,-1451 2977.5,-1451 "/>
<text text-anchor="middle" x="2917" y="-1435.8" font-family="Times,serif" font-size="14.00">registration_origin</text>
<polyline fill="none" stroke="black" points="2977.5,-1428 2977.5,-1474 "/>
<text text-anchor="middle" x="2987.5" y="-1447.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- registration&#45;&gt;case -->
<g id="edge2" class="edge">
<title>registration&#45;&gt;case</title>
<path fill="none" stroke="black" d="M2856.57,-1427.75C2832.95,-1403.57 2791.68,-1365.86 2748,-1347 2648.5,-1304.04 2346.87,-1273.33 2181.46,-1259.21"/>
<polygon fill="black" stroke="black" points="2181.52,-1255.7 2171.26,-1258.34 2180.93,-1262.67 2181.52,-1255.7"/>
<text text-anchor="middle" x="2703.5" y="-1317.8" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
<!-- image_collection -->
<g id="node15" class="node">
<title>image_collection</title>
<path fill="none" stroke="black" d="M2622.5,-461C2622.5,-461 2901.5,-461 2901.5,-461 2907.5,-461 2913.5,-467 2913.5,-473 2913.5,-473 2913.5,-564 2913.5,-564 2913.5,-570 2907.5,-576 2901.5,-576 2901.5,-576 2622.5,-576 2622.5,-576 2616.5,-576 2610.5,-570 2610.5,-564 2610.5,-564 2610.5,-473 2610.5,-473 2610.5,-467 2616.5,-461 2622.5,-461"/>
<text text-anchor="middle" x="2667" y="-514.8" font-family="Times,serif" font-size="14.00">image_collection</text>
<polyline fill="none" stroke="black" points="2723.5,-461 2723.5,-576 "/>
<text text-anchor="middle" x="2733.5" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2743.5,-461 2743.5,-576 "/>
<text text-anchor="middle" x="2818.5" y="-560.8" font-family="Times,serif" font-size="14.00">collection_access</text>
<polyline fill="none" stroke="black" points="2743.5,-553 2893.5,-553 "/>
<text text-anchor="middle" x="2818.5" y="-537.8" font-family="Times,serif" font-size="14.00">image_collection_name</text>
<polyline fill="none" stroke="black" points="2743.5,-530 2893.5,-530 "/>
<text text-anchor="middle" x="2818.5" y="-514.8" font-family="Times,serif" font-size="14.00">image_collection_url</text>
<polyline fill="none" stroke="black" points="2743.5,-507 2893.5,-507 "/>
<text text-anchor="middle" x="2818.5" y="-491.8" font-family="Times,serif" font-size="14.00">image_type_included</text>
<polyline fill="none" stroke="black" points="2743.5,-484 2893.5,-484 "/>
<text text-anchor="middle" x="2818.5" y="-468.8" font-family="Times,serif" font-size="14.00">repository_name</text>
<polyline fill="none" stroke="black" points="2893.5,-461 2893.5,-576 "/>
<text text-anchor="middle" x="2903.5" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- image_collection&#45;&gt;study -->
<g id="edge21" class="edge">
<title>image_collection&#45;&gt;study</title>
<path fill="none" stroke="black" d="M2686.37,-460.81C2659.23,-443.38 2627.52,-426.13 2596,-416 2314.98,-325.7 1423.07,-302.43 1079.12,-296.74"/>
<polygon fill="black" stroke="black" points="1079.16,-293.24 1069.11,-296.58 1079.05,-300.24 1079.16,-293.24"/>
<text text-anchor="middle" x="2654.5" y="-419.8" font-family="Times,serif" font-size="14.00">of_study</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge45" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="black" d="M2171.07,-1242.37C2297.39,-1232.42 2502.99,-1207.92 2552,-1152 2609.8,-1086.06 2582,-1044.69 2582,-957 2582,-957 2582,-957 2582,-517.5 2582,-366.34 1473.83,-313.35 1079.36,-299.27"/>
<polygon fill="black" stroke="black" points="1079.44,-295.77 1069.32,-298.92 1079.19,-302.77 1079.44,-295.77"/>
<text text-anchor="middle" x="2614.5" y="-670.3" font-family="Times,serif" font-size="14.00">member_of</text>
</g>
<!-- cohort -->
<g id="node17" class="node">
<title>cohort</title>
<path fill="none" stroke="black" d="M1220.5,-639.5C1220.5,-639.5 1409.5,-639.5 1409.5,-639.5 1415.5,-639.5 1421.5,-645.5 1421.5,-651.5 1421.5,-651.5 1421.5,-696.5 1421.5,-696.5 1421.5,-702.5 1415.5,-708.5 1409.5,-708.5 1409.5,-708.5 1220.5,-708.5 1220.5,-708.5 1214.5,-708.5 1208.5,-702.5 1208.5,-696.5 1208.5,-696.5 1208.5,-651.5 1208.5,-651.5 1208.5,-645.5 1214.5,-639.5 1220.5,-639.5"/>
<text text-anchor="middle" x="1234.5" y="-670.3" font-family="Times,serif" font-size="14.00">cohort</text>
<polyline fill="none" stroke="black" points="1260.5,-639.5 1260.5,-708.5 "/>
<text text-anchor="middle" x="1270.5" y="-670.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1280.5,-639.5 1280.5,-708.5 "/>
<text text-anchor="middle" x="1341" y="-693.3" font-family="Times,serif" font-size="14.00">cohort_description</text>
<polyline fill="none" stroke="black" points="1280.5,-685.5 1401.5,-685.5 "/>
<text text-anchor="middle" x="1341" y="-670.3" font-family="Times,serif" font-size="14.00">cohort_dose</text>
<polyline fill="none" stroke="black" points="1280.5,-662.5 1401.5,-662.5 "/>
<text text-anchor="middle" x="1341" y="-647.3" font-family="Times,serif" font-size="14.00">cohort_id</text>
<polyline fill="none" stroke="black" points="1401.5,-639.5 1401.5,-708.5 "/>
<text text-anchor="middle" x="1411.5" y="-670.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge44" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="black" d="M2171.28,-1237.66C2275.18,-1224.2 2426.5,-1197.3 2462,-1152 2488.87,-1117.72 2491.64,-791.92 2462,-760 2392.92,-685.61 1709.79,-675.77 1431.78,-674.87"/>
<polygon fill="black" stroke="black" points="1431.67,-671.37 1421.66,-674.84 1431.65,-678.37 1431.67,-671.37"/>
<text text-anchor="middle" x="2515.5" y="-952.3" font-family="Times,serif" font-size="14.00">member_of</text>
</g>
<!-- adverse_event -->
<g id="node18" class="node">
<title>adverse_event</title>
<path fill="none" stroke="black" d="M1681.5,-760.5C1681.5,-760.5 1998.5,-760.5 1998.5,-760.5 2004.5,-760.5 2010.5,-766.5 2010.5,-772.5 2010.5,-772.5 2010.5,-1139.5 2010.5,-1139.5 2010.5,-1145.5 2004.5,-1151.5 1998.5,-1151.5 1998.5,-1151.5 1681.5,-1151.5 1681.5,-1151.5 1675.5,-1151.5 1669.5,-1145.5 1669.5,-1139.5 1669.5,-1139.5 1669.5,-772.5 1669.5,-772.5 1669.5,-766.5 1675.5,-760.5 1681.5,-760.5"/>
<text text-anchor="middle" x="1718" y="-952.3" font-family="Times,serif" font-size="14.00">adverse_event</text>
<polyline fill="none" stroke="black" points="1766.5,-760.5 1766.5,-1151.5 "/>
<text text-anchor="middle" x="1776.5" y="-952.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1786.5,-760.5 1786.5,-1151.5 "/>
<text text-anchor="middle" x="1888.5" y="-1136.3" font-family="Times,serif" font-size="14.00">adverse_event_description</text>
<polyline fill="none" stroke="black" points="1786.5,-1128.5 1990.5,-1128.5 "/>
<text text-anchor="middle" x="1888.5" y="-1113.3" font-family="Times,serif" font-size="14.00">adverse_event_grade</text>
<polyline fill="none" stroke="black" points="1786.5,-1105.5 1990.5,-1105.5 "/>
<text text-anchor="middle" x="1888.5" y="-1090.3" font-family="Times,serif" font-size="14.00">adverse_event_grade_description</text>
<polyline fill="none" stroke="black" points="1786.5,-1082.5 1990.5,-1082.5 "/>
<text text-anchor="middle" x="1888.5" y="-1067.3" font-family="Times,serif" font-size="14.00">adverse_event_term</text>
<polyline fill="none" stroke="black" points="1786.5,-1059.5 1990.5,-1059.5 "/>
<text text-anchor="middle" x="1888.5" y="-1044.3" font-family="Times,serif" font-size="14.00">ae_agent_name</text>
<polyline fill="none" stroke="black" points="1786.5,-1036.5 1990.5,-1036.5 "/>
<text text-anchor="middle" x="1888.5" y="-1021.3" font-family="Times,serif" font-size="14.00">ae_dose</text>
<polyline fill="none" stroke="black" points="1786.5,-1013.5 1990.5,-1013.5 "/>
<text text-anchor="middle" x="1888.5" y="-998.3" font-family="Times,serif" font-size="14.00">ae_other</text>
<polyline fill="none" stroke="black" points="1786.5,-990.5 1990.5,-990.5 "/>
<text text-anchor="middle" x="1888.5" y="-975.3" font-family="Times,serif" font-size="14.00">attribution_to_commercial</text>
<polyline fill="none" stroke="black" points="1786.5,-967.5 1990.5,-967.5 "/>
<text text-anchor="middle" x="1888.5" y="-952.3" font-family="Times,serif" font-size="14.00">attribution_to_disease</text>
<polyline fill="none" stroke="black" points="1786.5,-944.5 1990.5,-944.5 "/>
<text text-anchor="middle" x="1888.5" y="-929.3" font-family="Times,serif" font-size="14.00">attribution_to_ind</text>
<polyline fill="none" stroke="black" points="1786.5,-921.5 1990.5,-921.5 "/>
<text text-anchor="middle" x="1888.5" y="-906.3" font-family="Times,serif" font-size="14.00">attribution_to_other</text>
<polyline fill="none" stroke="black" points="1786.5,-898.5 1990.5,-898.5 "/>
<text text-anchor="middle" x="1888.5" y="-883.3" font-family="Times,serif" font-size="14.00">attribution_to_research</text>
<polyline fill="none" stroke="black" points="1786.5,-875.5 1990.5,-875.5 "/>
<text text-anchor="middle" x="1888.5" y="-860.3" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="1786.5,-852.5 1990.5,-852.5 "/>
<text text-anchor="middle" x="1888.5" y="-837.3" font-family="Times,serif" font-size="14.00">date_resolved</text>
<polyline fill="none" stroke="black" points="1786.5,-829.5 1990.5,-829.5 "/>
<text text-anchor="middle" x="1888.5" y="-814.3" font-family="Times,serif" font-size="14.00">day_in_cycle</text>
<polyline fill="none" stroke="black" points="1786.5,-806.5 1990.5,-806.5 "/>
<text text-anchor="middle" x="1888.5" y="-791.3" font-family="Times,serif" font-size="14.00">dose_limiting_toxicity</text>
<polyline fill="none" stroke="black" points="1786.5,-783.5 1990.5,-783.5 "/>
<text text-anchor="middle" x="1888.5" y="-768.3" font-family="Times,serif" font-size="14.00">unexpected_adverse_event</text>
<polyline fill="none" stroke="black" points="1990.5,-760.5 1990.5,-1151.5 "/>
<text text-anchor="middle" x="2000.5" y="-952.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge22" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="black" d="M1968.58,-1229.41C1942.14,-1219.99 1915.82,-1205.94 1897,-1185 1890.2,-1177.43 1884.18,-1169.17 1878.86,-1160.43"/>
<polygon fill="black" stroke="black" points="1881.78,-1158.48 1873.77,-1151.54 1875.7,-1161.96 1881.78,-1158.48"/>
<text text-anchor="middle" x="1951" y="-1173.8" font-family="Times,serif" font-size="14.00">had_adverse_event</text>
</g>
<!-- canine_individual -->
<g id="node22" class="node">
<title>canine_individual</title>
<path fill="none" stroke="black" d="M994,-938C994,-938 1262,-938 1262,-938 1268,-938 1274,-944 1274,-950 1274,-950 1274,-962 1274,-962 1274,-968 1268,-974 1262,-974 1262,-974 994,-974 994,-974 988,-974 982,-968 982,-962 982,-962 982,-950 982,-950 982,-944 988,-938 994,-938"/>
<text text-anchor="middle" x="1040.5" y="-952.3" font-family="Times,serif" font-size="14.00">canine_individual</text>
<polyline fill="none" stroke="black" points="1099,-938 1099,-974 "/>
<text text-anchor="middle" x="1109" y="-952.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1119,-938 1119,-974 "/>
<text text-anchor="middle" x="1186.5" y="-952.3" font-family="Times,serif" font-size="14.00">canine_individual_id</text>
<polyline fill="none" stroke="black" points="1254,-938 1254,-974 "/>
<text text-anchor="middle" x="1264" y="-952.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- case&#45;&gt;canine_individual -->
<g id="edge42" class="edge">
<title>case&#45;&gt;canine_individual</title>
<path fill="none" stroke="black" d="M1968.65,-1245.53C1783.33,-1238.57 1398.29,-1216.58 1283,-1152 1212.49,-1112.51 1162.33,-1026.77 1140.38,-983.34"/>
<polygon fill="black" stroke="black" points="1143.46,-981.67 1135.89,-974.25 1137.18,-984.77 1143.46,-981.67"/>
<text text-anchor="middle" x="1401.5" y="-1173.8" font-family="Times,serif" font-size="14.00">represents</text>
</g>
<!-- off_study -->
<g id="node24" class="node">
<title>off_study</title>
<path fill="none" stroke="black" d="M1304.5,-852.5C1304.5,-852.5 1639.5,-852.5 1639.5,-852.5 1645.5,-852.5 1651.5,-858.5 1651.5,-864.5 1651.5,-864.5 1651.5,-1047.5 1651.5,-1047.5 1651.5,-1053.5 1645.5,-1059.5 1639.5,-1059.5 1639.5,-1059.5 1304.5,-1059.5 1304.5,-1059.5 1298.5,-1059.5 1292.5,-1053.5 1292.5,-1047.5 1292.5,-1047.5 1292.5,-864.5 1292.5,-864.5 1292.5,-858.5 1298.5,-852.5 1304.5,-852.5"/>
<text text-anchor="middle" x="1327.5" y="-952.3" font-family="Times,serif" font-size="14.00">off_study</text>
<polyline fill="none" stroke="black" points="1362.5,-852.5 1362.5,-1059.5 "/>
<text text-anchor="middle" x="1372.5" y="-952.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1382.5,-852.5 1382.5,-1059.5 "/>
<text text-anchor="middle" x="1507" y="-1044.3" font-family="Times,serif" font-size="14.00">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="black" points="1382.5,-1036.5 1631.5,-1036.5 "/>
<text text-anchor="middle" x="1507" y="-1021.3" font-family="Times,serif" font-size="14.00">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="black" points="1382.5,-1013.5 1631.5,-1013.5 "/>
<text text-anchor="middle" x="1507" y="-998.3" font-family="Times,serif" font-size="14.00">date_last_medication_administration</text>
<polyline fill="none" stroke="black" points="1382.5,-990.5 1631.5,-990.5 "/>
<text text-anchor="middle" x="1507" y="-975.3" font-family="Times,serif" font-size="14.00">date_of_best_response</text>
<polyline fill="none" stroke="black" points="1382.5,-967.5 1631.5,-967.5 "/>
<text text-anchor="middle" x="1507" y="-952.3" font-family="Times,serif" font-size="14.00">date_of_disease_progression</text>
<polyline fill="none" stroke="black" points="1382.5,-944.5 1631.5,-944.5 "/>
<text text-anchor="middle" x="1507" y="-929.3" font-family="Times,serif" font-size="14.00">date_off_study</text>
<polyline fill="none" stroke="black" points="1382.5,-921.5 1631.5,-921.5 "/>
<text text-anchor="middle" x="1507" y="-906.3" font-family="Times,serif" font-size="14.00">date_off_treatment</text>
<polyline fill="none" stroke="black" points="1382.5,-898.5 1631.5,-898.5 "/>
<text text-anchor="middle" x="1507" y="-883.3" font-family="Times,serif" font-size="14.00">document_number</text>
<polyline fill="none" stroke="black" points="1382.5,-875.5 1631.5,-875.5 "/>
<text text-anchor="middle" x="1507" y="-860.3" font-family="Times,serif" font-size="14.00">reason_off_study</text>
<polyline fill="none" stroke="black" points="1631.5,-852.5 1631.5,-1059.5 "/>
<text text-anchor="middle" x="1641.5" y="-952.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge43" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="black" d="M1968.81,-1241.03C1881.97,-1230.94 1756,-1207.29 1660,-1152 1622.18,-1130.22 1587.07,-1098.6 1557.68,-1067.14"/>
<polygon fill="black" stroke="black" points="1560.07,-1064.57 1550.73,-1059.58 1554.92,-1069.31 1560.07,-1064.57"/>
<text text-anchor="middle" x="1766" y="-1173.8" font-family="Times,serif" font-size="14.00">went_off_study</text>
</g>
<!-- study_arm -->
<g id="node25" class="node">
<title>study_arm</title>
<path fill="none" stroke="black" d="M934.5,-472.5C934.5,-472.5 1229.5,-472.5 1229.5,-472.5 1235.5,-472.5 1241.5,-478.5 1241.5,-484.5 1241.5,-484.5 1241.5,-552.5 1241.5,-552.5 1241.5,-558.5 1235.5,-564.5 1229.5,-564.5 1229.5,-564.5 934.5,-564.5 934.5,-564.5 928.5,-564.5 922.5,-558.5 922.5,-552.5 922.5,-552.5 922.5,-484.5 922.5,-484.5 922.5,-478.5 928.5,-472.5 934.5,-472.5"/>
<text text-anchor="middle" x="960.5" y="-514.8" font-family="Times,serif" font-size="14.00">study_arm</text>
<polyline fill="none" stroke="black" points="998.5,-472.5 998.5,-564.5 "/>
<text text-anchor="middle" x="1008.5" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1018.5,-472.5 1018.5,-564.5 "/>
<text text-anchor="middle" x="1120" y="-549.3" font-family="Times,serif" font-size="14.00">arm</text>
<polyline fill="none" stroke="black" points="1018.5,-541.5 1221.5,-541.5 "/>
<text text-anchor="middle" x="1120" y="-526.3" font-family="Times,serif" font-size="14.00">arm_description</text>
<polyline fill="none" stroke="black" points="1018.5,-518.5 1221.5,-518.5 "/>
<text text-anchor="middle" x="1120" y="-503.3" font-family="Times,serif" font-size="14.00">arm_id</text>
<polyline fill="none" stroke="black" points="1018.5,-495.5 1221.5,-495.5 "/>
<text text-anchor="middle" x="1120" y="-480.3" font-family="Times,serif" font-size="14.00">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="black" points="1221.5,-472.5 1221.5,-564.5 "/>
<text text-anchor="middle" x="1231.5" y="-514.8" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- case&#45;&gt;study_arm -->
<g id="edge26" class="edge">
<title>case&#45;&gt;study_arm</title>
<path fill="none" stroke="black" d="M1968.86,-1247.23C1710.04,-1242.95 1039.33,-1224.84 973,-1152 896.24,-1067.71 931.8,-745.3 973,-639 982.76,-613.81 1000.58,-590.68 1019.02,-571.61"/>
<polygon fill="black" stroke="black" points="1021.53,-574.06 1026.11,-564.51 1016.57,-569.12 1021.53,-574.06"/>
<text text-anchor="middle" x="989" y="-730.8" font-family="Times,serif" font-size="14.00">of_study_arm</text>
</g>
<!-- off_treatment -->
<g id="node26" class="node">
<title>off_treatment</title>
<path fill="none" stroke="black" d="M2083.5,-864C2083.5,-864 2440.5,-864 2440.5,-864 2446.5,-864 2452.5,-870 2452.5,-876 2452.5,-876 2452.5,-1036 2452.5,-1036 2452.5,-1042 2446.5,-1048 2440.5,-1048 2440.5,-1048 2083.5,-1048 2083.5,-1048 2077.5,-1048 2071.5,-1042 2071.5,-1036 2071.5,-1036 2071.5,-876 2071.5,-876 2071.5,-870 2077.5,-864 2083.5,-864"/>
<text text-anchor="middle" x="2117.5" y="-952.3" font-family="Times,serif" font-size="14.00">off_treatment</text>
<polyline fill="none" stroke="black" points="2163.5,-864 2163.5,-1048 "/>
<text text-anchor="middle" x="2173.5" y="-952.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2183.5,-864 2183.5,-1048 "/>
<text text-anchor="middle" x="2308" y="-1032.8" font-family="Times,serif" font-size="14.00">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="black" points="2183.5,-1025 2432.5,-1025 "/>
<text text-anchor="middle" x="2308" y="-1009.8" font-family="Times,serif" font-size="14.00">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="black" points="2183.5,-1002 2432.5,-1002 "/>
<text text-anchor="middle" x="2308" y="-986.8" font-family="Times,serif" font-size="14.00">date_last_medication_administration</text>
<polyline fill="none" stroke="black" points="2183.5,-979 2432.5,-979 "/>
<text text-anchor="middle" x="2308" y="-963.8" font-family="Times,serif" font-size="14.00">date_of_best_response</text>
<polyline fill="none" stroke="black" points="2183.5,-956 2432.5,-956 "/>
<text text-anchor="middle" x="2308" y="-940.8" font-family="Times,serif" font-size="14.00">date_of_disease_progression</text>
<polyline fill="none" stroke="black" points="2183.5,-933 2432.5,-933 "/>
<text text-anchor="middle" x="2308" y="-917.8" font-family="Times,serif" font-size="14.00">date_off_treatment</text>
<polyline fill="none" stroke="black" points="2183.5,-910 2432.5,-910 "/>
<text text-anchor="middle" x="2308" y="-894.8" font-family="Times,serif" font-size="14.00">document_number</text>
<polyline fill="none" stroke="black" points="2183.5,-887 2432.5,-887 "/>
<text text-anchor="middle" x="2308" y="-871.8" font-family="Times,serif" font-size="14.00">reason_off_treatment</text>
<polyline fill="none" stroke="black" points="2432.5,-864 2432.5,-1048 "/>
<text text-anchor="middle" x="2442.5" y="-952.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge30" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="black" d="M2099.79,-1203.27C2125.48,-1164.27 2163.5,-1106.54 2196.28,-1056.78"/>
<polygon fill="black" stroke="black" points="2199.33,-1058.51 2201.91,-1048.23 2193.49,-1054.66 2199.33,-1058.51"/>
<text text-anchor="middle" x="2177.5" y="-1173.8" font-family="Times,serif" font-size="14.00">went_off_treatment</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge48" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="black" d="M1313.46,-639.11C1309.62,-591.52 1296.28,-504.52 1250,-449 1205.86,-396.03 1138.98,-359.54 1078.81,-335.42"/>
<polygon fill="black" stroke="black" points="1079.8,-332.05 1069.21,-331.65 1077.24,-338.56 1079.8,-332.05"/>
<text text-anchor="middle" x="1339.5" y="-514.8" font-family="Times,serif" font-size="14.00">member_of</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge47" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="black" d="M1250.95,-639.47C1240.47,-633.55 1229.83,-627.27 1220,-621 1195.88,-605.62 1170.4,-587.47 1147.99,-570.8"/>
<polygon fill="black" stroke="black" points="1149.99,-567.92 1139.88,-564.74 1145.79,-573.53 1149.99,-567.92"/>
<text text-anchor="middle" x="1252.5" y="-609.8" font-family="Times,serif" font-size="14.00">member_of</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge7" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="black" d="M1993.59,-1151.66C2005.98,-1167.36 2017.69,-1182.2 2028.05,-1195.33"/>
<polygon fill="black" stroke="black" points="2025.37,-1197.59 2034.31,-1203.27 2030.87,-1193.25 2025.37,-1197.59"/>
<text text-anchor="middle" x="2036.5" y="-1173.8" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge14" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="black" d="M2010.5,-985.44C2021.71,-978.6 2028.5,-968.78 2028.5,-956 2028.5,-946.61 2024.84,-938.83 2018.45,-932.64"/>
<polygon fill="black" stroke="black" points="2020.57,-929.86 2010.5,-926.56 2016.32,-935.42 2020.57,-929.86"/>
<text text-anchor="middle" x="2041" y="-952.3" font-family="Times,serif" font-size="14.00">next</text>
</g>
<!-- agent -->
<g id="node30" class="node">
<title>agent</title>
<path fill="none" stroke="black" d="M994,-651C994,-651 1178,-651 1178,-651 1184,-651 1190,-657 1190,-663 1190,-663 1190,-685 1190,-685 1190,-691 1184,-697 1178,-697 1178,-697 994,-697 994,-697 988,-697 982,-691 982,-685 982,-685 982,-663 982,-663 982,-657 988,-651 994,-651"/>
<text text-anchor="middle" x="1005.5" y="-670.3" font-family="Times,serif" font-size="14.00">agent</text>
<polyline fill="none" stroke="black" points="1029,-651 1029,-697 "/>
<text text-anchor="middle" x="1039" y="-670.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1049,-651 1049,-697 "/>
<text text-anchor="middle" x="1109.5" y="-681.8" font-family="Times,serif" font-size="14.00">document_number</text>
<polyline fill="none" stroke="black" points="1049,-674 1170,-674 "/>
<text text-anchor="middle" x="1109.5" y="-658.8" font-family="Times,serif" font-size="14.00">medication</text>
<polyline fill="none" stroke="black" points="1170,-651 1170,-697 "/>
<text text-anchor="middle" x="1180" y="-670.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge41" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="black" d="M1669.48,-765.07C1666.35,-763.3 1663.19,-761.61 1660,-760 1476.01,-667.05 1400.98,-750.2 1199,-709 1186.88,-706.53 1174.2,-703.33 1161.89,-699.89"/>
<polygon fill="black" stroke="black" points="1162.69,-696.48 1152.11,-697.09 1160.76,-703.21 1162.69,-696.48"/>
<text text-anchor="middle" x="1642.5" y="-730.8" font-family="Times,serif" font-size="14.00">of_agent</text>
</g>
<!-- agent_administration -->
<g id="node20" class="node">
<title>agent_administration</title>
<path fill="none" stroke="black" d="M884.5,-1934.5C884.5,-1934.5 1261.5,-1934.5 1261.5,-1934.5 1267.5,-1934.5 1273.5,-1940.5 1273.5,-1946.5 1273.5,-1946.5 1273.5,-2405.5 1273.5,-2405.5 1273.5,-2411.5 1267.5,-2417.5 1261.5,-2417.5 1261.5,-2417.5 884.5,-2417.5 884.5,-2417.5 878.5,-2417.5 872.5,-2411.5 872.5,-2405.5 872.5,-2405.5 872.5,-1946.5 872.5,-1946.5 872.5,-1940.5 878.5,-1934.5 884.5,-1934.5"/>
<text text-anchor="middle" x="940" y="-2172.3" font-family="Times,serif" font-size="14.00">agent_administration</text>
<polyline fill="none" stroke="black" points="1007.5,-1934.5 1007.5,-2417.5 "/>
<text text-anchor="middle" x="1017.5" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1027.5,-1934.5 1027.5,-2417.5 "/>
<text text-anchor="middle" x="1140.5" y="-2402.3" font-family="Times,serif" font-size="14.00">comment</text>
<polyline fill="none" stroke="black" points="1027.5,-2394.5 1253.5,-2394.5 "/>
<text text-anchor="middle" x="1140.5" y="-2379.3" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="1027.5,-2371.5 1253.5,-2371.5 "/>
<text text-anchor="middle" x="1140.5" y="-2356.3" font-family="Times,serif" font-size="14.00">date_of_missed_dose</text>
<polyline fill="none" stroke="black" points="1027.5,-2348.5 1253.5,-2348.5 "/>
<text text-anchor="middle" x="1140.5" y="-2333.3" font-family="Times,serif" font-size="14.00">document_number</text>
<polyline fill="none" stroke="black" points="1027.5,-2325.5 1253.5,-2325.5 "/>
<text text-anchor="middle" x="1140.5" y="-2310.3" font-family="Times,serif" font-size="14.00">dose_level</text>
<polyline fill="none" stroke="black" points="1027.5,-2302.5 1253.5,-2302.5 "/>
<text text-anchor="middle" x="1140.5" y="-2287.3" font-family="Times,serif" font-size="14.00">dose_units_of_measure</text>
<polyline fill="none" stroke="black" points="1027.5,-2279.5 1253.5,-2279.5 "/>
<text text-anchor="middle" x="1140.5" y="-2264.3" font-family="Times,serif" font-size="14.00">medication</text>
<polyline fill="none" stroke="black" points="1027.5,-2256.5 1253.5,-2256.5 "/>
<text text-anchor="middle" x="1140.5" y="-2241.3" font-family="Times,serif" font-size="14.00">medication_actual_dose</text>
<polyline fill="none" stroke="black" points="1027.5,-2233.5 1253.5,-2233.5 "/>
<text text-anchor="middle" x="1140.5" y="-2218.3" font-family="Times,serif" font-size="14.00">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="black" points="1027.5,-2210.5 1253.5,-2210.5 "/>
<text text-anchor="middle" x="1140.5" y="-2195.3" font-family="Times,serif" font-size="14.00">medication_course_number</text>
<polyline fill="none" stroke="black" points="1027.5,-2187.5 1253.5,-2187.5 "/>
<text text-anchor="middle" x="1140.5" y="-2172.3" font-family="Times,serif" font-size="14.00">medication_duration</text>
<polyline fill="none" stroke="black" points="1027.5,-2164.5 1253.5,-2164.5 "/>
<text text-anchor="middle" x="1140.5" y="-2149.3" font-family="Times,serif" font-size="14.00">medication_lot_number</text>
<polyline fill="none" stroke="black" points="1027.5,-2141.5 1253.5,-2141.5 "/>
<text text-anchor="middle" x="1140.5" y="-2126.3" font-family="Times,serif" font-size="14.00">medication_missed_dose</text>
<polyline fill="none" stroke="black" points="1027.5,-2118.5 1253.5,-2118.5 "/>
<text text-anchor="middle" x="1140.5" y="-2103.3" font-family="Times,serif" font-size="14.00">medication_units_of_measure</text>
<polyline fill="none" stroke="black" points="1027.5,-2095.5 1253.5,-2095.5 "/>
<text text-anchor="middle" x="1140.5" y="-2080.3" font-family="Times,serif" font-size="14.00">medication_vial_id</text>
<polyline fill="none" stroke="black" points="1027.5,-2072.5 1253.5,-2072.5 "/>
<text text-anchor="middle" x="1140.5" y="-2057.3" font-family="Times,serif" font-size="14.00">missed_dose_amount</text>
<polyline fill="none" stroke="black" points="1027.5,-2049.5 1253.5,-2049.5 "/>
<text text-anchor="middle" x="1140.5" y="-2034.3" font-family="Times,serif" font-size="14.00">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="black" points="1027.5,-2026.5 1253.5,-2026.5 "/>
<text text-anchor="middle" x="1140.5" y="-2011.3" font-family="Times,serif" font-size="14.00">phase</text>
<polyline fill="none" stroke="black" points="1027.5,-2003.5 1253.5,-2003.5 "/>
<text text-anchor="middle" x="1140.5" y="-1988.3" font-family="Times,serif" font-size="14.00">route_of_administration</text>
<polyline fill="none" stroke="black" points="1027.5,-1980.5 1253.5,-1980.5 "/>
<text text-anchor="middle" x="1140.5" y="-1965.3" font-family="Times,serif" font-size="14.00">start_time</text>
<polyline fill="none" stroke="black" points="1027.5,-1957.5 1253.5,-1957.5 "/>
<text text-anchor="middle" x="1140.5" y="-1942.3" font-family="Times,serif" font-size="14.00">stop_time</text>
<polyline fill="none" stroke="black" points="1253.5,-1934.5 1253.5,-2417.5 "/>
<text text-anchor="middle" x="1263.5" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge40" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="black" d="M958.9,-1934.48C934.55,-1864.05 916,-1785.84 916,-1711 916,-1711 916,-1711 916,-955 916,-852.96 879.64,-806.99 943,-727 951.17,-716.69 961.57,-708.42 973.03,-701.79"/>
<polygon fill="black" stroke="black" points="974.79,-704.82 981.98,-697.03 971.51,-698.64 974.79,-704.82"/>
<text text-anchor="middle" x="940.5" y="-1317.8" font-family="Times,serif" font-size="14.00">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge36" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="black" d="M1209.06,-1934.4C1231.19,-1908.35 1255.87,-1884.34 1283,-1865 1427.9,-1761.74 1638.2,-1727.71 1759.32,-1716.5"/>
<polygon fill="black" stroke="black" points="1759.67,-1719.99 1769.32,-1715.61 1759.05,-1713.01 1759.67,-1719.99"/>
<text text-anchor="middle" x="1347" y="-1835.8" font-family="Times,serif" font-size="14.00">on_visit</text>
</g>
<!-- cycle -->
<g id="node21" class="node">
<title>cycle</title>
<path fill="none" stroke="black" d="M1834,-1416.5C1834,-1416.5 2022,-1416.5 2022,-1416.5 2028,-1416.5 2034,-1422.5 2034,-1428.5 2034,-1428.5 2034,-1473.5 2034,-1473.5 2034,-1479.5 2028,-1485.5 2022,-1485.5 2022,-1485.5 1834,-1485.5 1834,-1485.5 1828,-1485.5 1822,-1479.5 1822,-1473.5 1822,-1473.5 1822,-1428.5 1822,-1428.5 1822,-1422.5 1828,-1416.5 1834,-1416.5"/>
<text text-anchor="middle" x="1845" y="-1447.3" font-family="Times,serif" font-size="14.00">cycle</text>
<polyline fill="none" stroke="black" points="1868,-1416.5 1868,-1485.5 "/>
<text text-anchor="middle" x="1878" y="-1447.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="1888,-1416.5 1888,-1485.5 "/>
<text text-anchor="middle" x="1951" y="-1470.3" font-family="Times,serif" font-size="14.00">cycle_number</text>
<polyline fill="none" stroke="black" points="1888,-1462.5 2014,-1462.5 "/>
<text text-anchor="middle" x="1951" y="-1447.3" font-family="Times,serif" font-size="14.00">date_of_cycle_end</text>
<polyline fill="none" stroke="black" points="1888,-1439.5 2014,-1439.5 "/>
<text text-anchor="middle" x="1951" y="-1424.3" font-family="Times,serif" font-size="14.00">date_of_cycle_start</text>
<polyline fill="none" stroke="black" points="2014,-1416.5 2014,-1485.5 "/>
<text text-anchor="middle" x="2024" y="-1447.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge4" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="black" d="M1946.9,-1416.24C1963.19,-1388.06 1987.97,-1347.26 2013,-1314 2015.56,-1310.6 2018.25,-1307.17 2021.03,-1303.75"/>
<polygon fill="black" stroke="black" points="2023.92,-1305.76 2027.62,-1295.83 2018.54,-1301.28 2023.92,-1305.76"/>
<text text-anchor="middle" x="2034.5" y="-1317.8" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge10" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="black" d="M3630.66,-2505.47C3622.73,-2339.29 3612,-2071.76 3612,-1840.5 3612,-1840.5 3612,-1840.5 3612,-1450 3612,-1375.24 3578.87,-1349.37 3513,-1314 3396.96,-1251.69 2499.5,-1248.89 2181.37,-1249.88"/>
<polygon fill="black" stroke="black" points="2181.2,-1246.38 2171.21,-1249.92 2181.22,-1253.38 2181.2,-1246.38"/>
<text text-anchor="middle" x="3633.5" y="-1706.3" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge46" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="black" d="M1053.67,-472.47C1041.57,-453.25 1026.86,-429.87 1012.15,-406.48"/>
<polygon fill="black" stroke="black" points="1015.02,-404.47 1006.73,-397.87 1009.09,-408.2 1015.02,-404.47"/>
<text text-anchor="middle" x="1057.5" y="-419.8" font-family="Times,serif" font-size="14.00">member_of</text>
</g>
<!-- prior_surgery -->
<g id="node27" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="black" d="M2683,-2095.5C2683,-2095.5 2963,-2095.5 2963,-2095.5 2969,-2095.5 2975,-2101.5 2975,-2107.5 2975,-2107.5 2975,-2244.5 2975,-2244.5 2975,-2250.5 2969,-2256.5 2963,-2256.5 2963,-2256.5 2683,-2256.5 2683,-2256.5 2677,-2256.5 2671,-2250.5 2671,-2244.5 2671,-2244.5 2671,-2107.5 2671,-2107.5 2671,-2101.5 2677,-2095.5 2683,-2095.5"/>
<text text-anchor="middle" x="2717" y="-2172.3" font-family="Times,serif" font-size="14.00">prior_surgery</text>
<polyline fill="none" stroke="black" points="2763,-2095.5 2763,-2256.5 "/>
<text text-anchor="middle" x="2773" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="2783,-2095.5 2783,-2256.5 "/>
<text text-anchor="middle" x="2869" y="-2241.3" font-family="Times,serif" font-size="14.00">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="black" points="2783,-2233.5 2955,-2233.5 "/>
<text text-anchor="middle" x="2869" y="-2218.3" font-family="Times,serif" font-size="14.00">crf_id</text>
<polyline fill="none" stroke="black" points="2783,-2210.5 2955,-2210.5 "/>
<text text-anchor="middle" x="2869" y="-2195.3" font-family="Times,serif" font-size="14.00">date_of_surgery</text>
<polyline fill="none" stroke="black" points="2783,-2187.5 2955,-2187.5 "/>
<text text-anchor="middle" x="2869" y="-2172.3" font-family="Times,serif" font-size="14.00">procedure</text>
<polyline fill="none" stroke="black" points="2783,-2164.5 2955,-2164.5 "/>
<text text-anchor="middle" x="2869" y="-2149.3" font-family="Times,serif" font-size="14.00">residual_disease</text>
<polyline fill="none" stroke="black" points="2783,-2141.5 2955,-2141.5 "/>
<text text-anchor="middle" x="2869" y="-2126.3" font-family="Times,serif" font-size="14.00">surgical_finding</text>
<polyline fill="none" stroke="black" points="2783,-2118.5 2955,-2118.5 "/>
<text text-anchor="middle" x="2869" y="-2103.3" font-family="Times,serif" font-size="14.00">therapeutic_indicator</text>
<polyline fill="none" stroke="black" points="2955,-2095.5 2955,-2256.5 "/>
<text text-anchor="middle" x="2965" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge12" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="black" d="M2975.21,-2222.5C2986.24,-2212.01 2993,-2196.51 2993,-2176 2993,-2159.98 2988.88,-2147.01 2981.81,-2137.1"/>
<polygon fill="black" stroke="black" points="2984.41,-2134.75 2975.21,-2129.5 2979.12,-2139.34 2984.41,-2134.75"/>
<text text-anchor="middle" x="3005.5" y="-2172.3" font-family="Times,serif" font-size="14.00">next</text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge28" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="black" d="M2808.44,-2095.5C2794.72,-2020.64 2774.04,-1907.76 2758.63,-1823.64"/>
<polygon fill="black" stroke="black" points="2762.07,-1822.99 2756.83,-1813.79 2755.19,-1824.26 2762.07,-1822.99"/>
<text text-anchor="middle" x="2799" y="-1835.8" font-family="Times,serif" font-size="14.00">at_enrollment</text>
</g>
<!-- prior_therapy -->
<g id="node28" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="black" d="M3048.5,-1877C3048.5,-1877 3415.5,-1877 3415.5,-1877 3421.5,-1877 3427.5,-1883 3427.5,-1889 3427.5,-1889 3427.5,-2463 3427.5,-2463 3427.5,-2469 3421.5,-2475 3415.5,-2475 3415.5,-2475 3048.5,-2475 3048.5,-2475 3042.5,-2475 3036.5,-2469 3036.5,-2463 3036.5,-2463 3036.5,-1889 3036.5,-1889 3036.5,-1883 3042.5,-1877 3048.5,-1877"/>
<text text-anchor="middle" x="3083" y="-2172.3" font-family="Times,serif" font-size="14.00">prior_therapy</text>
<polyline fill="none" stroke="black" points="3129.5,-1877 3129.5,-2475 "/>
<text text-anchor="middle" x="3139.5" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
<polyline fill="none" stroke="black" points="3149.5,-1877 3149.5,-2475 "/>
<text text-anchor="middle" x="3278.5" y="-2459.8" font-family="Times,serif" font-size="14.00">agent_name</text>
<polyline fill="none" stroke="black" points="3149.5,-2452 3407.5,-2452 "/>
<text text-anchor="middle" x="3278.5" y="-2436.8" font-family="Times,serif" font-size="14.00">agent_units_of_measure</text>
<polyline fill="none" stroke="black" points="3149.5,-2429 3407.5,-2429 "/>
<text text-anchor="middle" x="3278.5" y="-2413.8" font-family="Times,serif" font-size="14.00">any_therapy</text>
<polyline fill="none" stroke="black" points="3149.5,-2406 3407.5,-2406 "/>
<text text-anchor="middle" x="3278.5" y="-2390.8" font-family="Times,serif" font-size="14.00">best_response</text>
<polyline fill="none" stroke="black" points="3149.5,-2383 3407.5,-2383 "/>
<text text-anchor="middle" x="3278.5" y="-2367.8" font-family="Times,serif" font-size="14.00">date_of_first_dose</text>
<polyline fill="none" stroke="black" points="3149.5,-2360 3407.5,-2360 "/>
<text text-anchor="middle" x="3278.5" y="-2344.8" font-family="Times,serif" font-size="14.00">date_of_last_dose</text>
<polyline fill="none" stroke="black" points="3149.5,-2337 3407.5,-2337 "/>
<text text-anchor="middle" x="3278.5" y="-2321.8" font-family="Times,serif" font-size="14.00">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="black" points="3149.5,-2314 3407.5,-2314 "/>
<text text-anchor="middle" x="3278.5" y="-2298.8" font-family="Times,serif" font-size="14.00">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="black" points="3149.5,-2291 3407.5,-2291 "/>
<text text-anchor="middle" x="3278.5" y="-2275.8" font-family="Times,serif" font-size="14.00">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="black" points="3149.5,-2268 3407.5,-2268 "/>
<text text-anchor="middle" x="3278.5" y="-2252.8" font-family="Times,serif" font-size="14.00">dose_schedule</text>
<polyline fill="none" stroke="black" points="3149.5,-2245 3407.5,-2245 "/>
<text text-anchor="middle" x="3278.5" y="-2229.8" font-family="Times,serif" font-size="14.00">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="black" points="3149.5,-2222 3407.5,-2222 "/>
<text text-anchor="middle" x="3278.5" y="-2206.8" font-family="Times,serif" font-size="14.00">nonresponse_therapy_type</text>
<polyline fill="none" stroke="black" points="3149.5,-2199 3407.5,-2199 "/>
<text text-anchor="middle" x="3278.5" y="-2183.8" font-family="Times,serif" font-size="14.00">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="black" points="3149.5,-2176 3407.5,-2176 "/>
<text text-anchor="middle" x="3278.5" y="-2160.8" font-family="Times,serif" font-size="14.00">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="black" points="3149.5,-2153 3407.5,-2153 "/>
<text text-anchor="middle" x="3278.5" y="-2137.8" font-family="Times,serif" font-size="14.00">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="black" points="3149.5,-2130 3407.5,-2130 "/>
<text text-anchor="middle" x="3278.5" y="-2114.8" font-family="Times,serif" font-size="14.00">prior_nsaid_exposure</text>
<polyline fill="none" stroke="black" points="3149.5,-2107 3407.5,-2107 "/>
<text text-anchor="middle" x="3278.5" y="-2091.8" font-family="Times,serif" font-size="14.00">prior_steroid_exposure</text>
<polyline fill="none" stroke="black" points="3149.5,-2084 3407.5,-2084 "/>
<text text-anchor="middle" x="3278.5" y="-2068.8" font-family="Times,serif" font-size="14.00">prior_therapy_type</text>
<polyline fill="none" stroke="black" points="3149.5,-2061 3407.5,-2061 "/>
<text text-anchor="middle" x="3278.5" y="-2045.8" font-family="Times,serif" font-size="14.00">therapy_type</text>
<polyline fill="none" stroke="black" points="3149.5,-2038 3407.5,-2038 "/>
<text text-anchor="middle" x="3278.5" y="-2022.8" font-family="Times,serif" font-size="14.00">total_dose</text>
<polyline fill="none" stroke="black" points="3149.5,-2015 3407.5,-2015 "/>
<text text-anchor="middle" x="3278.5" y="-1999.8" font-family="Times,serif" font-size="14.00">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="black" points="3149.5,-1992 3407.5,-1992 "/>
<text text-anchor="middle" x="3278.5" y="-1976.8" font-family="Times,serif" font-size="14.00">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="black" points="3149.5,-1969 3407.5,-1969 "/>
<text text-anchor="middle" x="3278.5" y="-1953.8" font-family="Times,serif" font-size="14.00">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="black" points="3149.5,-1946 3407.5,-1946 "/>
<text text-anchor="middle" x="3278.5" y="-1930.8" font-family="Times,serif" font-size="14.00">treatment_performed_at_site</text>
<polyline fill="none" stroke="black" points="3149.5,-1923 3407.5,-1923 "/>
<text text-anchor="middle" x="3278.5" y="-1907.8" font-family="Times,serif" font-size="14.00">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="black" points="3149.5,-1900 3407.5,-1900 "/>
<text text-anchor="middle" x="3278.5" y="-1884.8" font-family="Times,serif" font-size="14.00">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="black" points="3407.5,-1877 3407.5,-2475 "/>
<text text-anchor="middle" x="3417.5" y="-2172.3" font-family="Times,serif" font-size="14.00"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge11" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="black" d="M3427.61,-2218.79C3438.81,-2208.47 3445.5,-2194.21 3445.5,-2176 3445.5,-2161.91 3441.5,-2150.19 3434.5,-2140.83"/>
<polygon fill="black" stroke="black" points="3436.91,-2138.28 3427.61,-2133.21 3431.72,-2142.97 3436.91,-2138.28"/>
<text text-anchor="middle" x="3458" y="-2172.3" font-family="Times,serif" font-size="14.00">next</text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge27" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="black" d="M3039.39,-1876.69C3035.31,-1872.7 3031.18,-1868.8 3027,-1865 2990.01,-1831.36 2944.33,-1802.66 2900.3,-1779.47"/>
<polygon fill="black" stroke="black" points="2901.71,-1776.26 2891.23,-1774.76 2898.49,-1782.47 2901.71,-1776.26"/>
<text text-anchor="middle" x="3038" y="-1835.8" font-family="Times,serif" font-size="14.00">at_enrollment</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge5" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="black" d="M1522.45,-1865.34C1560.54,-1699.55 1626.32,-1498.83 1738,-1347 1753.12,-1326.44 1761.65,-1324.31 1785,-1314 1839.79,-1289.81 1904.71,-1274.43 1958.74,-1264.87"/>
<polygon fill="black" stroke="black" points="1959.44,-1268.3 1968.7,-1263.15 1958.25,-1261.4 1959.44,-1268.3"/>
<text text-anchor="middle" x="1633.5" y="-1576.8" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge15" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="black" d="M1654.18,-2219.89C1665.31,-2209.5 1672,-2194.87 1672,-2176 1672,-2161.41 1668,-2149.35 1661.03,-2139.83"/>
<polygon fill="black" stroke="black" points="1663.43,-2137.26 1654.18,-2132.11 1658.2,-2141.91 1663.43,-2137.26"/>
<text text-anchor="middle" x="1684.5" y="-2172.3" font-family="Times,serif" font-size="14.00">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge33" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="black" d="M1654.02,-1928.26C1671.24,-1906.59 1688.73,-1885.22 1706,-1865 1744.75,-1819.62 1793.44,-1770.65 1824.4,-1740.4"/>
<polygon fill="black" stroke="black" points="1827.14,-1742.61 1831.87,-1733.13 1822.26,-1737.59 1827.14,-1742.61"/>
<text text-anchor="middle" x="1757" y="-1835.8" font-family="Times,serif" font-size="14.00">on_visit</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge25" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="black" d="M1085.42,-650.68C1084.9,-630.86 1084.13,-601.06 1083.44,-574.87"/>
<polygon fill="black" stroke="black" points="1086.94,-574.57 1083.18,-564.67 1079.94,-574.76 1086.94,-574.57"/>
<text text-anchor="middle" x="1124" y="-609.8" font-family="Times,serif" font-size="14.00">of_study_arm</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge3" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="black" d="M1838.51,-1686.6C1795.95,-1625.85 1691.1,-1455.26 1770,-1347 1812.91,-1288.12 1892.35,-1264.39 1958.71,-1255.16"/>
<polygon fill="black" stroke="black" points="1959.35,-1258.61 1968.82,-1253.86 1958.45,-1251.67 1959.35,-1258.61"/>
<text text-anchor="middle" x="1791.5" y="-1447.3" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge31" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="black" d="M1861.35,-1686.64C1873.43,-1644.1 1899.92,-1550.85 1915.63,-1495.57"/>
<polygon fill="black" stroke="black" points="1919.06,-1496.28 1918.43,-1485.71 1912.33,-1494.37 1919.06,-1496.28"/>
<text text-anchor="middle" x="1916.5" y="-1576.8" font-family="Times,serif" font-size="14.00">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge13" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="black" d="M1906.12,-1733.01C1933.53,-1736.92 1958.5,-1729.25 1958.5,-1710 1958.5,-1693.16 1939.38,-1685.18 1916.24,-1686.07"/>
<polygon fill="black" stroke="black" points="1915.76,-1682.6 1906.12,-1686.99 1916.4,-1689.57 1915.76,-1682.6"/>
<text text-anchor="middle" x="1971" y="-1706.3" font-family="Times,serif" font-size="14.00">next</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge1" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="black" d="M2584.72,-1694.54C2410.49,-1674.61 2142.03,-1632.09 2079,-1555 2048.92,-1518.22 2056.63,-1383.06 2063.9,-1305.74"/>
<polygon fill="black" stroke="black" points="2067.4,-1305.98 2064.88,-1295.69 2060.43,-1305.31 2067.4,-1305.98"/>
<text text-anchor="middle" x="2100.5" y="-1447.3" font-family="Times,serif" font-size="14.00">of_case</text>
</g>
</g>
</svg>
</div>
