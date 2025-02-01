package gb_core

type rom_header struct {
	entry [4]byte
	logo  [48]byte

	title            [16]byte
	new_license_code uint16
	sgb_flag         byte
	rom_type         byte
	rom_size         byte
	ram_size         byte
	destination_code byte
	old_license_code byte
	version          byte
	checksum         byte
	global_checksum  uint16
}

type rom_context struct {
	filename   string
	rom_size   uint32
	rom_data   []byte
	rom_header *rom_header
}

func getPublisherFromLicenseCode(code string) string {
	switch code {
	case "00":
		return "None"
	case "01":
		return "Nintendo Research & Development 1"
	case "08":
		return "Capcom"
	case "13":
		return "EA (Electronic Arts)"
	case "18":
		return "Hudson Soft"
	case "19":
		return "B-AI"
	case "20":
		return "KSS"
	case "22":
		return "Planning Office WADA"
	case "24":
		return "PCM Complete"
	case "25":
		return "San-X"
	case "28":
		return "Kemco"
	case "29":
		return "SETA Corporation"
	case "30":
		return "Viacom"
	case "31":
		return "Nintendo"
	case "32":
		return "Bandai"
	case "33":
		return "Ocean Software/Acclaim Entertainment"
	case "34":
		return "Konami"
	case "35":
		return "HectorSoft"
	case "37":
		return "Taito"
	case "38":
		return "Hudson Soft"
	case "39":
		return "Banpresto"
	case "41":
		return "Ubi Soft1"
	case "42":
		return "Atlus"
	case "44":
		return "Malibu Interactive"
	case "46":
		return "Angel"
	case "47":
		return "Bullet-Proof Software2"
	case "49":
		return "Irem"
	case "50":
		return "Absolute"
	case "51":
		return "Acclaim Entertainment"
	case "52":
		return "Activision"
	case "53":
		return "Sammy USA Corporation"
	case "54":
		return "Konami"
	case "55":
		return "Hi Tech Expressions"
	case "56":
		return "LJN"
	case "57":
		return "Matchbox"
	case "58":
		return "Mattel"
	case "59":
		return "Milton Bradley Company"
	case "60":
		return "Titus Interactive"
	case "61":
		return "Virgin Games Ltd.3"
	case "64":
		return "Lucasfilm Games4"
	case "67":
		return "Ocean Software"
	case "69":
		return "EA (Electronic Arts)"
	case "70":
		return "Infogrames5"
	case "71":
		return "Interplay Entertainment"
	case "72":
		return "Broderbund"
	case "73":
		return "Sculptured Software6"
	case "75":
		return "The Sales Curve Limited7"
	case "78":
		return "THQ"
	case "79":
		return "Accolade"
	case "80":
		return "Misawa Entertainment"
	case "83":
		return "lozc"
	case "86":
		return "Tokuma Shoten"
	case "87":
		return "Tsukuda Original"
	case "91":
		return "Chunsoft Co.8"
	case "92":
		return "Video System"
	case "93":
		return "Ocean Software/Acclaim Entertainment"
	case "95":
		return "Varie"
	case "96":
		return "Yonezawa/s’pal"
	case "97":
		return "Kaneko"
	case "99":
		return "Pack-In-Video"
	case "9H":
		return "Bottom Up"
	case "A4":
		return "Konami (Yu-Gi-Oh!)"
	case "BL":
		return "MTO"
	case "DK":
		return "Kodansha"
	default:
		return ""
	}
}

func Load() {

}
