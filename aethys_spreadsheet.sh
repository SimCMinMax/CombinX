#!/bin/sh

export simc="/Users/quentingiraud/Documents/github/simc/simc"
read -p "Enter the Magic Number: " INPUT

export tempoutput="aethys_cmd_templog.txt"
export output="aethys_cmd_log.txt"
export t_asn_1t="talents=2110111"
export t_asn_2t="talents=2110121"
export t_asn_3t="talents=2210121"
export t_asn_1ta="talents=2310121"
export t_asn_1t="talents=2110111"
export t_asn_2t="talents=2110121"
export t_asn_3t="talents=2210121"
export t_asn_1ta="talents=2310121"
export t_otl_1t="talents=1310022"
export t_otl_2t="talents=1310023"
export t_otl_3t="talents=1310023"
export t_otl_1ta="talents=1310022"
export t_sub_1t="talents=2210011"
export t_sub_2t="talents=2210011"
export t_sub_3t="talents=2210023"
export t_sub_1ta="talents=2210012"

if [ $INPUT == "0" ]
then
	(
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc input=legendaries_duo.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19h" input=main.simc input=legendaries_duo.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=legendaries_duo.simc input=report_html.simc input=report_json.simc
	) > $tempoutput
	exit
elif [ $INPUT == "1" ]
then
	(
		echo "Doing Talents Comparison Set"

		echo "1-Target"
		echo "Rogue Assassination"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc "\$(row)=all" input=talents.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc "\$(row)=all" input=talents.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc "\$(row)=all" input=talents.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc "\$(row)=all" input=talents.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc "\$(row)=all" input=talents.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc "\$(row)=all" input=talents.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc "\$(row)=all" input=talents.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc "\$(row)=all" input=talents.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc "\$(row)=all" input=talents.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(row)=all" input=talents.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(row)=all" input=talents.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.4 "\$(fight_style)=1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(row)=all" input=talents.simc input=report_json.simc
	) > $output
	exit
elif [ $INPUT == "2" ]
then
	(
		echo "Doing Artifact Paths Comparison Set"

		echo "1-Target"
		echo "Rogue Subtlety T19M Rank 19"
		$simc input=global.simc output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=19" input=artifact_path.simc input=report_json.simc
		echo "Rogue Subtlety T19M Rank 26"
		$simc input=global.simc output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=26" input=artifact_path.simc input=report_json.simc
		echo "Rogue Outlaw T19M Rank 19"
		$simc input=global.simc output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=19" input=artifact_path.simc input=report_json.simc
		echo "Rogue Outlaw T19M Rank 26"
		$simc input=global.simc output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=26" input=artifact_path.simc input=report_json.simc
		echo "Rogue Assassination T19M Rank 19"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=19" input=artifact_path.simc input=report_json.simc
		echo "Rogue Assassination T19M Rank 26"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=26" input=artifact_path.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Subtlety T19M Rank 19"
		$simc input=global.simc output=/dev/null target_error=0.8 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=19" input=artifact_path.simc input=report_json.simc
		echo "Rogue Subtlety T19M Rank 26"
		$simc input=global.simc output=/dev/null target_error=0.8 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=26" input=artifact_path.simc input=report_json.simc
		echo "Rogue Outlaw T19M Rank 19"
		$simc input=global.simc output=/dev/null target_error=0.8 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=19" input=artifact_path.simc input=report_json.simc
		echo "Rogue Outlaw T19M Rank 26"
		$simc input=global.simc output=/dev/null target_error=0.8 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=26" input=artifact_path.simc input=report_json.simc
		echo "Rogue Assassination T19M Rank 19"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=19" input=artifact_path.simc input=report_json.simc
		echo "Rogue Assassination T19M Rank 26"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc "\$(artifact_rank)=26" input=artifact_path.simc input=report_json.simc
	) > $output
	exit
elif [ $INPUT == "3" ]
then
	(
		echo "Doing Main Comparison Set"

		echo "1-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
	) > $output
	exit
elif [ $INPUT == "4" ]
then
	(
		echo "Doing Main Combined Comparison Set"

		echo "1-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(sim_type)=default_combined" "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(clas)=discord_rog" "\$(spec)=all" "\$(tier)=t19x" input=report_html.simc

		echo "2-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(sim_type)=default_combined" "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(clas)=discord_rog" "\$(spec)=all" "\$(tier)=t19x" input=report_html.simc

		echo "3-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(sim_type)=default_combined" "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(clas)=discord_rog" "\$(spec)=all" "\$(tier)=t19x" input=report_html.simc

		echo "1-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(sim_type)=default_combined" "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(clas)=discord_rog" "\$(spec)=all" "\$(tier)=t19x" input=report_html.simc
	) > $output
	exit
elif [ $INPUT == "5" ]
then
	(
		echo "Doing Legendaries Comparison Set"

		echo "1-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
	) > $output
	exit
elif [ $INPUT == "6" ]
then
	(
		echo "Doing Legendaries Combined Comparison Set"

		echo "1-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(clas)=discord_rog" "\$(spec)=all" input=report_html.simc

		echo "2-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(clas)=discord_rog" "\$(spec)=all" input=report_html.simc

		echo "3-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(clas)=discord_rog" "\$(spec)=all" input=report_html.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(clas)=discord_rog" "\$(spec)=all" input=report_html.simc
	) > $output
	exit
elif [ $INPUT == "7" ]
then
	(
		echo "Doing Stats Scaling Set"

		echo "1-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.05 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(stats_to_scale)=agility,crit_rating,haste_rating,mastery_rating,versatility_rating,weapon_dps" input=stats_scaling.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
	) > $output
	exit
elif [ $INPUT == "8" ]
then
	(
		echo "Doing Main Races Comparison"

		echo "1-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=races.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=races.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=races.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
	) > $output
	exit
elif [ $INPUT == "9" ]
then
	(
		echo "Doing Trinkets Comparisson"

		echo "1-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19h" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19h" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19h" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
	) > $output
	exit
elif [ $INPUT == "10" ]
then
	(
		echo "Doing Relics"

		echo "1-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=relics.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=relics.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=relics.simc input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=relics.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=relics.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=relics.simc input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=relics.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=relics.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=relics.simc input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=1ta" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=relics.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=1ta" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=relics.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.6 "\$(fight_style)=1ta" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=relics.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
	) > $output
	exit
elif [ $INPUT == "11" ]
then
	(
		echo "Doing 4D Plotting"

		echo "1-Target"
		echo "Rogue Subtlety T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc
		echo "Rogue Assassination T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc
		echo "Rogue Outlaw T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Subtlety T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc
		echo "Rogue Assassination T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc
		echo "Rogue Outlaw T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Subtlety T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=3t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc
		echo "Rogue Assassination T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=3t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc
		echo "Rogue Outlaw T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=3t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Subtlety T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc
		echo "Rogue Assassination T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc
		echo "Rogue Outlaw T19M 21k"
		$simc input=global.simc threads=2 output=/dev/null target_error=0.8 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=rogue_t19m_plot_21kstats_by1066.simc input=report_json.simc
	) > $output
	exit
elif [ $INPUT == "20" ]
then
	(
		echo "Full Combo"


		echo "Doing Main Combined Comparison Set"

		echo "1-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(sim_type)=default_combined" "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(clas)=discord_rog" "\$(spec)=all" "\$(tier)=t19x" input=report_html.simc

		echo "2-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(sim_type)=default_combined" "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(clas)=discord_rog" "\$(spec)=all" "\$(tier)=t19x" input=report_html.simc

		echo "3-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(sim_type)=default_combined" "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(clas)=discord_rog" "\$(spec)=all" "\$(tier)=t19x" input=report_html.simc

		echo "1-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(sim_type)=default_combined" "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(clas)=discord_rog" "\$(spec)=all" "\$(tier)=t19x" input=report_html.simc


		echo "Doing Legendaries Combined Comparison Set"

		echo "1-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(clas)=discord_rog" "\$(spec)=all" input=report_html.simc

		echo "2-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(clas)=discord_rog" "\$(spec)=all" input=report_html.simc

		echo "3-Target"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(clas)=discord_rog" "\$(spec)=all" input=report_html.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination & Outlaw & Subtlety @ T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(clas)=discord_rog" "\$(spec)=all" input=report_html.simc


		echo "Doing Main Comparison Set"

		echo "1-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.1 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc "\$(tier)=t19h" input=main.simc "\$(tier)=t19m" input=main.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc "\$(tier)=t19x" input=report_html.simc input=report_json.simc


		echo "Doing Legendaries Comparison Set"

		echo "1-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input="\$(gear_path)"no_legendary.simc input=legendaries.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc


		echo "Doing Main Races Comparison"

		echo "1-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=races.simc input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=races.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=races.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=races.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc


		echo "Doing Trinkets Comparisson"

		echo "1-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc

		echo "2-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_asn_2t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_otl_2t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=2t" "\$(option_override)=$t_sub_2t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc

		echo "3-Target"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_asn_3t" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_otl_3t" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19h" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=3t" "\$(option_override)=$t_sub_3t" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=trinkets.simc input=report_html.simc input=report_json.simc

		echo "1-Target RE-Adds:4_3x_30_10"
		echo "Rogue Assassination T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19p" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19h" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_asn_1ta" "\$(specialization)=assassination" "\$(tier)=t19m" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Outlaw T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19p" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19h" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_otl_1ta" "\$(specialization)=outlaw" "\$(tier)=t19m" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		echo "Rogue Subtlety T19P & T19H & T19M"
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19p" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19h" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
		$simc input=global.simc output=/dev/null target_error=0.2 "\$(fight_style)=1t" "\$(option_override)=$t_sub_1ta" "\$(specialization)=subtlety" "\$(tier)=t19m" input=main.simc input=trinkets.simc input="\$(fight_style_path)"aethys_adds_4_3x_30_10.simc input=report_html.simc input=report_json.simc
	) > $output
	exit
fi
