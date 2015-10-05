# Source: https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
module ThatLanguage
  module Iso639
    def self.[](language_code)
      LOOKUP_HASH[language_code.to_sym]
    end

    private

    LOOKUP_HASH = {
      aa: :"Afar",
      ab: :"Abkhaz",
      ac: :"Australian",
      ae: :"Avestan",
      af: :"Afrikaans",
      ak: :"Akan",
      am: :"Amharic",
      an: :"Aragonese",
      ar: :"Arabic",
      as: :"Assamese",
      av: :"Avaric",
      ay: :"Aymara",
      az: :"Azerbaijani",
      ba: :"Bashkir",
      be: :"Belarusian",
      bg: :"Bulgarian",
      bh: :"Bihari",
      bi: :"Bislama",
      bm: :"Bambara",
      # bn: :"Bengali, Bangla",
      bn: :"Bengali",
      bo: :"Tibetan Standard, Tibetan, Central",
      br: :"Breton",
      bs: :"Bosnian",
      ca: :"Catalan",
      ce: :"Chechen",
      ch: :"Chamorro",
      co: :"Corsican",
      cr: :"Cree",
      cs: :"Czech",
      cu: :"Old Church Slavonic, Church Slavonic, Old Bulgarian",
      cv: :"Chuvash",
      cy: :"Welsh",
      da: :"Danish",
      de: :"German",
      dv: :"Divehi, Dhivehi, Maldivian",
      dz: :"Dzongkha",
      ee: :"Ewe",
      # el: :"Greek (modern)",
      el: :"Greek",
      en: :"English",
      eo: :"Esperanto",
      es: :"Spanish",
      et: :"Estonian",
      eu: :"Basque",
      # fa: :"Persian (Farsi)",
      fa: :"Persian",
      # ff: :"Fula, Fulah, Pulaar, Pular",
      ff: :"Fula",
      fi: :"Finnish",
      fj: :"Fijian",
      fo: :"Faroese",
      fr: :"French",
      fy: :"Western Frisian",
      ga: :"Irish",
      gd: :"Scottish Gaelic, Gaelic",
      gl: :"Galician",
      gn: :"Guaraní",
      gu: :"Gujarati",
      gv: :"Manx",
      ha: :"Hausa",
      # he: :"Hebrew (modern)",
      he: :"Hebrew",
      hi: :"Hindi",
      ho: :"Hiri Motu",
      hr: :"Croatian",
      ht: :"Haitian, Haitian Creole",
      hu: :"Hungarian",
      hy: :"Armenian",
      hz: :"Herero",
      ia: :"Interlingua",
      id: :"Indonesian",
      ie: :"Interlingue",
      ig: :"Igbo",
      ii: :"Nuosu",
      ik: :"Inupiaq",
      io: :"Ido",
      is: :"Icelandic",
      it: :"Italian",
      iu: :"Inuktitut",
      ja: :"Japanese",
      jv: :"Javanese",
      ka: :"Georgian",
      kg: :"Kongo",
      ki: :"Kikuyu, Gikuyu",
      kj: :"Kwanyama, Kuanyama",
      kk: :"Kazakh",
      kl: :"Kalaallisut, Greenlandic",
      km: :"Khmer",
      kn: :"Kannada",
      ko: :"Korean",
      kr: :"Kanuri",
      ks: :"Kashmiri",
      ku: :"Kurdish",
      kv: :"Komi",
      kw: :"Cornish",
      ky: :"Kyrgyz",
      la: :"Latin",
      lb: :"Luxembourgish, Letzeburgesch",
      lg: :"Ganda",
      li: :"Limburgish, Limburgan, Limburger",
      ln: :"Lingala",
      lo: :"Lao",
      lt: :"Lithuanian",
      lu: :"Luba-Katanga",
      lv: :"Latvian",
      mg: :"Malagasy",
      mh: :"Marshallese",
      mi: :"Māori",
      mk: :"Macedonian",
      ml: :"Malayalam",
      mn: :"Mongolian",
      mr: :"Marathi (Marāṭhī)",
      ms: :"Malay",
      mt: :"Maltese",
      my: :"Burmese",
      na: :"Nauru",
      nb: :"Norwegian Bokmål",
      nd: :"Northern Ndebele",
      ne: :"Nepali",
      ng: :"Ndonga",
      nl: :"Dutch",
      nn: :"Norwegian Nynorsk",
      no: :"Norwegian",
      nr: :"Southern Ndebele",
      nv: :"Navajo, Navaho",
      ny: :"Chichewa, Chewa, Nyanja",
      oc: :"Occitan",
      oj: :"Ojibwe, Ojibwa",
      om: :"Oromo",
      or: :"Oriya",
      os: :"Ossetian, Ossetic",
      # pa: :"Panjabi, Punjabi",
      pa: :"Panjabi",
      pi: :"Pāli",
      pl: :"Polish",
      ps: :"Pashto, Pushto",
      pt: :"Portuguese",
      qu: :"Quechua",
      rm: :"Romansh",
      rn: :"Kirundi",
      ro: :"Romanian",
      ru: :"Russian",
      rw: :"Kinyarwanda",
      sa: :"Sanskrit (Saṁskṛta)",
      sc: :"Sardinian",
      sd: :"Sindhi",
      se: :"Northern Sami",
      sg: :"Sango",
      si: :"Sinhala, Sinhalese",
      sk: :"Slovak",
      sl: :"Slovene",
      sm: :"Samoan",
      sn: :"Shona",
      so: :"Somali",
      sq: :"Albanian",
      sr: :"Serbian",
      ss: :"Swati",
      st: :"Southern Sotho",
      su: :"Sundanese",
      sv: :"Swedish",
      sw: :"Swahili",
      ta: :"Tamil",
      te: :"Telugu",
      tg: :"Tajik",
      th: :"Thai",
      ti: :"Tigrinya",
      tk: :"Turkmen",
      tl: :"Tagalog",
      tn: :"Tswana",
      to: :"Tonga (Tonga Islands)",
      tr: :"Turkish",
      ts: :"Tsonga",
      tt: :"Tatar",
      tw: :"Twi",
      ty: :"Tahitian",
      ug: :"Uyghur",
      uk: :"Ukrainian",
      ur: :"Urdu",
      uz: :"Uzbek",
      ve: :"Venda",
      vi: :"Vietnamese",
      vo: :"Volapük",
      wa: :"Walloon",
      wo: :"Wolof",
      xh: :"Xhosa",
      yi: :"Yiddish",
      yo: :"Yoruba",
      za: :"Zhuang, Chuang",
      zh: :"Chinese",
      zu: :"Zulu"
    }
  end
end
