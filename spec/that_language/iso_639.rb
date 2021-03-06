require 'spec_helper'

describe ThatLanguage::Iso639 do
  def self.assert_iso_639(language_code, language)
    context "with '#{language_code}' as language_code" do
      subject { described_class[language_code] }
      let(:language_code) { language_code }

      it { is_expected.to eq(language) }
    end
  end

  describe "[language_code]" do
    assert_iso_639 :en, :English
    assert_iso_639 "en", :English

    assert_iso_639 :aa, :"Afar"
    assert_iso_639 :ab, :"Abkhaz"
    assert_iso_639 :ac, :"Australian"
    assert_iso_639 :ae, :"Avestan"
    assert_iso_639 :af, :"Afrikaans"
    assert_iso_639 :ak, :"Akan"
    assert_iso_639 :am, :"Amharic"
    assert_iso_639 :an, :"Aragonese"
    assert_iso_639 :ar, :"Arabic"
    assert_iso_639 :as, :"Assamese"
    assert_iso_639 :av, :"Avaric"
    assert_iso_639 :ay, :"Aymara"
    assert_iso_639 :az, :"Azerbaijani"
    assert_iso_639 :ba, :"Bashkir"
    assert_iso_639 :be, :"Belarusian"
    assert_iso_639 :bg, :"Bulgarian"
    assert_iso_639 :bh, :"Bihari"
    assert_iso_639 :bi, :"Bislama"
    assert_iso_639 :bm, :"Bambara"
    assert_iso_639 :bn, :"Bengali, Bangla"
    assert_iso_639 :bo, :"Tibetan Standard, Tibetan, Central"
    assert_iso_639 :br, :"Breton"
    assert_iso_639 :bs, :"Bosnian"
    assert_iso_639 :ca, :"Catalan"
    assert_iso_639 :ce, :"Chechen"
    assert_iso_639 :ch, :"Chamorro"
    assert_iso_639 :co, :"Corsican"
    assert_iso_639 :cr, :"Cree"
    assert_iso_639 :cs, :"Czech"
    assert_iso_639 :cu, :"Old Church Slavonic, Church Slavonic, Old Bulgarian"
    assert_iso_639 :cv, :"Chuvash"
    assert_iso_639 :cy, :"Welsh"
    assert_iso_639 :da, :"Danish"
    assert_iso_639 :de, :"German"
    assert_iso_639 :dv, :"Divehi, Dhivehi, Maldivian"
    assert_iso_639 :dz, :"Dzongkha"
    assert_iso_639 :ee, :"Ewe"
    assert_iso_639 :el, :"Greek (modern)"
    assert_iso_639 :en, :"English"
    assert_iso_639 :eo, :"Esperanto"
    assert_iso_639 :es, :"Spanish"
    assert_iso_639 :et, :"Estonian"
    assert_iso_639 :eu, :"Basque"
    assert_iso_639 :fa, :"Persian (Farsi)"
    assert_iso_639 :ff, :"Fula, Fulah, Pulaar, Pular"
    assert_iso_639 :fi, :"Finnish"
    assert_iso_639 :fj, :"Fijian"
    assert_iso_639 :fo, :"Faroese"
    assert_iso_639 :fr, :"French"
    assert_iso_639 :fy, :"Western Frisian"
    assert_iso_639 :ga, :"Irish"
    assert_iso_639 :gd, :"Scottish Gaelic, Gaelic"
    assert_iso_639 :gl, :"Galician"
    assert_iso_639 :gn, :"Guaraní"
    assert_iso_639 :gu, :"Gujarati"
    assert_iso_639 :gv, :"Manx"
    assert_iso_639 :ha, :"Hausa"
    assert_iso_639 :he, :"Hebrew (modern)"
    assert_iso_639 :hi, :"Hindi"
    assert_iso_639 :ho, :"Hiri Motu"
    assert_iso_639 :hr, :"Croatian"
    assert_iso_639 :ht, :"Haitian, Haitian Creole"
    assert_iso_639 :hu, :"Hungarian"
    assert_iso_639 :hy, :"Armenian"
    assert_iso_639 :hz, :"Herero"
    assert_iso_639 :ia, :"Interlingua"
    assert_iso_639 :id, :"Indonesian"
    assert_iso_639 :ie, :"Interlingue"
    assert_iso_639 :ig, :"Igbo"
    assert_iso_639 :ii, :"Nuosu"
    assert_iso_639 :ik, :"Inupiaq"
    assert_iso_639 :io, :"Ido"
    assert_iso_639 :is, :"Icelandic"
    assert_iso_639 :it, :"Italian"
    assert_iso_639 :iu, :"Inuktitut"
    assert_iso_639 :ja, :"Japanese"
    assert_iso_639 :jv, :"Javanese"
    assert_iso_639 :ka, :"Georgian"
    assert_iso_639 :kg, :"Kongo"
    assert_iso_639 :ki, :"Kikuyu, Gikuyu"
    assert_iso_639 :kj, :"Kwanyama, Kuanyama"
    assert_iso_639 :kk, :"Kazakh"
    assert_iso_639 :kl, :"Kalaallisut, Greenlandic"
    assert_iso_639 :km, :"Khmer"
    assert_iso_639 :kn, :"Kannada"
    assert_iso_639 :ko, :"Korean"
    assert_iso_639 :kr, :"Kanuri"
    assert_iso_639 :ks, :"Kashmiri"
    assert_iso_639 :ku, :"Kurdish"
    assert_iso_639 :kv, :"Komi"
    assert_iso_639 :kw, :"Cornish"
    assert_iso_639 :ky, :"Kyrgyz"
    assert_iso_639 :la, :"Latin"
    assert_iso_639 :lb, :"Luxembourgish, Letzeburgesch"
    assert_iso_639 :lg, :"Ganda"
    assert_iso_639 :li, :"Limburgish, Limburgan, Limburger"
    assert_iso_639 :ln, :"Lingala"
    assert_iso_639 :lo, :"Lao"
    assert_iso_639 :lt, :"Lithuanian"
    assert_iso_639 :lu, :"Luba-Katanga"
    assert_iso_639 :lv, :"Latvian"
    assert_iso_639 :mg, :"Malagasy"
    assert_iso_639 :mh, :"Marshallese"
    assert_iso_639 :mi, :"Māori"
    assert_iso_639 :mk, :"Macedonian"
    assert_iso_639 :ml, :"Malayalam"
    assert_iso_639 :mn, :"Mongolian"
    assert_iso_639 :mr, :"Marathi (Marāṭhī)"
    assert_iso_639 :ms, :"Malay"
    assert_iso_639 :mt, :"Maltese"
    assert_iso_639 :my, :"Burmese"
    assert_iso_639 :na, :"Nauru"
    assert_iso_639 :nb, :"Norwegian Bokmål"
    assert_iso_639 :nd, :"Northern Ndebele"
    assert_iso_639 :ne, :"Nepali"
    assert_iso_639 :ng, :"Ndonga"
    assert_iso_639 :nl, :"Dutch"
    assert_iso_639 :nn, :"Norwegian Nynorsk"
    assert_iso_639 :no, :"Norwegian"
    assert_iso_639 :nr, :"Southern Ndebele"
    assert_iso_639 :nv, :"Navajo, Navaho"
    assert_iso_639 :ny, :"Chichewa, Chewa, Nyanja"
    assert_iso_639 :oc, :"Occitan"
    assert_iso_639 :oj, :"Ojibwe, Ojibwa"
    assert_iso_639 :om, :"Oromo"
    assert_iso_639 :or, :"Oriya"
    assert_iso_639 :os, :"Ossetian, Ossetic"
    assert_iso_639 :pa, :"Panjabi, Punjabi"
    assert_iso_639 :pi, :"Pāli"
    assert_iso_639 :pl, :"Polish"
    assert_iso_639 :ps, :"Pashto, Pushto"
    assert_iso_639 :pt, :"Portuguese"
    assert_iso_639 :qu, :"Quechua"
    assert_iso_639 :rm, :"Romansh"
    assert_iso_639 :rn, :"Kirundi"
    assert_iso_639 :ro, :"Romanian"
    assert_iso_639 :ru, :"Russian"
    assert_iso_639 :rw, :"Kinyarwanda"
    assert_iso_639 :sa, :"Sanskrit (Saṁskṛta)"
    assert_iso_639 :sc, :"Sardinian"
    assert_iso_639 :sd, :"Sindhi"
    assert_iso_639 :se, :"Northern Sami"
    assert_iso_639 :sg, :"Sango"
    assert_iso_639 :si, :"Sinhala, Sinhalese"
    assert_iso_639 :sk, :"Slovak"
    assert_iso_639 :sl, :"Slovene"
    assert_iso_639 :sm, :"Samoan"
    assert_iso_639 :sn, :"Shona"
    assert_iso_639 :so, :"Somali"
    assert_iso_639 :sq, :"Albanian"
    assert_iso_639 :sr, :"Serbian"
    assert_iso_639 :ss, :"Swati"
    assert_iso_639 :st, :"Southern Sotho"
    assert_iso_639 :su, :"Sundanese"
    assert_iso_639 :sv, :"Swedish"
    assert_iso_639 :sw, :"Swahili"
    assert_iso_639 :ta, :"Tamil"
    assert_iso_639 :te, :"Telugu"
    assert_iso_639 :tg, :"Tajik"
    assert_iso_639 :th, :"Thai"
    assert_iso_639 :ti, :"Tigrinya"
    assert_iso_639 :tk, :"Turkmen"
    assert_iso_639 :tl, :"Tagalog"
    assert_iso_639 :tn, :"Tswana"
    assert_iso_639 :to, :"Tonga (Tonga Islands)"
    assert_iso_639 :tr, :"Turkish"
    assert_iso_639 :ts, :"Tsonga"
    assert_iso_639 :tt, :"Tatar"
    assert_iso_639 :tw, :"Twi"
    assert_iso_639 :ty, :"Tahitian"
    assert_iso_639 :ug, :"Uyghur"
    assert_iso_639 :uk, :"Ukrainian"
    assert_iso_639 :ur, :"Urdu"
    assert_iso_639 :uz, :"Uzbek"
    assert_iso_639 :ve, :"Venda"
    assert_iso_639 :vi, :"Vietnamese"
    assert_iso_639 :vo, :"Volapük"
    assert_iso_639 :wa, :"Walloon"
    assert_iso_639 :wo, :"Wolof"
    assert_iso_639 :xh, :"Xhosa"
    assert_iso_639 :yi, :"Yiddish"
    assert_iso_639 :yo, :"Yoruba"
    assert_iso_639 :za, :"Zhuang, Chuang"
    assert_iso_639 :zh, :"Chinese"
    assert_iso_639 :zu, :"Zulu"
  end
end
