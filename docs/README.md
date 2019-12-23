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
<svg width="3956pt" height="2966pt"
 viewBox="0.00 0.00 3956.00 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3952,-2962 3952,4 -4,4"/>
<!-- study -->
<g id="node1" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M3001.5,-190.5C3001.5,-190.5 3281.5,-190.5 3281.5,-190.5 3287.5,-190.5 3293.5,-196.5 3293.5,-202.5 3293.5,-202.5 3293.5,-339.5 3293.5,-339.5 3293.5,-345.5 3287.5,-351.5 3281.5,-351.5 3281.5,-351.5 3001.5,-351.5 3001.5,-351.5 2995.5,-351.5 2989.5,-345.5 2989.5,-339.5 2989.5,-339.5 2989.5,-202.5 2989.5,-202.5 2989.5,-196.5 2995.5,-190.5 3001.5,-190.5"/>
<text text-anchor="middle" x="3017.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="3045.5,-190.5 3045.5,-351.5 "/>
<text text-anchor="middle" x="3056" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3066.5,-190.5 3066.5,-351.5 "/>
<text text-anchor="middle" x="3169.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="3066.5,-328.5 3272.5,-328.5 "/>
<text text-anchor="middle" x="3169.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="3066.5,-305.5 3272.5,-305.5 "/>
<text text-anchor="middle" x="3169.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="3066.5,-282.5 3272.5,-282.5 "/>
<text text-anchor="middle" x="3169.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="3066.5,-259.5 3272.5,-259.5 "/>
<text text-anchor="middle" x="3169.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="3066.5,-236.5 3272.5,-236.5 "/>
<text text-anchor="middle" x="3169.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="3066.5,-213.5 3272.5,-213.5 "/>
<text text-anchor="middle" x="3169.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="3272.5,-190.5 3272.5,-351.5 "/>
<text text-anchor="middle" x="3283" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- program -->
<g id="node13" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2987.5,-.5C2987.5,-.5 3295.5,-.5 3295.5,-.5 3301.5,-.5 3307.5,-6.5 3307.5,-12.5 3307.5,-12.5 3307.5,-126.5 3307.5,-126.5 3307.5,-132.5 3301.5,-138.5 3295.5,-138.5 3295.5,-138.5 2987.5,-138.5 2987.5,-138.5 2981.5,-138.5 2975.5,-132.5 2975.5,-126.5 2975.5,-126.5 2975.5,-12.5 2975.5,-12.5 2975.5,-6.5 2981.5,-.5 2987.5,-.5"/>
<text text-anchor="middle" x="3014.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="3053.5,-.5 3053.5,-138.5 "/>
<text text-anchor="middle" x="3064" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3074.5,-.5 3074.5,-138.5 "/>
<text text-anchor="middle" x="3180.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="3074.5,-115.5 3286.5,-115.5 "/>
<text text-anchor="middle" x="3180.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="3074.5,-92.5 3286.5,-92.5 "/>
<text text-anchor="middle" x="3180.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="3074.5,-69.5 3286.5,-69.5 "/>
<text text-anchor="middle" x="3180.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="3074.5,-46.5 3286.5,-46.5 "/>
<text text-anchor="middle" x="3180.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="3074.5,-23.5 3286.5,-23.5 "/>
<text text-anchor="middle" x="3180.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="3286.5,-.5 3286.5,-138.5 "/>
<text text-anchor="middle" x="3297" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge5" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M3141.5,-190.4932C3141.5,-176.7786 3141.5,-162.5421 3141.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="3145.0001,-148.5183 3141.5,-138.5184 3138.0001,-148.5184 3145.0001,-148.5183"/>
<text text-anchor="middle" x="3182" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- enrollment -->
<g id="node2" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2117,-1468.5C2117,-1468.5 2466,-1468.5 2466,-1468.5 2472,-1468.5 2478,-1474.5 2478,-1480.5 2478,-1480.5 2478,-1663.5 2478,-1663.5 2478,-1669.5 2472,-1675.5 2466,-1675.5 2466,-1675.5 2117,-1675.5 2117,-1675.5 2111,-1675.5 2105,-1669.5 2105,-1663.5 2105,-1663.5 2105,-1480.5 2105,-1480.5 2105,-1474.5 2111,-1468.5 2117,-1468.5"/>
<text text-anchor="middle" x="2152.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2200,-1468.5 2200,-1675.5 "/>
<text text-anchor="middle" x="2210.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2221,-1468.5 2221,-1675.5 "/>
<text text-anchor="middle" x="2339" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2221,-1652.5 2457,-1652.5 "/>
<text text-anchor="middle" x="2339" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2221,-1629.5 2457,-1629.5 "/>
<text text-anchor="middle" x="2339" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2221,-1606.5 2457,-1606.5 "/>
<text text-anchor="middle" x="2339" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2221,-1583.5 2457,-1583.5 "/>
<text text-anchor="middle" x="2339" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2221,-1560.5 2457,-1560.5 "/>
<text text-anchor="middle" x="2339" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2221,-1537.5 2457,-1537.5 "/>
<text text-anchor="middle" x="2339" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2221,-1514.5 2457,-1514.5 "/>
<text text-anchor="middle" x="2339" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2221,-1491.5 2457,-1491.5 "/>
<text text-anchor="middle" x="2339" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2457,-1468.5 2457,-1675.5 "/>
<text text-anchor="middle" x="2467.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node4" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1672,-1065.5C1672,-1065.5 1891,-1065.5 1891,-1065.5 1897,-1065.5 1903,-1071.5 1903,-1077.5 1903,-1077.5 1903,-1145.5 1903,-1145.5 1903,-1151.5 1897,-1157.5 1891,-1157.5 1891,-1157.5 1672,-1157.5 1672,-1157.5 1666,-1157.5 1660,-1151.5 1660,-1145.5 1660,-1145.5 1660,-1077.5 1660,-1077.5 1660,-1071.5 1666,-1065.5 1672,-1065.5"/>
<text text-anchor="middle" x="1684.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1709,-1065.5 1709,-1157.5 "/>
<text text-anchor="middle" x="1719.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1730,-1065.5 1730,-1157.5 "/>
<text text-anchor="middle" x="1806" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1730,-1134.5 1882,-1134.5 "/>
<text text-anchor="middle" x="1806" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1730,-1111.5 1882,-1111.5 "/>
<text text-anchor="middle" x="1806" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1730,-1088.5 1882,-1088.5 "/>
<text text-anchor="middle" x="1806" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1882,-1065.5 1882,-1157.5 "/>
<text text-anchor="middle" x="1892.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge36" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2306.31,-1468.2368C2311.6742,-1387.3239 2304.4128,-1277.532 2240.5,-1209 2196.6917,-1162.0255 2032.6926,-1135.927 1913.1963,-1122.8098"/>
<polygon fill="#000000" stroke="#000000" points="1913.5453,-1119.3272 1903.2275,-1121.7342 1912.7943,-1126.2868 1913.5453,-1119.3272"/>
<text text-anchor="middle" x="2335.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node3" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2625.5,-1727.5C2625.5,-1727.5 3081.5,-1727.5 3081.5,-1727.5 3087.5,-1727.5 3093.5,-1733.5 3093.5,-1739.5 3093.5,-1739.5 3093.5,-2313.5 3093.5,-2313.5 3093.5,-2319.5 3087.5,-2325.5 3081.5,-2325.5 3081.5,-2325.5 2625.5,-2325.5 2625.5,-2325.5 2619.5,-2325.5 2613.5,-2319.5 2613.5,-2313.5 2613.5,-2313.5 2613.5,-1739.5 2613.5,-1739.5 2613.5,-1733.5 2619.5,-1727.5 2625.5,-1727.5"/>
<text text-anchor="middle" x="2671" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2728.5,-1727.5 2728.5,-2325.5 "/>
<text text-anchor="middle" x="2739" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2749.5,-1727.5 2749.5,-2325.5 "/>
<text text-anchor="middle" x="2911" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2302.5 3072.5,-2302.5 "/>
<text text-anchor="middle" x="2911" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2279.5 3072.5,-2279.5 "/>
<text text-anchor="middle" x="2911" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2256.5 3072.5,-2256.5 "/>
<text text-anchor="middle" x="2911" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2233.5 3072.5,-2233.5 "/>
<text text-anchor="middle" x="2911" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2210.5 3072.5,-2210.5 "/>
<text text-anchor="middle" x="2911" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2187.5 3072.5,-2187.5 "/>
<text text-anchor="middle" x="2911" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2164.5 3072.5,-2164.5 "/>
<text text-anchor="middle" x="2911" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2141.5 3072.5,-2141.5 "/>
<text text-anchor="middle" x="2911" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2118.5 3072.5,-2118.5 "/>
<text text-anchor="middle" x="2911" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2095.5 3072.5,-2095.5 "/>
<text text-anchor="middle" x="2911" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2072.5 3072.5,-2072.5 "/>
<text text-anchor="middle" x="2911" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2049.5 3072.5,-2049.5 "/>
<text text-anchor="middle" x="2911" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2026.5 3072.5,-2026.5 "/>
<text text-anchor="middle" x="2911" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2749.5,-2003.5 3072.5,-2003.5 "/>
<text text-anchor="middle" x="2911" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1980.5 3072.5,-1980.5 "/>
<text text-anchor="middle" x="2911" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1957.5 3072.5,-1957.5 "/>
<text text-anchor="middle" x="2911" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1934.5 3072.5,-1934.5 "/>
<text text-anchor="middle" x="2911" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1911.5 3072.5,-1911.5 "/>
<text text-anchor="middle" x="2911" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1888.5 3072.5,-1888.5 "/>
<text text-anchor="middle" x="2911" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1865.5 3072.5,-1865.5 "/>
<text text-anchor="middle" x="2911" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1842.5 3072.5,-1842.5 "/>
<text text-anchor="middle" x="2911" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1819.5 3072.5,-1819.5 "/>
<text text-anchor="middle" x="2911" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1796.5 3072.5,-1796.5 "/>
<text text-anchor="middle" x="2911" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1773.5 3072.5,-1773.5 "/>
<text text-anchor="middle" x="2911" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2749.5,-1750.5 3072.5,-1750.5 "/>
<text text-anchor="middle" x="2911" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="3072.5,-1727.5 3072.5,-2325.5 "/>
<text text-anchor="middle" x="3083" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge32" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2613.2233,-1734.0303C2610.3266,-1731.6495 2607.4185,-1729.3051 2604.5,-1727 2569.1446,-1699.0753 2527.9467,-1674.3037 2487.2758,-1653.207"/>
<polygon fill="#000000" stroke="#000000" points="2488.8296,-1650.0705 2478.3341,-1648.6227 2485.6359,-1656.2996 2488.8296,-1650.0705"/>
<text text-anchor="middle" x="2624.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge23" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M3093.7384,-2064.6912C3104.9387,-2055.0507 3111.5,-2042.3203 3111.5,-2026.5 3111.5,-2014.3876 3107.6539,-2004.0864 3100.8244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="3103.219,-1993.0385 3093.7384,-1988.3088 3098.2002,-1997.9183 3103.219,-1993.0385"/>
<text text-anchor="middle" x="3127.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge4" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1659.9878,-1102.1363C1513.604,-1088.9583 1278.146,-1061.1273 1204.5,-1014 1115.6172,-957.1224 1070.5,-923.5235 1070.5,-818 1070.5,-818 1070.5,-818 1070.5,-438 1070.5,-342.4156 2490.6178,-290.6196 2978.912,-275.6352"/>
<polygon fill="#000000" stroke="#000000" points="2979.3261,-279.1243 2989.2144,-275.3203 2979.1121,-272.1276 2979.3261,-279.1243"/>
<text text-anchor="middle" x="1111" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort -->
<g id="node7" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2670,-524.5C2670,-524.5 2903,-524.5 2903,-524.5 2909,-524.5 2915,-530.5 2915,-536.5 2915,-536.5 2915,-558.5 2915,-558.5 2915,-564.5 2909,-570.5 2903,-570.5 2903,-570.5 2670,-570.5 2670,-570.5 2664,-570.5 2658,-564.5 2658,-558.5 2658,-558.5 2658,-536.5 2658,-536.5 2658,-530.5 2664,-524.5 2670,-524.5"/>
<text text-anchor="middle" x="2689.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2721,-524.5 2721,-570.5 "/>
<text text-anchor="middle" x="2731.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2742,-524.5 2742,-570.5 "/>
<text text-anchor="middle" x="2818" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2742,-547.5 2894,-547.5 "/>
<text text-anchor="middle" x="2818" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2894,-524.5 2894,-570.5 "/>
<text text-anchor="middle" x="2904.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge3" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1903.106,-1104.9113C2125.8919,-1091.792 2581.8713,-1059.6814 2637.5,-1014 2773.1103,-902.6389 2786.9058,-667.6217 2787.1601,-580.719"/>
<polygon fill="#000000" stroke="#000000" points="2790.6599,-580.6269 2787.1291,-570.6378 2783.66,-580.6485 2790.6599,-580.6269"/>
<text text-anchor="middle" x="2827" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node15" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1226,-622.5C1226,-622.5 1621,-622.5 1621,-622.5 1627,-622.5 1633,-628.5 1633,-634.5 1633,-634.5 1633,-1001.5 1633,-1001.5 1633,-1007.5 1627,-1013.5 1621,-1013.5 1621,-1013.5 1226,-1013.5 1226,-1013.5 1220,-1013.5 1214,-1007.5 1214,-1001.5 1214,-1001.5 1214,-634.5 1214,-634.5 1214,-628.5 1220,-622.5 1226,-622.5"/>
<text text-anchor="middle" x="1274" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1334,-622.5 1334,-1013.5 "/>
<text text-anchor="middle" x="1344.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1355,-622.5 1355,-1013.5 "/>
<text text-anchor="middle" x="1483.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1355,-990.5 1612,-990.5 "/>
<text text-anchor="middle" x="1483.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1355,-967.5 1612,-967.5 "/>
<text text-anchor="middle" x="1483.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1355,-944.5 1612,-944.5 "/>
<text text-anchor="middle" x="1483.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1355,-921.5 1612,-921.5 "/>
<text text-anchor="middle" x="1483.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1355,-898.5 1612,-898.5 "/>
<text text-anchor="middle" x="1483.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1355,-875.5 1612,-875.5 "/>
<text text-anchor="middle" x="1483.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1355,-852.5 1612,-852.5 "/>
<text text-anchor="middle" x="1483.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1355,-829.5 1612,-829.5 "/>
<text text-anchor="middle" x="1483.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1355,-806.5 1612,-806.5 "/>
<text text-anchor="middle" x="1483.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1355,-783.5 1612,-783.5 "/>
<text text-anchor="middle" x="1483.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1355,-760.5 1612,-760.5 "/>
<text text-anchor="middle" x="1483.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1355,-737.5 1612,-737.5 "/>
<text text-anchor="middle" x="1483.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1355,-714.5 1612,-714.5 "/>
<text text-anchor="middle" x="1483.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1355,-691.5 1612,-691.5 "/>
<text text-anchor="middle" x="1483.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1355,-668.5 1612,-668.5 "/>
<text text-anchor="middle" x="1483.5" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1355,-645.5 1612,-645.5 "/>
<text text-anchor="middle" x="1483.5" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1612,-622.5 1612,-1013.5 "/>
<text text-anchor="middle" x="1622.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge16" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1659.9879,-1089.3881C1629.3971,-1079.8504 1598.0335,-1066.276 1572.5,-1047 1562.0927,-1039.1432 1552.2022,-1030.3328 1542.8377,-1020.8644"/>
<polygon fill="#000000" stroke="#000000" points="1545.2258,-1018.2978 1535.7793,-1013.5004 1540.1723,-1023.1416 1545.2258,-1018.2978"/>
<text text-anchor="middle" x="1641.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- off_study -->
<g id="node17" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M1713,-714.5C1713,-714.5 2128,-714.5 2128,-714.5 2134,-714.5 2140,-720.5 2140,-726.5 2140,-726.5 2140,-909.5 2140,-909.5 2140,-915.5 2134,-921.5 2128,-921.5 2128,-921.5 1713,-921.5 1713,-921.5 1707,-921.5 1701,-915.5 1701,-909.5 1701,-909.5 1701,-726.5 1701,-726.5 1701,-720.5 1707,-714.5 1713,-714.5"/>
<text text-anchor="middle" x="1742.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="1784,-714.5 1784,-921.5 "/>
<text text-anchor="middle" x="1794.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1805,-714.5 1805,-921.5 "/>
<text text-anchor="middle" x="1962" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1805,-898.5 2119,-898.5 "/>
<text text-anchor="middle" x="1962" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1805,-875.5 2119,-875.5 "/>
<text text-anchor="middle" x="1962" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1805,-852.5 2119,-852.5 "/>
<text text-anchor="middle" x="1962" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1805,-829.5 2119,-829.5 "/>
<text text-anchor="middle" x="1962" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1805,-806.5 2119,-806.5 "/>
<text text-anchor="middle" x="1962" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1805,-783.5 2119,-783.5 "/>
<text text-anchor="middle" x="1962" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1805,-760.5 2119,-760.5 "/>
<text text-anchor="middle" x="1962" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1805,-737.5 2119,-737.5 "/>
<text text-anchor="middle" x="1962" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2119,-714.5 2119,-921.5 "/>
<text text-anchor="middle" x="2129.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge9" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1803.3717,-1065.3178C1820.4304,-1029.298 1844.8653,-977.7034 1867.0078,-930.9493"/>
<polygon fill="#000000" stroke="#000000" points="1870.2858,-932.2049 1871.4029,-921.6691 1863.9594,-929.2087 1870.2858,-932.2049"/>
<text text-anchor="middle" x="1874" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- off_treatment -->
<g id="node28" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M2170,-726C2170,-726 2617,-726 2617,-726 2623,-726 2629,-732 2629,-738 2629,-738 2629,-898 2629,-898 2629,-904 2623,-910 2617,-910 2617,-910 2170,-910 2170,-910 2164,-910 2158,-904 2158,-898 2158,-898 2158,-738 2158,-738 2158,-732 2164,-726 2170,-726"/>
<text text-anchor="middle" x="2215.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="2273,-726 2273,-910 "/>
<text text-anchor="middle" x="2283.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2294,-726 2294,-910 "/>
<text text-anchor="middle" x="2451" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2294,-887 2608,-887 "/>
<text text-anchor="middle" x="2451" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2294,-864 2608,-864 "/>
<text text-anchor="middle" x="2451" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2294,-841 2608,-841 "/>
<text text-anchor="middle" x="2451" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2294,-818 2608,-818 "/>
<text text-anchor="middle" x="2451" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2294,-795 2608,-795 "/>
<text text-anchor="middle" x="2451" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2294,-772 2608,-772 "/>
<text text-anchor="middle" x="2451" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2294,-749 2608,-749 "/>
<text text-anchor="middle" x="2451" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2608,-726 2608,-910 "/>
<text text-anchor="middle" x="2618.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge18" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1903.3988,-1092.2848C1977.0991,-1077.5163 2071.3931,-1052.897 2148.5,-1014 2198.8622,-988.5946 2248.5693,-951.6714 2289.9107,-916.7057"/>
<polygon fill="#000000" stroke="#000000" points="2292.1962,-919.3566 2297.5309,-910.2028 2287.6522,-914.0318 2292.1962,-919.3566"/>
<text text-anchor="middle" x="2173.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- image -->
<g id="node5" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1903.5,-2836C1903.5,-2836 1939.5,-2836 1939.5,-2836 1945.5,-2836 1951.5,-2842 1951.5,-2848 1951.5,-2848 1951.5,-2860 1951.5,-2860 1951.5,-2866 1945.5,-2872 1939.5,-2872 1939.5,-2872 1903.5,-2872 1903.5,-2872 1897.5,-2872 1891.5,-2866 1891.5,-2860 1891.5,-2860 1891.5,-2848 1891.5,-2848 1891.5,-2842 1897.5,-2836 1903.5,-2836"/>
<text text-anchor="middle" x="1921.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node11" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1905.5,-2662.5C1905.5,-2662.5 1937.5,-2662.5 1937.5,-2662.5 1943.5,-2662.5 1949.5,-2668.5 1949.5,-2674.5 1949.5,-2674.5 1949.5,-2686.5 1949.5,-2686.5 1949.5,-2692.5 1943.5,-2698.5 1937.5,-2698.5 1937.5,-2698.5 1905.5,-2698.5 1905.5,-2698.5 1899.5,-2698.5 1893.5,-2692.5 1893.5,-2686.5 1893.5,-2686.5 1893.5,-2674.5 1893.5,-2674.5 1893.5,-2668.5 1899.5,-2662.5 1905.5,-2662.5"/>
<text text-anchor="middle" x="1921.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge15" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1921.5,-2835.7604C1921.5,-2805.5622 1921.5,-2744.9545 1921.5,-2709.0457"/>
<polygon fill="#000000" stroke="#000000" points="1925.0001,-2708.7555 1921.5,-2698.7556 1918.0001,-2708.7556 1925.0001,-2708.7555"/>
<text text-anchor="middle" x="1952" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- diagnosis -->
<g id="node6" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2644,-2344.5C2644,-2344.5 2987,-2344.5 2987,-2344.5 2993,-2344.5 2999,-2350.5 2999,-2356.5 2999,-2356.5 2999,-2631.5 2999,-2631.5 2999,-2637.5 2993,-2643.5 2987,-2643.5 2987,-2643.5 2644,-2643.5 2644,-2643.5 2638,-2643.5 2632,-2637.5 2632,-2631.5 2632,-2631.5 2632,-2356.5 2632,-2356.5 2632,-2350.5 2638,-2344.5 2644,-2344.5"/>
<text text-anchor="middle" x="2674" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2716,-2344.5 2716,-2643.5 "/>
<text text-anchor="middle" x="2726.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2737,-2344.5 2737,-2643.5 "/>
<text text-anchor="middle" x="2857.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2737,-2620.5 2978,-2620.5 "/>
<text text-anchor="middle" x="2857.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2737,-2597.5 2978,-2597.5 "/>
<text text-anchor="middle" x="2857.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2737,-2574.5 2978,-2574.5 "/>
<text text-anchor="middle" x="2857.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2737,-2551.5 2978,-2551.5 "/>
<text text-anchor="middle" x="2857.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2737,-2528.5 2978,-2528.5 "/>
<text text-anchor="middle" x="2857.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2737,-2505.5 2978,-2505.5 "/>
<text text-anchor="middle" x="2857.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2737,-2482.5 2978,-2482.5 "/>
<text text-anchor="middle" x="2857.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2737,-2459.5 2978,-2459.5 "/>
<text text-anchor="middle" x="2857.5" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2737,-2436.5 2978,-2436.5 "/>
<text text-anchor="middle" x="2857.5" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2737,-2413.5 2978,-2413.5 "/>
<text text-anchor="middle" x="2857.5" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2737,-2390.5 2978,-2390.5 "/>
<text text-anchor="middle" x="2857.5" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2737,-2367.5 2978,-2367.5 "/>
<text text-anchor="middle" x="2857.5" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2978,-2344.5 2978,-2643.5 "/>
<text text-anchor="middle" x="2988.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge33" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2999.1967,-2445.1855C3058.5602,-2419.7626 3117.9258,-2381.868 3152.5,-2326 3187.5239,-2269.4053 3184.0603,-1785.5969 3152.5,-1727 2904.8253,-1267.1508 2206.1356,-1150.1133 1913.2608,-1120.9384"/>
<polygon fill="#000000" stroke="#000000" points="1913.308,-1117.4264 1903.0149,-1119.9372 1912.6271,-1124.3932 1913.308,-1117.4264"/>
<text text-anchor="middle" x="3145.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge1" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2885.1315,-524.4465C2920.9285,-512.9142 2960.2228,-496.3028 2991.5,-473 3031.6365,-443.0966 3065.8944,-399.4937 3091.4951,-360.4457"/>
<polygon fill="#000000" stroke="#000000" points="3094.6749,-361.9729 3097.1539,-351.6721 3088.7923,-358.1787 3094.6749,-361.9729"/>
<text text-anchor="middle" x="3100" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm -->
<g id="node16" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M2602,-403.5C2602,-403.5 2971,-403.5 2971,-403.5 2977,-403.5 2983,-409.5 2983,-415.5 2983,-415.5 2983,-460.5 2983,-460.5 2983,-466.5 2977,-472.5 2971,-472.5 2971,-472.5 2602,-472.5 2602,-472.5 2596,-472.5 2590,-466.5 2590,-460.5 2590,-460.5 2590,-415.5 2590,-415.5 2590,-409.5 2596,-403.5 2602,-403.5"/>
<text text-anchor="middle" x="2636" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="2682,-403.5 2682,-472.5 "/>
<text text-anchor="middle" x="2692.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2703,-403.5 2703,-472.5 "/>
<text text-anchor="middle" x="2832.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="2703,-449.5 2962,-449.5 "/>
<text text-anchor="middle" x="2832.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2703,-426.5 2962,-426.5 "/>
<text text-anchor="middle" x="2832.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="2962,-403.5 2962,-472.5 "/>
<text text-anchor="middle" x="2972.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge2" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2786.5,-524.2779C2786.5,-512.2547 2786.5,-497.1545 2786.5,-482.9615"/>
<polygon fill="#000000" stroke="#000000" points="2790.0001,-482.844 2786.5,-472.844 2783.0001,-482.844 2790.0001,-482.844"/>
<text text-anchor="middle" x="2827" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cycle -->
<g id="node8" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1991.5,-1278.5C1991.5,-1278.5 2219.5,-1278.5 2219.5,-1278.5 2225.5,-1278.5 2231.5,-1284.5 2231.5,-1290.5 2231.5,-1290.5 2231.5,-1335.5 2231.5,-1335.5 2231.5,-1341.5 2225.5,-1347.5 2219.5,-1347.5 2219.5,-1347.5 1991.5,-1347.5 1991.5,-1347.5 1985.5,-1347.5 1979.5,-1341.5 1979.5,-1335.5 1979.5,-1335.5 1979.5,-1290.5 1979.5,-1290.5 1979.5,-1284.5 1985.5,-1278.5 1991.5,-1278.5"/>
<text text-anchor="middle" x="2006.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="2033.5,-1278.5 2033.5,-1347.5 "/>
<text text-anchor="middle" x="2044" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2054.5,-1278.5 2054.5,-1347.5 "/>
<text text-anchor="middle" x="2132.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="2054.5,-1324.5 2210.5,-1324.5 "/>
<text text-anchor="middle" x="2132.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="2054.5,-1301.5 2210.5,-1301.5 "/>
<text text-anchor="middle" x="2132.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="2210.5,-1278.5 2210.5,-1347.5 "/>
<text text-anchor="middle" x="2221" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge35" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2064.6548,-1278.4263C2038.5825,-1257.154 2003.5808,-1230.0332 1970.5,-1209 1944.6069,-1192.5368 1915.6075,-1176.4875 1888.2472,-1162.3183"/>
<polygon fill="#000000" stroke="#000000" points="1889.5324,-1159.0438 1879.0382,-1157.5873 1886.3337,-1165.2702 1889.5324,-1159.0438"/>
<text text-anchor="middle" x="1968.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- follow_up -->
<g id="node9" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1149.5,-1209.5C1149.5,-1209.5 1481.5,-1209.5 1481.5,-1209.5 1487.5,-1209.5 1493.5,-1215.5 1493.5,-1221.5 1493.5,-1221.5 1493.5,-1404.5 1493.5,-1404.5 1493.5,-1410.5 1487.5,-1416.5 1481.5,-1416.5 1481.5,-1416.5 1149.5,-1416.5 1149.5,-1416.5 1143.5,-1416.5 1137.5,-1410.5 1137.5,-1404.5 1137.5,-1404.5 1137.5,-1221.5 1137.5,-1221.5 1137.5,-1215.5 1143.5,-1209.5 1149.5,-1209.5"/>
<text text-anchor="middle" x="1180" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1222.5,-1209.5 1222.5,-1416.5 "/>
<text text-anchor="middle" x="1233" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1243.5,-1209.5 1243.5,-1416.5 "/>
<text text-anchor="middle" x="1358" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1243.5,-1393.5 1472.5,-1393.5 "/>
<text text-anchor="middle" x="1358" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1243.5,-1370.5 1472.5,-1370.5 "/>
<text text-anchor="middle" x="1358" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1243.5,-1347.5 1472.5,-1347.5 "/>
<text text-anchor="middle" x="1358" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1243.5,-1324.5 1472.5,-1324.5 "/>
<text text-anchor="middle" x="1358" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1243.5,-1301.5 1472.5,-1301.5 "/>
<text text-anchor="middle" x="1358" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1243.5,-1278.5 1472.5,-1278.5 "/>
<text text-anchor="middle" x="1358" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1243.5,-1255.5 1472.5,-1255.5 "/>
<text text-anchor="middle" x="1358" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1243.5,-1232.5 1472.5,-1232.5 "/>
<text text-anchor="middle" x="1358" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1472.5,-1209.5 1472.5,-1416.5 "/>
<text text-anchor="middle" x="1483" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge34" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1411.5056,-1209.4777C1427.1855,-1196.706 1444.0465,-1185.0035 1461.5,-1176 1494.3308,-1159.064 1576.711,-1142.6502 1649.6602,-1130.6188"/>
<polygon fill="#000000" stroke="#000000" points="1650.579,-1134.0152 1659.8849,-1128.9506 1649.4518,-1127.1066 1650.579,-1134.0152"/>
<text text-anchor="middle" x="1488.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node10" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2307,-2750.5C2307,-2750.5 2492,-2750.5 2492,-2750.5 2498,-2750.5 2504,-2756.5 2504,-2762.5 2504,-2762.5 2504,-2945.5 2504,-2945.5 2504,-2951.5 2498,-2957.5 2492,-2957.5 2492,-2957.5 2307,-2957.5 2307,-2957.5 2301,-2957.5 2295,-2951.5 2295,-2945.5 2295,-2945.5 2295,-2762.5 2295,-2762.5 2295,-2756.5 2301,-2750.5 2307,-2750.5"/>
<text text-anchor="middle" x="2314.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2334,-2750.5 2334,-2957.5 "/>
<text text-anchor="middle" x="2344.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2355,-2750.5 2355,-2957.5 "/>
<text text-anchor="middle" x="2419" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="2355,-2934.5 2483,-2934.5 "/>
<text text-anchor="middle" x="2419" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2355,-2911.5 2483,-2911.5 "/>
<text text-anchor="middle" x="2419" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2355,-2888.5 2483,-2888.5 "/>
<text text-anchor="middle" x="2419" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2355,-2865.5 2483,-2865.5 "/>
<text text-anchor="middle" x="2419" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2355,-2842.5 2483,-2842.5 "/>
<text text-anchor="middle" x="2419" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2355,-2819.5 2483,-2819.5 "/>
<text text-anchor="middle" x="2419" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2355,-2796.5 2483,-2796.5 "/>
<text text-anchor="middle" x="2419" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2355,-2773.5 2483,-2773.5 "/>
<text text-anchor="middle" x="2419" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2483,-2750.5 2483,-2957.5 "/>
<text text-anchor="middle" x="2493.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge11" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2504.1487,-2842.4261C2723.1163,-2816.7915 3209.5,-2751.8232 3209.5,-2680.5 3209.5,-2680.5 3209.5,-2680.5 3209.5,-438 3209.5,-412.0222 3202.3547,-385.3381 3192.6965,-361.1354"/>
<polygon fill="#000000" stroke="#000000" points="3195.8123,-359.514 3188.7283,-351.6358 3189.3532,-362.2122 3195.8123,-359.514"/>
<text text-anchor="middle" x="3240" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge13" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2504.2058,-2763.3892C2543.7952,-2729.1292 2590.0754,-2689.079 2634.6617,-2650.4947"/>
<polygon fill="#000000" stroke="#000000" points="2637.1098,-2653.0048 2642.3812,-2643.8144 2632.5291,-2647.7116 2637.1098,-2653.0048"/>
<text text-anchor="middle" x="2610" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge14" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2294.8963,-2816.0319C2188.8798,-2777.5511 2030.5891,-2720.0961 1959.0243,-2694.1202"/>
<polygon fill="#000000" stroke="#000000" points="1960.1103,-2690.791 1949.5162,-2690.6691 1957.722,-2697.371 1960.1103,-2690.791"/>
<text text-anchor="middle" x="2094" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- sample -->
<g id="node12" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M882,-1796.5C882,-1796.5 1305,-1796.5 1305,-1796.5 1311,-1796.5 1317,-1802.5 1317,-1808.5 1317,-1808.5 1317,-2244.5 1317,-2244.5 1317,-2250.5 1311,-2256.5 1305,-2256.5 1305,-2256.5 882,-2256.5 882,-2256.5 876,-2256.5 870,-2250.5 870,-2244.5 870,-2244.5 870,-1808.5 870,-1808.5 870,-1802.5 876,-1796.5 882,-1796.5"/>
<text text-anchor="middle" x="904" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="938,-1796.5 938,-2256.5 "/>
<text text-anchor="middle" x="948.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="959,-1796.5 959,-2256.5 "/>
<text text-anchor="middle" x="1127.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="959,-2233.5 1296,-2233.5 "/>
<text text-anchor="middle" x="1127.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="959,-2210.5 1296,-2210.5 "/>
<text text-anchor="middle" x="1127.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="959,-2187.5 1296,-2187.5 "/>
<text text-anchor="middle" x="1127.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="959,-2164.5 1296,-2164.5 "/>
<text text-anchor="middle" x="1127.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="959,-2141.5 1296,-2141.5 "/>
<text text-anchor="middle" x="1127.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="959,-2118.5 1296,-2118.5 "/>
<text text-anchor="middle" x="1127.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="959,-2095.5 1296,-2095.5 "/>
<text text-anchor="middle" x="1127.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="959,-2072.5 1296,-2072.5 "/>
<text text-anchor="middle" x="1127.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="959,-2049.5 1296,-2049.5 "/>
<text text-anchor="middle" x="1127.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="959,-2026.5 1296,-2026.5 "/>
<text text-anchor="middle" x="1127.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="959,-2003.5 1296,-2003.5 "/>
<text text-anchor="middle" x="1127.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="959,-1980.5 1296,-1980.5 "/>
<text text-anchor="middle" x="1127.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="959,-1957.5 1296,-1957.5 "/>
<text text-anchor="middle" x="1127.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="959,-1934.5 1296,-1934.5 "/>
<text text-anchor="middle" x="1127.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="959,-1911.5 1296,-1911.5 "/>
<text text-anchor="middle" x="1127.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="959,-1888.5 1296,-1888.5 "/>
<text text-anchor="middle" x="1127.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="959,-1865.5 1296,-1865.5 "/>
<text text-anchor="middle" x="1127.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="959,-1842.5 1296,-1842.5 "/>
<text text-anchor="middle" x="1127.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="959,-1819.5 1296,-1819.5 "/>
<text text-anchor="middle" x="1127.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1296,-1796.5 1296,-2256.5 "/>
<text text-anchor="middle" x="1306.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge8" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2338.9393,-2750.4533C2260.6651,-2627.8521 2111.7882,-2429.5296 1923.5,-2344 1812.7676,-2293.7 1487.3866,-2375.9592 1376.5,-2326 1341.9235,-2310.4218 1309.5315,-2288.4521 1279.902,-2263.4062"/>
<polygon fill="#000000" stroke="#000000" points="1281.886,-2260.4957 1272.0253,-2256.6204 1277.3171,-2265.7991 1281.886,-2260.4957"/>
<text text-anchor="middle" x="2341" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge7" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1893.2622,-2665.3083C1809.8435,-2619.7844 1558.9567,-2478.1923 1376.5,-2326 1353.3259,-2306.6698 1330.1048,-2285.5777 1307.4813,-2263.8293"/>
<polygon fill="#000000" stroke="#000000" points="1309.7793,-2261.1826 1300.1579,-2256.7465 1304.9129,-2266.2144 1309.7793,-2261.1826"/>
<text text-anchor="middle" x="1883" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge38" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1072.0274,-1796.4991C1057.7108,-1585.1997 1053.3175,-1292.5581 1128.5,-1209 1162.8546,-1170.8182 1469.2032,-1138.3073 1649.8361,-1122.2432"/>
<polygon fill="#000000" stroke="#000000" points="1650.2905,-1125.7168 1659.9434,-1121.3498 1649.6741,-1118.744 1650.2905,-1125.7168"/>
<text text-anchor="middle" x="1095.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge21" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1317.0955,-2065.8333C1328.3572,-2056.0642 1335,-2042.9531 1335,-2026.5 1335,-2013.9031 1331.1061,-2003.2652 1324.2267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="1326.5485,-1991.9513 1317.0955,-1987.1667 1321.5016,-1996.802 1326.5485,-1991.9513"/>
<text text-anchor="middle" x="1351" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit -->
<g id="node24" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1391,-1549C1391,-1549 1566,-1549 1566,-1549 1572,-1549 1578,-1555 1578,-1561 1578,-1561 1578,-1583 1578,-1583 1578,-1589 1572,-1595 1566,-1595 1566,-1595 1391,-1595 1391,-1595 1385,-1595 1379,-1589 1379,-1583 1379,-1583 1379,-1561 1379,-1561 1379,-1555 1385,-1549 1391,-1549"/>
<text text-anchor="middle" x="1402.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1426,-1549 1426,-1595 "/>
<text text-anchor="middle" x="1436.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1447,-1549 1447,-1595 "/>
<text text-anchor="middle" x="1502" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1447,-1572 1557,-1572 "/>
<text text-anchor="middle" x="1502" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1557,-1549 1557,-1595 "/>
<text text-anchor="middle" x="1567.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge28" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1288.5378,-1796.2541C1353.3428,-1719.7505 1417.7642,-1643.6998 1452.4172,-1602.7913"/>
<polygon fill="#000000" stroke="#000000" points="1455.1492,-1604.9811 1458.9422,-1595.0884 1449.8079,-1600.4565 1455.1492,-1604.9811"/>
<text text-anchor="middle" x="1393.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- prior_surgery -->
<g id="node14" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2187.5,-1946C2187.5,-1946 2533.5,-1946 2533.5,-1946 2539.5,-1946 2545.5,-1952 2545.5,-1958 2545.5,-1958 2545.5,-2095 2545.5,-2095 2545.5,-2101 2539.5,-2107 2533.5,-2107 2533.5,-2107 2187.5,-2107 2187.5,-2107 2181.5,-2107 2175.5,-2101 2175.5,-2095 2175.5,-2095 2175.5,-1958 2175.5,-1958 2175.5,-1952 2181.5,-1946 2187.5,-1946"/>
<text text-anchor="middle" x="2233" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2290.5,-1946 2290.5,-2107 "/>
<text text-anchor="middle" x="2301" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2311.5,-1946 2311.5,-2107 "/>
<text text-anchor="middle" x="2418" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2084 2524.5,-2084 "/>
<text text-anchor="middle" x="2418" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2061 2524.5,-2061 "/>
<text text-anchor="middle" x="2418" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2038 2524.5,-2038 "/>
<text text-anchor="middle" x="2418" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2015 2524.5,-2015 "/>
<text text-anchor="middle" x="2418" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1992 2524.5,-1992 "/>
<text text-anchor="middle" x="2418" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1969 2524.5,-1969 "/>
<text text-anchor="middle" x="2418" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2524.5,-1946 2524.5,-2107 "/>
<text text-anchor="middle" x="2535" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge30" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2348.2437,-1945.7682C2337.2694,-1873.4814 2321.0605,-1766.714 2308.7733,-1685.7784"/>
<polygon fill="#000000" stroke="#000000" points="2312.1803,-1684.9014 2307.219,-1675.5401 2305.2596,-1685.9522 2312.1803,-1684.9014"/>
<text text-anchor="middle" x="2362.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge19" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M2545.613,-2068.5585C2556.7907,-2058.5547 2563.5,-2044.5352 2563.5,-2026.5 2563.5,-2012.5509 2559.4865,-2001.004 2552.4962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="2554.9806,-1989.3911 2545.613,-1984.4415 2549.8494,-1994.1525 2554.9806,-1989.3911"/>
<text text-anchor="middle" x="2579.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge40" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1633.2332,-966.6229C1659.914,-987.7619 1686.3167,-1009.8624 1710.5,-1032 1719.2443,-1040.0046 1728.0584,-1048.9814 1736.3597,-1057.9427"/>
<polygon fill="#000000" stroke="#000000" points="1733.8756,-1060.413 1743.1994,-1065.4448 1739.0485,-1055.6969 1733.8756,-1060.413"/>
<text text-anchor="middle" x="1752.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge20" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1633.2046,-845.2761C1644.376,-838.5862 1651,-829.4941 1651,-818 1651,-809.7386 1647.5781,-802.7181 1641.5052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="1643.3073,-793.9155 1633.2046,-790.7239 1639.1119,-799.519 1643.3073,-793.9155"/>
<text text-anchor="middle" x="1667" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- agent -->
<g id="node20" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1310.5,-524.5C1310.5,-524.5 1536.5,-524.5 1536.5,-524.5 1542.5,-524.5 1548.5,-530.5 1548.5,-536.5 1548.5,-536.5 1548.5,-558.5 1548.5,-558.5 1548.5,-564.5 1542.5,-570.5 1536.5,-570.5 1536.5,-570.5 1310.5,-570.5 1310.5,-570.5 1304.5,-570.5 1298.5,-564.5 1298.5,-558.5 1298.5,-558.5 1298.5,-536.5 1298.5,-536.5 1298.5,-530.5 1304.5,-524.5 1310.5,-524.5"/>
<text text-anchor="middle" x="1327" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1355.5,-524.5 1355.5,-570.5 "/>
<text text-anchor="middle" x="1366" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1376.5,-524.5 1376.5,-570.5 "/>
<text text-anchor="middle" x="1452" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1376.5,-547.5 1527.5,-547.5 "/>
<text text-anchor="middle" x="1452" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1527.5,-524.5 1527.5,-570.5 "/>
<text text-anchor="middle" x="1538" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge42" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1423.5,-622.4901C1423.5,-606.8636 1423.5,-592.5861 1423.5,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="1427.0001,-580.664 1423.5,-570.6641 1420.0001,-580.6641 1427.0001,-580.664"/>
<text text-anchor="middle" x="1454.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge6" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2860.0562,-403.3975C2894.9648,-386.9757 2938.155,-366.6581 2980.132,-346.9112"/>
<polygon fill="#000000" stroke="#000000" points="2981.7899,-349.9992 2989.3488,-342.5753 2978.8102,-343.6651 2981.7899,-349.9992"/>
<text text-anchor="middle" x="2963" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- demographic -->
<g id="node18" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1613.5,-1232.5C1613.5,-1232.5 1949.5,-1232.5 1949.5,-1232.5 1955.5,-1232.5 1961.5,-1238.5 1961.5,-1244.5 1961.5,-1244.5 1961.5,-1381.5 1961.5,-1381.5 1961.5,-1387.5 1955.5,-1393.5 1949.5,-1393.5 1949.5,-1393.5 1613.5,-1393.5 1613.5,-1393.5 1607.5,-1393.5 1601.5,-1387.5 1601.5,-1381.5 1601.5,-1381.5 1601.5,-1244.5 1601.5,-1244.5 1601.5,-1238.5 1607.5,-1232.5 1613.5,-1232.5"/>
<text text-anchor="middle" x="1656.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1711.5,-1232.5 1711.5,-1393.5 "/>
<text text-anchor="middle" x="1722" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1732.5,-1232.5 1732.5,-1393.5 "/>
<text text-anchor="middle" x="1836.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1732.5,-1370.5 1940.5,-1370.5 "/>
<text text-anchor="middle" x="1836.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1732.5,-1347.5 1940.5,-1347.5 "/>
<text text-anchor="middle" x="1836.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1732.5,-1324.5 1940.5,-1324.5 "/>
<text text-anchor="middle" x="1836.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1732.5,-1301.5 1940.5,-1301.5 "/>
<text text-anchor="middle" x="1836.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1732.5,-1278.5 1940.5,-1278.5 "/>
<text text-anchor="middle" x="1836.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1732.5,-1255.5 1940.5,-1255.5 "/>
<text text-anchor="middle" x="1836.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1940.5,-1232.5 1940.5,-1393.5 "/>
<text text-anchor="middle" x="1951" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge37" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1781.5,-1232.4932C1781.5,-1210.8363 1781.5,-1187.8778 1781.5,-1167.8468"/>
<polygon fill="#000000" stroke="#000000" points="1785.0001,-1167.661 1781.5,-1157.661 1778.0001,-1167.6611 1785.0001,-1167.661"/>
<text text-anchor="middle" x="1808.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- vital_signs -->
<g id="node19" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1500,-1865.5C1500,-1865.5 1787,-1865.5 1787,-1865.5 1793,-1865.5 1799,-1871.5 1799,-1877.5 1799,-1877.5 1799,-2175.5 1799,-2175.5 1799,-2181.5 1793,-2187.5 1787,-2187.5 1787,-2187.5 1500,-2187.5 1500,-2187.5 1494,-2187.5 1488,-2181.5 1488,-2175.5 1488,-2175.5 1488,-1877.5 1488,-1877.5 1488,-1871.5 1494,-1865.5 1500,-1865.5"/>
<text text-anchor="middle" x="1534.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1581,-1865.5 1581,-2187.5 "/>
<text text-anchor="middle" x="1591.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1602,-1865.5 1602,-2187.5 "/>
<text text-anchor="middle" x="1690" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1602,-2164.5 1778,-2164.5 "/>
<text text-anchor="middle" x="1690" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1602,-2141.5 1778,-2141.5 "/>
<text text-anchor="middle" x="1690" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1602,-2118.5 1778,-2118.5 "/>
<text text-anchor="middle" x="1690" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1602,-2095.5 1778,-2095.5 "/>
<text text-anchor="middle" x="1690" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1602,-2072.5 1778,-2072.5 "/>
<text text-anchor="middle" x="1690" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1602,-2049.5 1778,-2049.5 "/>
<text text-anchor="middle" x="1690" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1602,-2026.5 1778,-2026.5 "/>
<text text-anchor="middle" x="1690" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1602,-2003.5 1778,-2003.5 "/>
<text text-anchor="middle" x="1690" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1602,-1980.5 1778,-1980.5 "/>
<text text-anchor="middle" x="1690" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1602,-1957.5 1778,-1957.5 "/>
<text text-anchor="middle" x="1690" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1602,-1934.5 1778,-1934.5 "/>
<text text-anchor="middle" x="1690" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1602,-1911.5 1778,-1911.5 "/>
<text text-anchor="middle" x="1690" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1602,-1888.5 1778,-1888.5 "/>
<text text-anchor="middle" x="1690" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1778,-1865.5 1778,-2187.5 "/>
<text text-anchor="middle" x="1788.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge25" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1585.5909,-1865.3312C1565.9605,-1810.8876 1543.852,-1749.7786 1523.5,-1694 1512.4822,-1663.8037 1499.8,-1629.4573 1490.713,-1604.9182"/>
<polygon fill="#000000" stroke="#000000" points="1493.9318,-1603.5315 1487.1755,-1595.3703 1487.3678,-1605.9634 1493.9318,-1603.5315"/>
<text text-anchor="middle" x="1555.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge17" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1548.6769,-537.4436C1783.7116,-518.5615 2293.131,-477.636 2579.7881,-454.6067"/>
<polygon fill="#000000" stroke="#000000" points="2580.203,-458.0848 2589.8906,-453.7951 2579.6424,-451.1072 2580.203,-458.0848"/>
<text text-anchor="middle" x="2154" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- disease_extent -->
<g id="node21" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M523.5,-1877C523.5,-1877 839.5,-1877 839.5,-1877 845.5,-1877 851.5,-1883 851.5,-1889 851.5,-1889 851.5,-2164 851.5,-2164 851.5,-2170 845.5,-2176 839.5,-2176 839.5,-2176 523.5,-2176 523.5,-2176 517.5,-2176 511.5,-2170 511.5,-2164 511.5,-2164 511.5,-1889 511.5,-1889 511.5,-1883 517.5,-1877 523.5,-1877"/>
<text text-anchor="middle" x="573" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="634.5,-1877 634.5,-2176 "/>
<text text-anchor="middle" x="645" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="655.5,-1877 655.5,-2176 "/>
<text text-anchor="middle" x="743" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="655.5,-2153 830.5,-2153 "/>
<text text-anchor="middle" x="743" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="655.5,-2130 830.5,-2130 "/>
<text text-anchor="middle" x="743" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="655.5,-2107 830.5,-2107 "/>
<text text-anchor="middle" x="743" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="655.5,-2084 830.5,-2084 "/>
<text text-anchor="middle" x="743" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="655.5,-2061 830.5,-2061 "/>
<text text-anchor="middle" x="743" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="655.5,-2038 830.5,-2038 "/>
<text text-anchor="middle" x="743" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="655.5,-2015 830.5,-2015 "/>
<text text-anchor="middle" x="743" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="655.5,-1992 830.5,-1992 "/>
<text text-anchor="middle" x="743" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="655.5,-1969 830.5,-1969 "/>
<text text-anchor="middle" x="743" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="655.5,-1946 830.5,-1946 "/>
<text text-anchor="middle" x="743" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="655.5,-1923 830.5,-1923 "/>
<text text-anchor="middle" x="743" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="655.5,-1900 830.5,-1900 "/>
<text text-anchor="middle" x="743" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="830.5,-1877 830.5,-2176 "/>
<text text-anchor="middle" x="841" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge24" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M735.0432,-1876.9841C763.2987,-1820.1772 804.0851,-1761.0143 860.5,-1727 925.1051,-1688.0475 1126.4953,-1728.011 1199.5,-1709 1288.0454,-1685.942 1381.6933,-1633.3266 1434.8394,-1600.4238"/>
<polygon fill="#000000" stroke="#000000" points="1436.7032,-1603.3863 1443.3309,-1595.1205 1432.9952,-1597.4491 1436.7032,-1603.3863"/>
<text text-anchor="middle" x="1268.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- lab_exam -->
<g id="node22" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1397.5,-2008.5C1397.5,-2008.5 1457.5,-2008.5 1457.5,-2008.5 1463.5,-2008.5 1469.5,-2014.5 1469.5,-2020.5 1469.5,-2020.5 1469.5,-2032.5 1469.5,-2032.5 1469.5,-2038.5 1463.5,-2044.5 1457.5,-2044.5 1457.5,-2044.5 1397.5,-2044.5 1397.5,-2044.5 1391.5,-2044.5 1385.5,-2038.5 1385.5,-2032.5 1385.5,-2032.5 1385.5,-2020.5 1385.5,-2020.5 1385.5,-2014.5 1391.5,-2008.5 1397.5,-2008.5"/>
<text text-anchor="middle" x="1427.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge26" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1429.5307,-2008.4026C1437.2303,-1939.7859 1464.696,-1695.0179 1474.7651,-1605.2848"/>
<polygon fill="#000000" stroke="#000000" points="1478.2672,-1605.4605 1475.9043,-1595.1326 1471.3109,-1604.6799 1478.2672,-1605.4605"/>
<text text-anchor="middle" x="1491.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study_site -->
<g id="node23" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M3250,-403.5C3250,-403.5 3567,-403.5 3567,-403.5 3573,-403.5 3579,-409.5 3579,-415.5 3579,-415.5 3579,-460.5 3579,-460.5 3579,-466.5 3573,-472.5 3567,-472.5 3567,-472.5 3250,-472.5 3250,-472.5 3244,-472.5 3238,-466.5 3238,-460.5 3238,-460.5 3238,-415.5 3238,-415.5 3238,-409.5 3244,-403.5 3250,-403.5"/>
<text text-anchor="middle" x="3283" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="3328,-403.5 3328,-472.5 "/>
<text text-anchor="middle" x="3338.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3349,-403.5 3349,-472.5 "/>
<text text-anchor="middle" x="3453.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3349,-449.5 3558,-449.5 "/>
<text text-anchor="middle" x="3453.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="3349,-426.5 3558,-426.5 "/>
<text text-anchor="middle" x="3453.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3558,-403.5 3558,-472.5 "/>
<text text-anchor="middle" x="3568.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge12" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3353.1774,-403.3975C3331.3315,-389.7335 3305.1731,-373.3723 3278.8163,-356.887"/>
<polygon fill="#000000" stroke="#000000" points="3280.5913,-353.869 3270.2571,-351.5335 3276.8793,-359.8037 3280.5913,-353.869"/>
<text text-anchor="middle" x="3353" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge39" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1482.1513,-1548.9812C1494.7522,-1469.6625 1535.7943,-1212.3698 1538.5,-1209 1566.4211,-1174.2254 1608.6306,-1151.7848 1650.0761,-1137.3318"/>
<polygon fill="#000000" stroke="#000000" points="1651.3679,-1140.5904 1659.7402,-1134.0977 1649.1464,-1133.9522 1651.3679,-1140.5904"/>
<text text-anchor="middle" x="1565.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge43" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1578.1851,-1551.4655C1680.5217,-1527.9351 1842.4647,-1483.7875 1970.5,-1417 2002.8093,-1400.1464 2035.2794,-1375.4356 2060.2764,-1354.3298"/>
<polygon fill="#000000" stroke="#000000" points="2062.7973,-1356.7792 2068.12,-1347.6184 2058.2463,-1351.4604 2062.7973,-1356.7792"/>
<text text-anchor="middle" x="1963" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge22" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1536.5376,-1595.0098C1567.6529,-1598.9199 1596,-1591.25 1596,-1572 1596,-1554.8555 1573.5147,-1546.8964 1546.6145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="1546.2006,-1544.6454 1536.5376,-1548.9902 1546.801,-1551.6196 1546.2006,-1544.6454"/>
<text text-anchor="middle" x="1612" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- principal_investigator -->
<g id="node25" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M3609,-403.5C3609,-403.5 3936,-403.5 3936,-403.5 3942,-403.5 3948,-409.5 3948,-415.5 3948,-415.5 3948,-460.5 3948,-460.5 3948,-466.5 3942,-472.5 3936,-472.5 3936,-472.5 3609,-472.5 3609,-472.5 3603,-472.5 3597,-466.5 3597,-460.5 3597,-460.5 3597,-415.5 3597,-415.5 3597,-409.5 3603,-403.5 3609,-403.5"/>
<text text-anchor="middle" x="3684" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="3771,-403.5 3771,-472.5 "/>
<text text-anchor="middle" x="3781.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3792,-403.5 3792,-472.5 "/>
<text text-anchor="middle" x="3859.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="3792,-449.5 3927,-449.5 "/>
<text text-anchor="middle" x="3859.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="3792,-426.5 3927,-426.5 "/>
<text text-anchor="middle" x="3859.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3927,-403.5 3927,-472.5 "/>
<text text-anchor="middle" x="3937.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge10" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3642.1391,-403.4988C3543.8892,-377.496 3408.5718,-341.683 3303.3873,-313.845"/>
<polygon fill="#000000" stroke="#000000" points="3304.189,-310.4367 3293.6263,-311.2616 3302.398,-317.2037 3304.189,-310.4367"/>
<text text-anchor="middle" x="3598" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- physical_exam -->
<g id="node26" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1829.5,-1934.5C1829.5,-1934.5 2145.5,-1934.5 2145.5,-1934.5 2151.5,-1934.5 2157.5,-1940.5 2157.5,-1946.5 2157.5,-1946.5 2157.5,-2106.5 2157.5,-2106.5 2157.5,-2112.5 2151.5,-2118.5 2145.5,-2118.5 2145.5,-2118.5 1829.5,-2118.5 1829.5,-2118.5 1823.5,-2118.5 1817.5,-2112.5 1817.5,-2106.5 1817.5,-2106.5 1817.5,-1946.5 1817.5,-1946.5 1817.5,-1940.5 1823.5,-1934.5 1829.5,-1934.5"/>
<text text-anchor="middle" x="1878.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1939.5,-1934.5 1939.5,-2118.5 "/>
<text text-anchor="middle" x="1950" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1960.5,-1934.5 1960.5,-2118.5 "/>
<text text-anchor="middle" x="2048.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1960.5,-2095.5 2136.5,-2095.5 "/>
<text text-anchor="middle" x="2048.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1960.5,-2072.5 2136.5,-2072.5 "/>
<text text-anchor="middle" x="2048.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1960.5,-2049.5 2136.5,-2049.5 "/>
<text text-anchor="middle" x="2048.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1960.5,-2026.5 2136.5,-2026.5 "/>
<text text-anchor="middle" x="2048.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1960.5,-2003.5 2136.5,-2003.5 "/>
<text text-anchor="middle" x="2048.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1960.5,-1980.5 2136.5,-1980.5 "/>
<text text-anchor="middle" x="2048.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1960.5,-1957.5 2136.5,-1957.5 "/>
<text text-anchor="middle" x="2048.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="2136.5,-1934.5 2136.5,-2118.5 "/>
<text text-anchor="middle" x="2147" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge31" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2038.1374,-1934.3211C2072.3451,-1874.0043 2119.6546,-1794.2142 2166.5,-1727 2176.5069,-1712.6421 2187.4442,-1697.9013 2198.5528,-1683.4906"/>
<polygon fill="#000000" stroke="#000000" points="2201.3703,-1685.5688 2204.737,-1675.5231 2195.8405,-1681.2767 2201.3703,-1685.5688"/>
<text text-anchor="middle" x="2239.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge27" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1949.5798,-1934.2089C1919.1164,-1869.3886 1870.9563,-1784.3577 1807.5,-1727 1738.4942,-1664.6262 1639.9559,-1622.7101 1568.7279,-1598.3623"/>
<polygon fill="#000000" stroke="#000000" points="1569.4586,-1594.9153 1558.8645,-1595.043 1567.2259,-1601.5497 1569.4586,-1594.9153"/>
<text text-anchor="middle" x="1813.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration -->
<g id="node27" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M12,-1785C12,-1785 481,-1785 481,-1785 487,-1785 493,-1791 493,-1797 493,-1797 493,-2256 493,-2256 493,-2262 487,-2268 481,-2268 481,-2268 12,-2268 12,-2268 6,-2268 0,-2262 0,-2256 0,-2256 0,-1797 0,-1797 0,-1791 6,-1785 12,-1785"/>
<text text-anchor="middle" x="85" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="170,-1785 170,-2268 "/>
<text text-anchor="middle" x="180.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="191,-1785 191,-2268 "/>
<text text-anchor="middle" x="331.5" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2245 472,-2245 "/>
<text text-anchor="middle" x="331.5" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="191,-2222 472,-2222 "/>
<text text-anchor="middle" x="331.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="191,-2199 472,-2199 "/>
<text text-anchor="middle" x="331.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="191,-2176 472,-2176 "/>
<text text-anchor="middle" x="331.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="191,-2153 472,-2153 "/>
<text text-anchor="middle" x="331.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="191,-2130 472,-2130 "/>
<text text-anchor="middle" x="331.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2107 472,-2107 "/>
<text text-anchor="middle" x="331.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="191,-2084 472,-2084 "/>
<text text-anchor="middle" x="331.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="191,-2061 472,-2061 "/>
<text text-anchor="middle" x="331.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2038 472,-2038 "/>
<text text-anchor="middle" x="331.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2015 472,-2015 "/>
<text text-anchor="middle" x="331.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="191,-1992 472,-1992 "/>
<text text-anchor="middle" x="331.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="191,-1969 472,-1969 "/>
<text text-anchor="middle" x="331.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-1946 472,-1946 "/>
<text text-anchor="middle" x="331.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="191,-1923 472,-1923 "/>
<text text-anchor="middle" x="331.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="191,-1900 472,-1900 "/>
<text text-anchor="middle" x="331.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="191,-1877 472,-1877 "/>
<text text-anchor="middle" x="331.5" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-1854 472,-1854 "/>
<text text-anchor="middle" x="331.5" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="191,-1831 472,-1831 "/>
<text text-anchor="middle" x="331.5" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-1808 472,-1808 "/>
<text text-anchor="middle" x="331.5" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="472,-1785 472,-2268 "/>
<text text-anchor="middle" x="482.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge41" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M429.6437,-1784.8496C452.5301,-1763.3617 476.9396,-1743.5292 502.5,-1727 708.5855,-1593.7301 1032.5,-1817.4223 1032.5,-1572 1032.5,-1572 1032.5,-1572 1032.5,-1039.5 1032.5,-838.8146 1058.203,-759.3747 1204.5,-622 1228.047,-599.8891 1258.4152,-584.3179 1288.9941,-573.3598"/>
<polygon fill="#000000" stroke="#000000" points="1290.1601,-576.6601 1298.4836,-570.105 1287.8889,-570.0388 1290.1601,-576.6601"/>
<text text-anchor="middle" x="1063.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge29" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M417.9251,-1784.9106C443.702,-1761.8744 471.9866,-1741.6762 502.5,-1727 557.0012,-1700.7864 986.8952,-1719.2369 1046.5,-1709 1180.3425,-1686.0131 1330.0791,-1631.7474 1413.4382,-1598.8289"/>
<polygon fill="#000000" stroke="#000000" points="1414.7733,-1602.0646 1422.7756,-1595.121 1412.1898,-1595.5588 1414.7733,-1602.0646"/>
<text text-anchor="middle" x="1147.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
</g>
</svg>
</div>
