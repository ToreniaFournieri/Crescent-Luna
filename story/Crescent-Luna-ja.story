@scene part1_dungeon
system: 第一部
system: 地下牢
system: ムリドの隊商 — 夜明け前
system: フェリディアン領の彼方に雨雲が垂れ込めている。
-> p001_rizos_assignment

@scene p001_rizos_assignment
rizo: ノックス。
rizo: こっちへ来い。
system: リゾは木箱の上に古い地図を広げる。
rizo: 入口を見つけた。
rizo: 三日月の翡翠は、この遺跡の地下のどこかにある。
nox [thought]: どの隊商も探し続けてきた宝だ。
rizo: 古い通路を崩さずに入れるほど小さいのは、お前だけだ。
-> p001_reply

@prompt p001_reply “あなたは”

* “僕に先に行けと言っている” => “僕に先に行けと言っているんだね。” -> p003_rizos_smile
* “三日月の翡翠を見つけた” => “三日月の翡翠を見つけたの？” -> p002_false_map
* “僕一人で入れと言っている” => “僕一人で入れと言っているの？” -> p003_rizos_smile

@scene p002_false_map
rizo: 見つけたのは道筋だ。
rizo: 宝そのものは、まだ俺たちを待っている。
system: リゾは廊下の脇に描かれた三つの円を指で叩く。
rizo: 円が三つなら安全という意味だ。
rizo: 印に従い、翡翠を見つけて戻ってこい。
nox [thought]: 持ち帰れば、もう誰も僕を役立たずとは呼ばない。
-> p002_reply

@prompt p002_reply “僕は”

* “地図に従う” => “地図に従う。” -> p004_split_stair
* “まず地図を調べる” => “まず地図を調べる。” -> p005_ink_over_scratches
* “なぜ誰も一緒に来ないのか尋ねる” => “なぜ誰も一緒に来ないのか尋ねる。” -> p003_rizos_smile

@scene p003_rizos_smile
rizo: 一人だと？
rizo: まるで俺がお前を見捨てるみたいな言い方だな。
rizo: 俺たちは外で待っている。
rizo: お前が道を確かめたら、全員で一緒に入る。
system: ほかの盗賊たちはノックスと目を合わせようとしない。
nox [thought]: 誰も松明を用意していない。
nox [thought]: 誰も登攀用のロープを持ってきていない。
-> p003_reply

@prompt p003_reply “それなら”

* “地図を渡して” => “それなら地図を渡して。” -> p002_false_map
* “誰かを一緒に行かせて” => “それなら誰かを一緒に行かせて。” -> p006_no_place
* “前の斥候に何があったのか教えて” => “前の斥候に何があったのか教えて。” -> p003_last_scout

@scene p003_last_scout
system: リゾの笑みが、ほんの一瞬だけ消える。
rizo: 前の斥候などいない。
rizo: 怯える理由を勝手に作るな。
nox [thought]: 怖いなんて、僕は言っていない。
-> p003_last_reply

@prompt p003_last_reply “僕は”

* “分かった” => “分かった。” -> p002_false_map
* “あなたを信じない” => “あなたを信じない。” -> p006_no_place
* “宝を持って戻る” => “宝を持って戻る。” -> p002_false_map

@scene p005_ink_over_scratches
system: ノックスは朝の光に地図をかざす。
system: いくつもの矢印が、新しい黒インクで描き足されている。
system: その下には、古い印が残っている。
nox [thought]: リゾは何かを覆い隠した。
system: 一つの矢印の下に、欠けた三日月の印がある。
system: 別の通路は完全に削り消されている。
-> p005_reply

@prompt p005_reply “古い印は”

* “より安全な道を示しているかもしれない” => “古い印は、より安全な道を示しているかもしれない。” -> p009_broken_crescent
* “おそらくもう古くて役に立たない” => “古い印は、おそらくもう古くて役に立たない。” -> p004_split_stair
* “リゾが以前ここに入った証拠だ” => “古い印は、リゾが以前ここに入った証拠だ。” -> p003_rizos_smile

@scene p006_no_place
rizo: お前のために、ほかの盗賊にも命を懸けろと言うのか？
rizo: どうやら、お前には一人前の取り分を得る覚悟がないらしい。
bandit: ちびネズミは荷車の番でもしていろ。
bandit: もっと勇敢な奴を探せばいい。
nox [thought]: 断れば、これからずっと言われ続ける。
-> p006_reply

@prompt p006_reply “僕は”

* “地下牢に入る” => “地下牢に入る。” -> p002_false_map
* “隊商を離れる” => “隊商を離れる。” -> ending_no_adventure
* “ただ質問しただけだ” => “ただ質問しただけだ。” -> p002_false_map

@ending ending_no_adventure “冒険は始まらなかった”
system: ノックスは夜明け前に立ち去る。
system: 彼はフェリディアン遺跡へ入らない。
system: 三日月の翡翠を見つけることもない。
system: ルナと出会うこともない。
system: 生き延びるとは、立ち去ることを意味する場合もある。
system: だが、立ち去ることがもはやできなくなったときにしか始まらない物語もある。

@scene p004_split_stair
system: フェリディアン遺跡 — 地下牢上層
system: 低い石のうなりとともに、ノックスの背後で入口が閉じる。
system: 二つの階段が遺跡の地下へ続いている。
system: 左の階段は広く、完全に乾いている。
system: 右の階段は狭く、湿っている。
nox [thought]: リゾの矢印は左を指している。
system: 右からは、かすかな冷気が上ってくる。
-> p004_reply

@prompt p004_reply “僕は”

* “印のある乾いた階段を進む” => “印のある乾いた階段を進む。” -> p007_breathless_hall
* “空気が動く湿った階段を進む” => “空気が動く湿った階段を進む。” -> p008_moths_in_dark
* “時間をかけて両方の道を調べる” => “時間をかけて両方の道を調べる。” -> p004_inspection

@scene p004_inspection
system: 乾いた階段は埃に覆われている。
system: 最近、何かが通った形跡はない。
system: 湿った通路の近くには、小さな白い蛾が止まっている。
nox [thought]: 生き物には空気が必要だ。
-> p004_inspection_reply

@prompt p004_inspection_reply “この”

* “蛾は新鮮な空気を追っているのかもしれない” => “この蛾は新鮮な空気を追っているのかもしれない。” -> p008_moths_in_dark
* “誰も通っていない階段のほうが安全なはずだ” => “誰も通っていない階段のほうが安全なはずだ。” -> p007_breathless_hall
* “虫より地図のほうが信用できる” => “虫より地図のほうが信用できる。” -> p007_breathless_hall

@scene p007_breathless_hall
system: 乾いた階段は、長い石造りの廊下へ続いている。
system: 風はまったくない。
system: 石の隙間を這う虫もいない。
rizo [memory]: 円が三つなら完全に安全だ。
system: ノックスはランタンを持ち上げる。
system: 炎が小さな青い点に縮む。
-> p007_reply

@prompt p007_reply “僕は”

* “進む前に空気を確かめるべきだ” => “進む前に空気を確かめるべきだ。” -> p010_dying_flame
* “炎が消える前に急いで進むべきだ” => “炎が消える前に急いで進むべきだ。” -> ending_airless_tomb
* “三つの円の印を信じるべきだ” => “三つの円の印を信じるべきだ。” -> ending_airless_tomb

@scene p010_dying_flame
system: ノックスはランタンを床近くまで下げる。
system: 炎はさらに弱くなる。
nox [thought]: 風で消されているんじゃない。
nox [thought]: 息ができずに消えかけているんだ。
system: 背後では、白い蛾が壁の細い亀裂の近くに集まっている。
-> p010_reply

@prompt p010_reply “蛾は”

* “新鮮な空気の近くにいるはずだ” => “蛾は新鮮な空気の近くにいるはずだ。” -> p008_moths_in_dark
* “宝を隠しているに違いない” => “蛾は宝を隠しているに違いない。” -> ending_airless_tomb
* “僕の役には立たない” => “蛾は僕の役には立たない。” -> ending_airless_tomb

@ending ending_airless_tomb “空気なき墓”
system: ノックスは静まり返った廊下を進み続ける。
system: 先に消えたのはランタンだった。
nox [thought]: リゾはこの道が安全だと言った。
system: 膝が石床にぶつかる。
system: 廊下はどこまでも静かなままだ。

@scene p008_moths_in_dark
system: 狭い階段は、濡れた石灰岩の壁に沿って下っていく。
system: 白い蛾がノックスの先をひらひらと飛ぶ。
system: 蛾は亀裂から冷気が入る場所に集まっている。
nox [thought]: 洞窟が呼吸できる場所を教えてくれている。
system: はるか下で、何か金属の音が一度だけ響く。
dungeon: チリン。
-> p008_reply

@prompt p008_reply “僕は”

* “蛾についていく” => “蛾についていく。” -> p012_chamber_of_bells
* “蛾から離れ、リゾの矢印に従う” => “蛾から離れ、リゾの矢印に従う。” -> p007_breathless_hall
* “空気の流れを地図に書き込む” => “空気の流れを地図に書き込む。” -> p009_broken_crescent

@scene p009_broken_crescent
system: ノックスは削り消された道と、地下牢の壁を見比べる。
system: 狭い通路の脇に、欠けた三日月が刻まれている。
system: リゾの新しいインクは、旅人をそこから遠ざけるように引かれている。
nox [thought]: 間違えたんじゃない。
nox [thought]: わざとこの道を隠したんだ。
-> p009_reply

@prompt p009_reply “リゾは”

* “僕をこの通路から遠ざけたかった” => “リゾは僕をこの通路から遠ざけたかった。” -> p012_chamber_of_bells
* “古い間違いを修正しただけに違いない” => “リゾは古い間違いを修正しただけに違いない。” -> p007_breathless_hall
* “すでに地下牢を探索している” => “リゾはすでに地下牢を探索している。” -> p009_evidence

@scene p009_evidence
system: 赤い隊商布の切れ端が、二つの石の間に挟まっている。
system: リゾの物資袋と同じ結び方がしてある。
nox [thought]: 隊商の誰かが、僕より前にここへ来たんだ。
nox [thought]: それなのにリゾは、前の斥候はいないと言った。
-> p009_evidence_reply

@prompt p009_evidence_reply “僕は”

* “リゾが嘘をついたことを覚えておくべきだ” => “リゾが嘘をついたことを覚えておくべきだ。” -> p012_chamber_of_bells
* “引き返して彼を問い詰めるべきだ” => “引き返して彼を問い詰めるべきだ。” -> p009_blocked_return
* “布は古いものだと考えるべきだ” => “布は古いものだと考えるべきだ。” -> p007_breathless_hall

@scene p009_blocked_return
system: ノックスは入口へ向かって登り戻る。
system: 上の階段は、今では一枚岩の石板に塞がれている。
nox: リゾ！
system: 外から返事はない。
nox [thought]: 僕が入ったあとで封じたんだ。
-> p012_chamber_of_bells

@scene p012_chamber_of_bells
system: 鐘の間
system: 天井から何十もの青銅の鐘が下がっている。
system: 淡色と暗色のタイルが床に道を作っている。
dungeon: チリン。
nox [thought]: 何にも触れていない。
system: 暗いタイルの真上で、二つ目の鐘が揺れる。
-> p012_reply

@prompt p012_reply “僕は”

* “淡いタイルの間を進む” => “淡いタイルの間を進む。” -> p013_white_veins
* “鐘の真下をまっすぐ歩く” => “鐘の真下をまっすぐ歩く。” -> ending_falling_bell
* “床へ石を投げる” => “床へ石を投げる。” -> p012_test

@scene p012_test
system: ノックスは暗いタイルへ落ちていた石を投げる。
dungeon: チリン！
system: 刃がその上の空間を薙ぎ払う。
nox [thought]: 鐘は罠が動いたことを知らせるんだ。
system: 淡いタイルの上の埃は乱れていない。
-> p012_test_reply

@prompt p012_test_reply “この”

* “淡いタイルなら起動装置を避けられる” => “この淡いタイルなら起動装置を避けられる。” -> p013_white_veins
* “暗いタイルが鐘を作動させる” => “この暗いタイルが鐘を作動させる。” -> p013_white_veins
* “最短の道を進むのがやはり一番だ” => “最短の道を進むのがやはり一番だ。” -> ending_falling_bell

@ending ending_falling_bell “鐘の下”
system: ノックスは一番大きな鐘の下へ踏み出す。
dungeon: チリン！
system: 頭上で何かが外れる。
system: 鐘は石を砕くほどの勢いで床へ落ちる。

@scene p013_white_veins
system: ノックスは鐘の間の向こう側へたどり着く。
system: 白い鉱脈が、石灰岩の床と壁を走っている。
system: 靴の下で石が小さくひび割れる。
cave: ピキッ。
nox [thought]: 白い部分は、灰色の石より脆い。
-> p013_reply

@prompt p013_reply “僕は”

* “石を叩かずに渡るべきだ” => “石を叩かずに渡るべきだ。” -> p015_rain_mural
* “脆い床をわざと壊すべきだ” => “脆い床をわざと壊すべきだ。” -> p016_lower_passage
* “ハンマーで壁を確かめるべきだ” => “ハンマーで壁を確かめるべきだ。” -> p013_collapse

@scene p013_collapse
system: ノックスは白い鉱脈の走る壁を軽く叩く。
cave: ピキッ。
system: 一枚の石板が落ち、彼と鐘の間を隔てる。
nox [thought]: たった一度不用意に叩くだけで、通路全体が崩れかねない。
-> p013_collapse_reply

@prompt p013_collapse_reply “僕は”

* “慎重に前へ進む” => “慎重に前へ進む。” -> p015_rain_mural
* “もう一度床を叩く” => “もう一度床を叩く。” -> p016_lower_passage
* “塞がれた道を開け直そうとする” => “塞がれた道を開け直そうとする。” -> ending_buried_scout

@ending ending_buried_scout “埋もれた斥候”
system: ノックスはひび割れた壁を叩く。
cave: バキッ！
system: 白い鉱脈の走る石灰岩が、彼の周囲で崩れ落ちる。
system: リゾの地図は瓦礫の下に残される。

@scene p016_lower_passage
system: ノックスは床に走る細い白い鉱脈を叩く。
system: 石が割れ、その下に狭い縦穴が現れる。
system: 暗闇から冷気が上ってくる。
system: 地下牢の下のどこかを、水が流れている。
nox [thought]: 地下水路だ。
-> p016_reply

@prompt p016_reply “僕は”

* “地下の水をたどる” => “地下の水をたどる。” -> p017_girl_beneath_moon
* “上の廊下へ戻る” => “上の廊下へ戻る。” -> p015_rain_mural
* “縦穴で宝を探す” => “縦穴で宝を探す。” -> p018_empty_casket

@scene p015_rain_mural
system: 次の部屋の壁一面に、色あせた壁画が描かれている。
system: フェリディアンの祭司たちが三日月の下に立っている。
system: その間には、若い黒猫の少女がひざまずいている。
system: 乾いた畑へ、空から青い線が降り注いでいる。
nox [thought]: 雨を願う祈りだ。
system: 少女は宝石を持っていない。
-> p015_reply

@prompt p015_reply “壁画に描かれているのは”

* “月の下で捧げられる少女だ” => “壁画に描かれているのは、月の下で捧げられる少女だ。” -> p017_girl_beneath_moon
* “隠された宝を差し出す祭司たちだ” => “壁画に描かれているのは、隠された宝を差し出す祭司たちだ。” -> p018_empty_casket
* “三日月の翡翠の場所だ” => “壁画に描かれているのは、三日月の翡翠の場所だ。” -> p018_empty_casket

@scene p017_girl_beneath_moon
inscription: 月が爪となるとき――
inscription: ――三日月の翡翠を捧げよ。
system: 最後の言葉は、描かれた少女のすぐ脇に記されている。
nox [thought]: 翡翠というのは、石のことではないのかもしれない。
nox [thought]: それとも、少女が見えないところに持っているのだろうか。
-> p017_reply

@prompt p017_reply “三日月の翡翠は”

* “少女自身なのかもしれない” => “三日月の翡翠は、少女自身なのかもしれない。” -> p019_human_altar
* “壁画の裏に隠されているに違いない” => “三日月の翡翠は、壁画の裏に隠されているに違いない。” -> p018_empty_casket
* “おそらく儀式用の装身具だ” => “三日月の翡翠は、おそらく儀式用の装身具だ。” -> p018_empty_casket

@scene p018_empty_casket
system: 壁画の下に石の小箱が置かれている。
system: ノックスは慎重にそれを開ける。
system: 中に宝石はない。
system: あるのは銀の留め具と、数本の黒い毛だけだ。
nox [thought]: 衣服に使われたものだ。
nox [thought]: 儀式用の衣装に。
-> p018_reply

@prompt p018_reply “僕は”

* “留め具を調べる” => “留め具を調べる。” -> p018_clasp
* “銀を持っていく” => “銀を持っていく。” -> p020_treasure_pedestal
* “小箱には触れずにおく” => “小箱には触れずにおく。” -> p019_human_altar

@scene p018_clasp
system: 留め具は三日月の形をしている。
system: 内側には黒い毛が張り付いている。
nox [thought]: 誰かの首につけられていたんだ。
nox [thought]: 宝石を留めるためのものではない。
-> p019_human_altar

@scene p019_human_altar
system: 壁画の部屋の先に、低い祭壇がある。
system: 宝石を載せるには長すぎる。
system: 両側から革の拘束具が垂れている。
system: 中央から細い溝が伸びている。
nox [thought]: この祭壇は、人を載せるために作られた。
system: 次の戸口の向こうで、柔らかな鐘の音が鳴る。
-> p019_reply

@prompt p019_reply “僕は”

* “静かに近づくべきだ” => “静かに近づくべきだ。” -> p021_black_cat_girl
* “宝に向かって呼びかけるべきだ” => “宝に向かって呼びかけるべきだ。” -> p022_lunas_claws
* “すぐに引き返すべきだ” => “すぐに引き返すべきだ。” -> p020_treasure_pedestal

@scene p020_treasure_pedestal
system: ノックスは円形の部屋へ入る。
system: 天井の開口部の下に、空の台座が立っている。
system: 三日月の光がその表面に落ちている。
nox [thought]: 空だ。
nox [thought]: 誰かが先に宝へたどり着いたんだ。
system: 黒い尻尾が柱の陰へ消える。
-> p020_reply

@prompt p020_reply “僕は”

* “柱の陰を探す” => “柱の陰を探す。” -> p021_black_cat_girl
* “三日月の封印に触れる” => “三日月の封印に触れる。” -> p023_collapse_trigger
* “盗人に出てくるよう要求する” => “盗人に出てくるよう要求する。” -> p022_lunas_claws

@scene p021_black_cat_girl
system: ノックスは柱の向こうへ回り込む。
system: 黒いフェリディアンの少女が床に座っている。
system: 首元には壊れた儀式用の留め具が掛かっている。
system: 黄色い目が、じっと彼を見つめている。
luna: 遅かったわね。
nox [thought]: フェリディアン。
nox [thought]: 猫だ。
luna: リゾに送られてきたの？
-> p021_reply

@prompt p021_reply “僕は”

* “三日月の翡翠を探しに来た” => “三日月の翡翠を探しに来た。” -> p021_jade_reply
* “リゾにここへ送られた” => “リゾにここへ送られた。” -> p024_broken_entrance
* “リゾという名前の者は知らない” => “リゾという名前の者は知らない。” -> p022_lunas_claws

@scene p021_jade_reply
system: ルナの表情が変わる。
luna: 三日月の翡翠。
luna: あいつは、そう言ったの？
nox: どこにあるか知っているんだね。
luna: あなたが思っているより近くにあるわ。
system: 頭上のどこかで石が軋む。
-> p024_broken_entrance

@scene p022_lunas_claws
luna: 宝泥棒が命令しないで。
system: ルナが立ち上がる。
system: かすかな金属音とともに爪が伸びる。
nox [thought]: リゾの名前を知っている。
nox [thought]: 僕たちを待っていたんだ。
-> p022_reply

@prompt p022_reply “僕は”

* “リゾの地図を落とす” => “リゾの地図を落とす。” -> p022_map
* “戸口へ走る” => “戸口へ走る。” -> p025_chase_begins
* “ナイフで彼女を脅す” => “ナイフで彼女を脅す。” -> p022_threat

@scene p022_map
system: リゾの地図が二人の間に落ちる。
system: ルナは新しい黒い矢印を見下ろす。
luna: あいつ、道を変えたのね。
nox: この地図を見たことがあるの？
luna: これに従った者がどうなるかは見たことがある。
system: 天井が震える。
-> p024_broken_entrance

@scene p022_threat
nox: 近づくな。
luna: 私の縄張りに入ってきて、
luna: 私たちの祭壇を漁って、
luna: 今度は私にナイフを向けるの？
system: 深い亀裂が部屋を走る。
-> p025_chase_begins

@scene p023_collapse_trigger
system: ノックスは三日月の封印を押す。
system: 台座の下で隠された機構が動く。
dungeon: チリン！
system: 天井の開口部が閉じ始める。
luna: 手を離して。
-> p023_reply

@prompt p023_reply “僕は”

* “封印から手を離す” => “封印から手を離す。” -> p024_broken_entrance
* “無理やり開ける” => “無理やり開ける。” -> ending_crushed_pedestal
* “何を操作するものかルナに尋ねる” => “何を操作するものかルナに尋ねる。” -> p023_question

@scene p023_question
nox: 何を動かすものなんだ？
luna: 入口。
luna: そして今、それが崩れている。
system: 上層の地下牢を轟音が走る。
-> p024_broken_entrance

@ending ending_crushed_pedestal “空の台座”
system: ノックスは封印を力任せに押し下げる。
system: 機構が固定される。
system: 石の天井が台座を囲むように閉じていく。
luna: 離して！
system: 部屋は静まり返る。

@scene p024_broken_entrance
system: 地下牢が揺れる。
system: 天井から埃が降り注ぐ。
system: 上のどこかで入口が崩れる。
nox: リゾ！
system: 石の向こうから返事はない。
luna: あいつはあなたを迎えに来ない。
nox: そんなこと、君には分からない。
luna: あいつが何をさせるためにあなたを送ったのか、私は正確に知っている。
system: 二つ目の亀裂が部屋の床を割る。
luna: 動いて。
-> p024_reply

@prompt p024_reply “僕は”

* “ルナの警告に従う” => “ルナの警告に従う。” -> p024_floor_breaks
* “彼女から逃げる” => “彼女から逃げる。” -> p025_chase_begins
* “ここに残って別の出口を探す” => “ここに残って別の出口を探す。” -> p024_floor_breaks

@scene p024_floor_breaks
system: ひび割れた床が崩れ落ちる。
system: ノックスは傾斜した石灰岩の通路へ落ちる。
system: ルナも彼の後ろへ着地する。
luna: 逃げるのをやめて。
nox: 落ちてるんだ！
system: 通路は二人をまとめて暗闇へ放り出す。
-> p025_chase_begins

@scene p025_chase_begins
system: 第二部
system: ルナからの脱出
system: 石灰岩洞窟 — 深度不明
system: ノックスは浅い地下水流へ落ちる。
system: 背後では、ルナが音もなく水の中から立ち上がる。
luna: 子ネズミ。
luna: まだ終わっていないわ。
nox [thought]: 入口はなくなった。
nox [thought]: 猫はまだここにいる。
system: 前方のどこかで、白い蛾が空気の流れるほうへ飛んでいく。
-> p025_reply

@prompt p025_reply “僕は”

* “蛾を追うべきだ” => “蛾を追うべきだ。” -> p028_moth_passage
* “最も大きな反響のするほうへ走るべきだ” => “最も大きな反響のするほうへ走るべきだ。” -> p027_echoing_tunnel
* “ルナが何を望んでいるのか尋ねるべきだ” => “ルナが何を望んでいるのか尋ねるべきだ。” -> p026_stop_running

@scene p026_stop_running
system: ノックスは距離を詰めずに振り返る。
nox: 何が望みなんだ？
luna: あなたが逃げるのをやめること。
nox: それは答えになっていない。
luna: まず必要な答えよ。
system: ルナの視線が、ノックスの頭上の天井へ動く。
luna: 後ろへ下がらないで。
-> p026_reply

@prompt p026_reply “僕は”

* “その警告を信じる” => “その警告を信じる。” -> p029_warning_returned
* “君は僕を捕まえようとしていると思う” => “君は僕を捕まえようとしていると思う。” -> p027_echoing_tunnel
* “証明してほしい” => “証明してほしい。” -> p026_proof

@scene p026_proof
luna: 上を見て。
system: 白い鉱脈が石灰岩の天井を横切っている。
nox [thought]: 地下牢にあったのと同じ脆い石だ。
luna: あと一歩で落ちる。
nox: 落ちるままにしておくこともできたはずだ。
luna: まだあなたに聞きたいことがある。
-> p029_warning_returned

@scene p027_echoing_tunnel
system: ノックスは広いトンネルへ駆け込む。
system: 足音がいくつもの方向から返ってくる。
cave: コツ。
cave: コツ。
cave: コツ。
nox [thought]: 反響のせいで、ルナの音が聞き分けられない。
system: 黒い影が石筍の間を動く。
-> p027_reply

@prompt p027_reply “僕は”

* “隠れて完全にじっとしている” => “隠れて完全にじっとしている。” -> p030_stillness
* “反響の中を走り続ける” => “反響の中を走り続ける。” -> p031_hunters_leap
* “石を投げてルナを惑わせる” => “石を投げてルナを惑わせる。” -> p027_stones

@scene p027_stones
system: ノックスは三つの脇道へ石を投げる。
cave: カツン。
cave: カツン。
cave: カツン。
system: ルナが立ち止まる。
luna: 賢いわね。
system: 声はノックスのすぐ背後から聞こえる。
luna: でも、自分の息遣いを忘れている。
-> p031_hunters_leap

@scene p028_moth_passage
system: ノックスは白い蛾を追って狭い通路へ入る。
system: 冷たい空気がひげを撫でる。
system: 通路は、白い鉱脈の走る石灰岩の壁を回り込むように鋭く曲がっている。
system: ルナの足音が近づく。
-> p028_reply

@prompt p028_reply “僕には”

* “空気の流れをたどって奥へ進める” => “空気の流れをたどって奥へ進める。” -> p029_warning_returned
* “より広い脇道へ進める” => “より広い脇道へ進める。” -> p031_hunters_leap
* “背後の通路を崩せる” => “背後の通路を崩せる。” -> p033_buried_together

@scene p029_warning_returned
system: ノックスは脆い石灰岩を回り込む。
system: ルナも狭い通路をついてくる。
system: 次の一歩を置こうとする場所の下で、亀裂が広がる。
nox [thought]: 彼女は床ではなく、僕を見ている。
-> p029_reply

@prompt p029_reply “僕は”

* “亀裂についてルナに警告するべきだ” => “亀裂についてルナに警告するべきだ。” -> p032_falling_limestone
* “何も言わず、彼女を落とすべきだ” => “何も言わず、彼女を落とすべきだ。” -> p038_lone_mouse_route
* “脆い石を使って彼女を閉じ込めるべきだ” => “脆い石を使って彼女を閉じ込めるべきだ。” -> p033_buried_together

@scene p030_stillness
system: ノックスは二本の石筍の間に体を押し込む。
system: 動きを止める。
system: 息も止める。
system: ルナがゆっくりと姿を現す。
luna: 心臓の音が聞こえる。
nox [thought]: 手が届くほど近い。
system: ルナはノックスの向こうにある暗い穴へ目を向ける。
luna: 何か別のものが、私たちを追っている。
-> p030_reply

@prompt p030_reply “僕は”

* “じっとしたまま耳を澄ます” => “じっとしたまま耳を澄ます。” -> p034_close_enough
* “彼女が気を取られている間に走る” => “彼女が気を取られている間に走る。” -> p031_hunters_leap
* “何が追っているのか尋ねる” => “何が追っているのか尋ねる。” -> p034_close_enough

@scene p031_hunters_leap
system: ノックスは地下水流へ向かって走る。
system: ルナが頭上の岩棚から跳びかかる。
luna: 止まって！
system: 彼女の影が水面を覆う。
-> p031_reply

@prompt p031_reply “僕は”

* “石灰岩の棚の下へ身を伏せる” => “石灰岩の棚の下へ身を伏せる。” -> p035_narrow_ledge
* “流れを飛び越える” => “流れを飛び越える。” -> p036_underground_stream
* “振り返って彼女と向き合う” => “振り返って彼女と向き合う。” -> p034_close_enough

@scene p032_falling_limestone
nox: ルナ！　足元！
system: ルナは身をひねって避ける。
system: 彼女の下の石が崩れる。
system: 片脚が二枚の岩板の間に挟まる。
luna: 近づかないで。
nox: 挟まっているじゃないか。
luna: 気づいているわ。
system: 彼女の周囲では亀裂が広がり続けている。
-> p032_reply

@prompt p032_reply “僕は”

* “彼女の脚を外すのを手伝う” => “彼女の脚を外すのを手伝う。” -> p037_debt_between_enemies
* “天井が落ちる前に立ち去る” => “天井が落ちる前に立ち去る。” -> p038_lone_mouse_route
* “もう追わないと約束させる” => “もう追わないと約束させる。” -> p032_bargain

@scene p032_bargain
nox: もう僕を追わないと約束して。
luna: 先に助けて。
nox: それでは取引にならない。
luna: この取引はそういうものよ。
system: もう一つの石がルナのそばへ落ちる。
-> p032_bargain_reply

@prompt p032_bargain_reply “僕は”

* “約束がなくても助ける” => “約束がなくても助ける。” -> p037_debt_between_enemies
* “先に約束が必要だ” => “先に約束が必要だ。” -> p038_lone_mouse_route
* “君をここに置いていく” => “君をここに置いていく。” -> p038_lone_mouse_route

@scene p033_buried_together
system: ノックスは白い鉱脈の走る壁を叩く。
cave: バキッ！
system: 通路が崩れ、ノックスとルナの間を塞ぐ。
system: 二つ目の亀裂がノックスの足元に開く。
system: 二人とも同じ下層の部屋へ落ちる。
luna: 私を生き埋めにしようとしたわね。
nox: 失敗した。
luna: それも気づいている。
system: 岩板がルナの尻尾を瓦礫の下に押さえつける。
-> p033_reply

@prompt p033_reply “僕は”

* “彼女を掘り出す” => “彼女を掘り出す。” -> p037_debt_between_enemies
* “彼女が動けないうちに逃げる” => “彼女が動けないうちに逃げる。” -> p038_lone_mouse_route
* “彼女の三日月の留め具を奪う” => “彼女の三日月の留め具を奪う。” -> p040_no_trust

@scene p034_close_enough
system: ノックスとルナは、狭い流れを挟んで向き合う。
system: どちらも動かない。
luna: さあ、答えて。
luna: なぜリゾはあなたを送ったの？
-> p034_reply

@prompt p034_reply “あいつは僕を”

* “三日月の翡翠を探すために送った” => “あいつは僕を、三日月の翡翠を探すために送った。” -> p039_honest_thief
* “道が安全か確かめるために送った” => “あいつは僕を、道が安全か確かめるために送った。” -> p039_honest_thief
* “地下牢から誰かを救うために送った” => “あいつは僕を、地下牢から誰かを救うために送った。” -> p040_no_trust

@scene p035_narrow_ledge
system: ノックスは低い石灰岩の棚の下へ体を滑り込ませる。
system: ルナは這わなければ通れない。
system: 前方の深い亀裂には、登攀用のロープが渡されている。
nox [thought]: 切れば、彼女は渡れない。
system: ルナ側の亀裂の縁が崩れ始める。
-> p035_reply

@prompt p035_reply “僕は”

* “ルナのためにロープを残す” => “ルナのためにロープを残す。” -> p037_debt_between_enemies
* “渡ったあとでロープを切る” => “渡ったあとでロープを切る。” -> p038_lone_mouse_route
* “待って、追うのをやめるよう頼む” => “待って、追うのをやめるよう頼む。” -> p034_close_enough

@scene p036_underground_stream
system: ノックスは冷たく流れの速い水へ着地する。
system: 流れが彼をルナから引き離していく。
system: 前方に二つの道が現れる。
system: 水没した穴のそばから、新鮮な空気の泡が上がっている。
system: 岩の斜面の上では、かすかな橙色の光が揺れている。
nox [thought]: 下には空気。
nox [thought]: 上には松明の光。
-> p036_reply

@prompt p036_reply “僕は”

* “新鮮な空気の泡を追う” => “新鮮な空気の泡を追う。” -> p041_water_beneath_stone
* “松明の光を追う” => “松明の光を追う。” -> p042_bandit_camp
* “最も強い流れを追う” => “最も強い流れを追う。” -> p036_waterfall

@scene p036_waterfall
system: 流れが加速する。
nox: 間違えた。
system: ノックスは短い地下滝から落ちる。
system: 上へ続く狭い通路のそばに着地する。
system: その先から声が響く。
-> p042_bandit_camp

@scene p037_debt_between_enemies
system: ノックスは最後の石を取り除く。
system: ルナは自由になると、一歩下がる。
luna: 逃げる時間はあったはずよ。
nox: 君が先に警告してくれた。
luna: それで貸し借りがなくなるわけではない。
nox: 差が少し縮まっただけだ。
system: ルナは首元の壊れた留め具に触れる。
-> p037_reply

@prompt p037_reply “その三日月は”

* “神殿のものだ” => “その三日月は神殿のものだ。” -> p043_rain_seal
* “三日月の翡翠だ” => “その三日月は三日月の翡翠だ。” -> p037_jade
* “価値があるに違いない” => “その三日月は価値があるに違いない。” -> p040_no_trust

@scene p037_jade
luna: 違う。
luna: これは儀式の対象として私を示す印にすぎない。
nox: 君を示す印？
luna: あなた、本当にリゾが何を探しているのか知らないのね。
system: ルナは上層の通路へ目を向ける。
luna: でも、あいつはあなたの地図より厄介なものを持っている。
-> p043_rain_seal

@scene p038_lone_mouse_route
system: ノックスはルナを残して立ち去る。
system: 彼女の声は、流れる水音の下へ消えていく。
luna: なら、逃げなさい。
luna: 外で誰が待っているか見ればいい。
system: 前方では、松明の光が洞窟の壁を照らしている。
-> p038_reply

@prompt p038_reply “僕は”

* “松明の光を追う” => “松明の光を追う。” -> p042_bandit_camp
* “別の出口を探す” => “別の出口を探す。” -> p044_false_exit
* “ルナのところへ戻る” => “ルナのところへ戻る。” -> p047_last_test

@scene p039_honest_thief
nox: 三日月の翡翠を盗みに来た。
nox: 宝石だと思っていた。
luna: だからといって、あなたが無実になるわけではない。
nox: 分かっている。
system: ルナは彼を慎重に見つめる。
luna: 地図を見せて。
-> p039_reply

@prompt p039_reply “僕は”

* “リゾの地図を彼女に渡す” => “リゾの地図を彼女に渡す。” -> p043_rain_seal
* “手を離さずに見せる” => “手を離さずに見せる。” -> p039_half_trust
* “なくしたと言う” => “なくしたと言う。” -> p040_no_trust

@scene p039_half_trust
system: ノックスは片手で持ったまま地図を差し出す。
system: ルナは新しく描かれた矢印を読む。
luna: あいつ、道を変えたのね。
nox: この印を見たことがあるの？
luna: あいつの仕業は見たことがある。
luna: 渡して。
-> p039_half_reply

@prompt p039_half_reply “僕は”

* “手を離す” => “手を離す。” -> p043_rain_seal
* “脱出するために必要だ” => “脱出するために必要だ。” -> p040_no_trust
* “先に答えが欲しい” => “先に答えが欲しい。” -> p043_rain_seal

@scene p040_no_trust
system: ルナの表情から動きが消える。
luna: 嘘が下手ね。
nox: 生き延びようとしているんだ。
luna: 誰だってそうよ。
luna: だからといって、すべての選択が同じになるわけではない。
system: ルナは新鮮な空気の流れる通路から身を退ける。
luna: 行きなさい。
nox: 逃がしてくれるの？
luna: あなたの地図がどこへ導くのか、自分で知ればいい。
-> p040_reply

@prompt p040_reply “僕は”

* “見えている出口へ進む” => “見えている出口へ進む。” -> p042_bandit_camp
* “もう一度だけ機会を求める” => “もう一度だけ機会を求める。” -> p047_last_test
* “気が変わる前に走る” => “気が変わる前に走る。” -> p044_false_exit

@scene p041_water_beneath_stone
system: ノックスは石灰岩の棚の下へ潜る。
system: 通路は隠れた空気だまりへ上っている。
system: 白い蛾が、上へ続く亀裂の近くに集まっている。
system: 石越しに、ムリドたちの声が聞こえる。
bandit [distant]: リゾは、もう斥候が開けているはずだと言っていたぞ。
bandit [distant]: 生きていればな。
nox [thought]: ここにいる。
nox [thought]: 最初から僕を助けるつもりなどなかったんだ。
-> p041_reply

@prompt p041_reply “僕は”

* “戻ってルナに警告するべきだ” => “戻ってルナに警告するべきだ。” -> p045_hidden_vent
* “盗賊たちのところへ登るべきだ” => “盗賊たちのところへ登るべきだ。” -> p042_bandit_camp
* “リゾの計画を聞くべきだ” => “リゾの計画を聞くべきだ。” -> p041_overheard

@scene p041_overheard
rizo [distant]: あの小さな馬鹿が道を開いたら、娘を捕らえる。
bandit [distant]: 翡翠は？
rizo [distant]: 娘がそこまで案内する。
bandit [distant]: 雨の印章はどうする？
rizo [distant]: 声を落とせ。
nox [thought]: 雨の印章。
nox [thought]: ルナに知らせないと。
-> p045_hidden_vent

@scene p042_bandit_camp
system: ノックスは狭い穴を登り抜ける。
system: 石灰岩の尾根の向こうに日光が差している。
system: リゾとムリドの盗賊たちが、二つ目の入口のそばで待っている。
system: 武器、ロープ、檻が野営地の周囲に並べられている。
rizo: ノックス。
rizo: 生きていたか。
system: リゾは、最初からすべて計画どおりだったかのように笑う。
-> p042_reply

@prompt p042_reply “僕は”

* “道を見つけた” => “道を見つけた。” -> part3_rizo_welcome
* “あなたが嘘をついたと知っている” => “あなたが嘘をついたと知っている。” -> part3_rizo_confrontation
* “話す前に様子を見る必要がある” => “話す前に様子を見る必要がある。” -> part3_camp_from_above

@scene p043_rain_seal
luna: リゾはフェリディアンの輸送隊から儀式用の印章を盗んだ。
luna: 黒い石。銀の縁。中央を三日月が貫いている。
nox: あいつの腰に下がっているのを見た。
system: ルナの爪が伸びる。
luna: 雨の印章は、豊穣の神殿を開く。
nox: その中に三日月の翡翠があるの？
luna: まだ宝の話だと思っているのね。
-> p043_reply

@prompt p043_reply “僕は君を手伝って”

* “雨の印章を取り戻す” => “僕は君を手伝って、雨の印章を取り戻す。” -> p046_temporary_truce
* “三日月の翡翠を見つける” => “僕は君を手伝って、三日月の翡翠を見つける。” -> p040_no_trust
* “報酬を約束してくれるなら動く” => “報酬を約束してくれるなら、僕は君を手伝う。” -> p040_no_trust

@scene p044_false_exit
system: ノックスは日光へ向かって上る通路を進む。
system: 湿った地面は新しい靴跡で覆われている。
system: 最後の登りにはロープが固定されている。
nox [thought]: 誰かが最近、この出口を用意したんだ。
system: 上からムリドたちの声が聞こえる。
-> p044_reply

@prompt p044_reply “僕は”

* “盗賊の野営地へ登るべきだ” => “盗賊の野営地へ登るべきだ。” -> p042_bandit_camp
* “ルナのところへ戻るべきだ” => “ルナのところへ戻るべきだ。” -> p047_last_test
* “隠れて先に観察するべきだ” => “隠れて先に観察するべきだ。” -> part3_camp_from_above

@scene p045_hidden_vent
system: ノックスは水没した通路を通って戻る。
system: ルナは流れのそばで待っている。
luna: 出口を見つけたのね。
nox: リゾを見つけた。
luna: 同じことではないわ。
nox: あいつは檻を持っている。
nox: それに、雨の印章も。
system: ルナは完全に動きを止める。
-> p045_reply

@prompt p045_reply “僕が戻ったのは”

* “君が知る必要があったからだ” => “僕が戻ったのは、君が知る必要があったからだ。” -> p046_temporary_truce
* “一人ではあいつと戦えないからだ” => “僕が戻ったのは、一人ではあいつと戦えないからだ。” -> p046_temporary_truce
* “報酬の取り分が欲しいからだ” => “僕が戻ったのは、報酬の取り分が欲しいからだ。” -> p040_no_trust

@scene p046_temporary_truce
luna: リゾのところまで案内して。
nox: そうしたら貸し借りなし？
luna: いいえ。
nox: そのあと、どうなる？
luna: 雨の印章を取り戻したあとで、あなたを泥棒、囚人、それとももう少し厄介でない何かとして扱うか決める。
nox: あまり安心できないな。
luna: リゾよりは正直よ。
-> p046_reply

@prompt p046_reply “僕たちは”

* “一緒に進むべきだ” => “僕たちは一緒に進むべきだ。” -> p048_within_reach
* “距離を保つべきだ” => “僕たちは距離を保つべきだ。” -> p047_last_test
* “君を前に歩かせるべきだ” => “僕たちは君を前に歩かせるべきだ。” -> p047_last_test

@scene p047_last_test
system: ルナは地上へ戻る狭い道を塞ぐ。
luna: ナイフを置いて。
nox: 君にはまだ爪がある。
luna: これは置けない。
nox: 都合がいいね。
luna: 決めて。
-> p047_reply

@prompt p047_reply “僕は”

* “ナイフを置く” => “ナイフを置く。” -> p048_within_reach
* “降伏するふりをする” => “降伏するふりをする。” -> p049_broken_truce
* “ナイフは持ったまま刃を下げる” => “ナイフは持ったまま刃を下げる。” -> p047_compromise

@scene p047_compromise
system: ノックスはナイフを放さずに刃先を下げる。
system: ルナは彼の手を見つめる。
luna: 信頼ではない。
nox: まだね。
luna: 十分正直よ。
-> p048_within_reach

@scene p048_within_reach
system: ノックスは石灰岩の通路をルナと並んで歩く。
system: 彼女の爪は、いつでも届く距離にある。
system: 初めて、彼は逃げない。
luna: リゾはあなたを使い捨てにできると思ったから、最初に送り込んだ。
nox: 分かっている。
luna: それでも、あなたは私たちから盗むつもりだった。
nox: それも分かっている。
luna: よろしい。
nox: 何がいいんだ？
luna: 言い訳は、罪悪感より信用しにくいから。
system: 前方に松明の光が現れる。
-> p048_reply

@prompt p048_reply “リゾは”

* “止めなければならない” => “リゾは止めなければならない。” -> part3_enemy_of_enemy
* “僕たちが一緒にいるとは思わない” => “リゾは僕たちが一緒にいるとは思わない。” -> part3_enemy_of_enemy
* “まだ僕を許してくれるかもしれない” => “リゾはまだ僕を許してくれるかもしれない。” -> p048_doubt

@scene p048_doubt
luna: あなたを許す？
luna: あいつは、封じられる地下牢へあなたを送り込んだのよ。
nox: 隊商は僕の家だった。
luna: 扉を見たことがなければ、檻でも家のように感じられる。
system: 最後の亀裂越しに、リゾの野営地が見える。
-> p048_doubt_reply

@prompt p048_doubt_reply “僕は”

* “君と一緒にあいつと向き合う” => “君と一緒にあいつと向き合う。” -> part3_enemy_of_enemy
* “一人であいつと話す必要がある” => “一人であいつと話す必要がある。” -> part3_rizo_confrontation
* “まず野営地を観察したい” => “まず野営地を観察したい。” -> part3_camp_from_above

@scene p049_broken_truce
system: ノックスはナイフを下げる。
system: そして突然、ルナの手首へ飛びかかる。
system: 刃が半分も動かないうちに、ルナは彼の腕をつかむ。
luna: やっぱりね。
nox: 離せ。
luna: 先に私に信じさせたかったのでしょう。
system: 彼女の手に力がこもる。
-> p049_reply

@prompt p049_reply “僕は”

* “怖かった” => “怖かった。” -> ending_hunter_catches_mouse
* “まだ君を助けられる” => “まだ君を助けられる。” -> ending_hunter_catches_mouse
* “猫なんて絶対に信じない” => “猫なんて絶対に信じない。” -> ending_hunter_catches_mouse

@ending ending_hunter_catches_mouse “狩人はネズミを捕らえる”
luna: 恐怖は獲物を生かす。
luna: 裏切りは追跡を短くするだけ。
system: ノックスのナイフが流れへ落ちる。
system: 今度こそ、ルナは彼を逃がさない。

@scene part3_enemy_of_enemy
system: 第三部
system: リゾ
system: 石灰岩の尾根 — 盗賊の野営地
system: ノックスはルナを隠し入口へ案内する。
nox: リゾには少なくとも八人の盗賊がいる。
luna: 九人。
nox: どうして分かるの？
luna: 怖くないふりをしている一人の音が聞こえるから。
system: ルナはノックスを見る。
luna: 戦いが始まったら、私の後ろにいて。
nox: 案内しているのは僕だと思ったけど。
luna: ここまでは案内した。
luna: また餌として役立たないようにして。
-> p052_enemy_of_enemy

@scene part3_rizo_welcome
system: 第三部
system: リゾ
system: 石灰岩の尾根 — 盗賊の野営地
-> p050_rizo_welcome

@scene part3_rizo_confrontation
system: 第三部
system: リゾ
system: 石灰岩の尾根 — 盗賊の野営地
nox: 地図を変えたね。
rizo: それでも、お前はここにいる。
nox: 僕が入ったあと、入口を封じた。
rizo: 危険がお前を追って外へ出ないようにしただけだ。
system: 盗賊たちがノックスを囲み始める。
-> p054_one_mouse_against_rizo

@scene part3_camp_from_above
system: 第三部
system: リゾ
system: 石灰岩の尾根 — 盗賊の野営地上方
system: ノックスは野営地を見下ろす岩場に隠れる。
system: リゾが鉄の檻のそばで、武装した二人の盗賊と話している。
rizo: 娘が現れたら、生け捕りにしろ。
bandit: ノックスは？
rizo: 生きていたとしても、もう役目は果たした。
-> p051_camp_from_above

@scene p050_rizo_welcome
rizo: おかえり、ノックス。
rizo: 見つけたものをすべて話せ。
system: リゾの背後で、黒と銀の三日月が腰帯から下がっている。
nox [thought]: 雨の印章だ。
system: 二人の盗賊がノックスの背後の道を塞ぐ。
-> p050_reply

@prompt p050_reply “僕は”

* “神殿への道を見つけた” => “神殿への道を見つけた。” -> p053_back_among_bandits
* “フェリディアンの少女を見つけた” => “フェリディアンの少女を見つけた。” -> p050_luna_question
* “あなたが僕を死なせるために送ったと知っている” => “あなたが僕を死なせるために送ったと知っている。” -> p054_one_mouse_against_rizo

@scene p050_luna_question
system: リゾの手が雨の印章へ動く。
rizo: 黒猫の娘か？
nox: 知っているの？
rizo: どれほどの値がつくかは知っている。
nox [thought]: 彼女が誰か、ではない。
nox [thought]: いくらになるか、だ。
-> p050_luna_reply

@prompt p050_luna_reply “彼女は”

* “あなたの宝ではない” => “彼女はあなたの宝ではない。” -> p054_one_mouse_against_rizo
* “三日月の翡翠の場所を知っている” => “彼女は三日月の翡翠の場所を知っている。” -> p053_back_among_bandits
* “洞窟の奥へ逃げた” => “彼女は洞窟の奥へ逃げた。” -> p050_lie

@scene p050_lie
rizo: 奥へ？
system: リゾはノックスの顔を観察する。
rizo: なら、お前が俺たちを娘のところへ案内しろ。
nox: 道が分からない。
rizo: 出口まではたどり着いた。
rizo: 戻る道も見つけられる。
-> p053_back_among_bandits

@scene p051_camp_from_above
system: ノックスは石灰岩の尾根から様子をうかがう。
system: リゾは鉄の檻のそばに立っている。
system: 雨の印章が腰帯から下がっている。
rizo: 娘が現れたら、生け捕りにしろ。
bandit: ノックスは？
rizo: 生きていたとしても、もう役目は果たした。
system: 別の盗賊がノックスの地図の写しを広げる。
-> p051_reply

@prompt p051_reply “僕は”

* “聞き続けるべきだ” => “聞き続けるべきだ。” -> p055_price_of_girl
* “今すぐ雨の印章を盗むべきだ” => “今すぐ雨の印章を盗むべきだ。” -> p060_knife_behind_smile
* “見つかる前に立ち去るべきだ” => “見つかる前に立ち去るべきだ。” -> p056_escape_without_luna

@scene p052_enemy_of_enemy
system: ノックスは野営地の上にある狭い亀裂を通ってルナを案内する。
system: 下では九人のムリドの盗賊が待っている。
system: リゾは鉄の檻のそばに立っている。
system: 雨の印章が腰帯から下がっている。
luna: あそこ。
nox: 見える。
luna: 違う。
luna: あなたに見えているのは印章。
luna: 私には、あいつがそれを何に使うつもりかが見える。
-> p052_reply

@prompt p052_reply “僕たちは”

* “相手が動く前に攻撃するべきだ” => “相手が動く前に攻撃するべきだ。” -> p057_lunas_assault
* “まずリゾの話を聞くべきだ” => “まずリゾの話を聞くべきだ。” -> p055_price_of_girl
* “戦わずに印章を盗むべきだ” => “戦わずに印章を盗むべきだ。” -> p052_stealth

@scene p052_stealth
nox: 後ろからあいつの天幕へ行ける。
luna: 一人で？
nox: 僕なら通れるほど小さい。
luna: それはリゾの理屈と同じね。
nox: 今度は僕が選んだ。
system: ルナは長い間、彼を見つめる。
luna: なら、あいつが別のほうを見るようにしてあげる。
-> p060_knife_behind_smile

@scene p053_back_among_bandits
system: リゾはノックスの肩に腕を回す。
rizo: ほらな？
rizo: こいつは戻ってくると言っただろう。
system: 盗賊たちは誰もノックスと目を合わせない。
rizo: さあ、入口を見せろ。
nox [thought]: ロープを持ってきている。
nox [thought]: 武器も。
nox [thought]: それに檻も。
-> p053_reply

@prompt p053_reply “僕は”

* “聖なる門へ案内する” => “聖なる門へ案内する。” -> p058_open_sacred_gate
* “フェリディアンの衛兵のところへ案内する” => “フェリディアンの衛兵のところへ案内する。” -> p059_guard_line
* “行動できる時まで協力するふりをする” => “行動できる時まで協力するふりをする。” -> p060_knife_behind_smile

@scene p054_one_mouse_against_rizo
nox: 地図を変えた。
nox: 僕が入ったあと、入口を封じた。
rizo: それでもお前は戻った。
nox: 僕が死ぬと思っていた。
rizo: 役に立つことを期待していた。
system: 盗賊たちがノックスの周囲に輪を作る。
rizo: 生き延びたことを、重要であることと取り違えるな。
-> p054_reply

@prompt p054_reply “僕は”

* “ナイフを抜く” => “ナイフを抜く。” -> ending_one_mouse_caravan
* “降伏するふりをする” => “降伏するふりをする。” -> p060_knife_behind_smile
* “ルナを呼ぶ” => “ルナを呼ぶ。” -> p054_call_luna

@scene p054_call_luna
nox: ルナ！
system: 静寂だけが返事をする。
rizo: あのフェリディアンの娘か？
rizo: あいつから逃げてきたくせに、まだ助けてもらえると思っているのか？
system: リゾは刃を抜く。
-> ending_one_mouse_caravan

@ending ending_one_mouse_caravan “一匹のネズミ対隊商”
system: ノックスはナイフを構える。
system: リゾは先に動かない。
system: その必要がないからだ。
system: 八人の盗賊がノックスを囲む。
rizo: 勇気は役に立つ。
rizo: ただし、それを持つ余裕のある強者にとってだけだ。
system: ノックスは遅すぎる時になって、勇敢さと強さは同じではないと知る。

@scene p055_price_of_girl
system: リゾは鉄の檻のそばで話している。
rizo: 祭司たちは生贄を失った。
bandit: あの娘のことか？
rizo: 三日月の翡翠のことだ。
bandit: 宝石だと思っていた。
rizo: それを探して死んだ馬鹿どもも、みんなそう思っていた。
system: ルナの爪が石灰岩へ食い込む。
luna: あいつは知っている。
nox: 全部ではない。
rizo: 娘と雨の印章があれば、祭司どもは都市を買えるほど払うだろう。
-> p055_reply

@prompt p055_reply “僕は”

* “真実をルナに伝えに戻るべきだ” => “真実をルナに伝えに戻るべきだ。” -> p057_lunas_assault
* “リゾと取引するべきだ” => “リゾと取引するべきだ。” -> p061_rizos_bargain
* “神殿への道を明かすまで待つべきだ” => “神殿への道を明かすまで待つべきだ。” -> p055_route

@scene p055_route
rizo: 月の門は東の尾根の下にある。
rizo: 印章で開く。
bandit: 祭司たちが支払いを拒んだら？
rizo: 娘を別のところへ売る。
system: ルナの呼吸がさらに静かになる。
nox [thought]: 怒っているより悪い。
-> p057_lunas_assault

@scene p056_escape_without_luna
system: ノックスは野営地からそっと抜け出す。
system: 石灰岩の尾根の先に、開けた土地が広がっている。
system: ムリド領へ戻る道に見張りはいない。
nox [thought]: 立ち去れる。
nox [thought]: リゾはあの娘を手に入れる。
nox [thought]: 祭司たちは生贄を手に入れる。
nox [thought]: でも僕は生きられる。
-> p056_reply

@prompt p056_reply “僕は”

* “フェリディアン領を去る” => “フェリディアン領を去る。” -> ending_mouse_escaped_alone
* “雨の印章を取りに戻る” => “雨の印章を取りに戻る。” -> p060_knife_behind_smile
* “まずルナを探す” => “まずルナを探す。” -> p057_lunas_assault

@ending ending_mouse_escaped_alone “一匹で逃げたネズミ”
system: ノックスは、石灰岩の丘が背後に見えなくなるまで歩く。
system: 誰も追ってこない。
system: 彼を捕らえようとする爪もない。
system: 名前を呼ぶ盗賊もいない。
system: 数か月後、フェリディアンの祭司たちが儀式を終えたと聞く。
system: ルナがどうなったのか、彼は決して尋ねない。

@scene p057_lunas_assault
system: ルナが尾根から野営地の中央へ飛び降りる。
bandit: フェリディアンだ！
rizo: 生け捕りにしろ！
system: ルナは一番近いランタンの綱を切る。
system: 闇が野営地を覆う。
luna: ノックス。
luna: 今よ。
-> p057_reply

@prompt p057_reply “僕は”

* “盗賊たちの脱出用ロープを切る” => “盗賊たちの脱出用ロープを切る。” -> p062_bandits_in_darkness
* “リゾを直接追う” => “リゾを直接追う。” -> p063_moon_gate_opens
* “怯えた荷役動物を解き放つ” => “怯えた荷役動物を解き放つ。” -> p057_animals

@scene p057_animals
system: ノックスは隊商の動物たちをつないだ綱を切る。
system: 怯えた獣たちが野営地を走り回る。
system: 天幕が倒れる。
system: 物資が尾根を転がり落ちる。
bandit: 止めろ！
system: 盗賊の半分が戦いを放棄する。
luna: 効果的ね。
nox: 驚いたように聞こえる。
luna: あなたへの評価を修正しているところ。
-> p062_bandits_in_darkness

@scene p058_open_sacred_gate
system: ノックスは盗賊たちを尾根沿いに案内する。
system: 彫刻を施された二本のフェリディアンの柱の間に、石の門が立っている。
system: その前で三人の衛兵が待っている。
guard: 止まれ。
guard: 雨の印章を返せ。
rizo: ノックス。
rizo: お前がどれだけ役に立つか見せてやれ。
-> p058_reply

@prompt p058_reply “僕は”

* “フェリディアンの衛兵を攻撃する” => “フェリディアンの衛兵を攻撃する。” -> ending_price_of_rain
* “リゾに反旗を翻す” => “リゾに反旗を翻す。” -> p059_guard_line
* “ルナについて衛兵に警告する” => “ルナについて衛兵に警告する。” -> p059_guard_line

@scene p059_guard_line
nox: リゾが雨の印章を盗んだ。
nox: 三日月の翡翠を捕らえるつもりだ。
system: 衛兵たちは槍を構える。
guard: そして、お前はそいつと一緒に来た。
nox: そうだ。
guard: ならば投降しろ。
system: 背後からリゾの盗賊たちが迫る。
-> p059_reply

@prompt p059_reply “僕は”

* “投降してすべてを説明する” => “投降してすべてを説明する。” -> p064_prisoner_of_priests
* “リゾのところへ逃げ戻る” => “リゾのところへ逃げ戻る。” -> ending_price_of_rain
* “隙を作って逃げる” => “隙を作って逃げる。” -> p059_escape

@scene p059_escape
system: ノックスは尾根から石を蹴り落とす。
system: 衛兵と盗賊が物音のほうを向く。
system: ノックスは門の脇の壁の下へ滑り込む。
system: 狭い水道橋が暗闇へ続いている。
-> p075_forgotten_aqueduct

@scene p060_knife_behind_smile
system: ノックスはリゾのそばへ戻る。
rizo: 気が変わったか？
nox: 自分の立場が分かった。
rizo: よし。
system: リゾは地図のほうへ向き直る。
system: 雨の印章がノックスの手の届くところに下がっている。
-> p060_reply

@prompt p060_reply “僕は”

* “雨の印章を盗む” => “雨の印章を盗む。” -> p065_stolen_rain_seal
* “もっと安全な機会を待つ” => “もっと安全な機会を待つ。” -> p061_rizos_bargain
* “背後からリゾを攻撃する” => “背後からリゾを攻撃する。” -> p060_attack

@scene p060_attack
system: ノックスはナイフを抜く。
system: リゾは振り返りもせず、その手首をつかむ。
rizo: さっきよりいい。
rizo: 少なくとも今は、危険な存在になろうとしている。
system: リゾはノックスを地面へ投げ飛ばす。
-> ending_one_mouse_caravan

@scene p061_rizos_bargain
rizo: 怒っているな。
nox: 僕を死なせるために送った。
rizo: 価値ある者になるために送った。
rizo: そして今、お前には価値がある。
system: リゾはノックスの前に小さな硬貨袋を置く。
rizo: あの娘を祭司へ引き渡すのを手伝え。
rizo: 一人前の取り分をやる。
-> p061_reply

@prompt p061_reply “僕は”

* “自分の取り分を受け取る” => “自分の取り分を受け取る。” -> ending_price_of_rain
* “密かにルナを解放する” => “密かにルナを解放する。” -> p066_mouse_cuts_cage
* “祭司たちが何をするつもりか尋ねる” => “祭司たちが何をするつもりか尋ねる。” -> p061_ceremony

@scene p061_ceremony
rizo: 雨を祈るのさ。
nox: 少女を祭壇に縛りつけて？
rizo: 祭司というものは、単純なことを大げさな芝居にしたがる。
nox: 彼女は死ぬ。
rizo: 娘一人。
rizo: 谷一つ。
rizo: そして、俺たちの隊商を何年も食わせられるほどの金だ。
-> p061_final_reply

@prompt p061_final_reply “それは”

* “殺人だ” => “それは殺人だ。” -> p066_mouse_cuts_cage
* “妥当な代価だ” => “それは妥当な代価だ。” -> ending_price_of_rain
* “祭司たちの問題だ” => “それは祭司たちの問題だ。” -> ending_price_of_rain

@ending ending_price_of_rain “雨の代価”
system: リゾはルナと雨の印章をフェリディアンの祭司たちへ引き渡す。
system: 祭司たちは金、水、安全な通行を代価として支払う。
system: リゾは約束どおり、ノックスに一人前の取り分を渡す。
rizo: 宝が欲しかったんだろう。
rizo: ほら、手に入った。
system: 隊商が出発すると、背後で儀式の鐘が鳴る。
nox [thought]: 袋は思っていたより重い。
system: 誰も振り返らない。

@scene p062_bandits_in_darkness
system: 野営地は混乱に飲み込まれる。
system: 数人の盗賊が尾根へ向かって走る。
system: 脱出用ロープが切れ、二人が落ちる。
bandit: 助けてくれ！
system: リゾは雨の印章を持って月の門へ走る。
luna: 逃げられる。
-> p062_reply

@prompt p062_reply “僕は”

* “動けなくなった盗賊たちを助ける” => “動けなくなった盗賊たちを助ける。” -> p067_better_leader
* “彼らを置いてリゾを追う” => “彼らを置いてリゾを追う。” -> p063_moon_gate_opens
* “戦いをやめるよう命じる” => “戦いをやめるよう命じる。” -> p067_better_leader

@scene p063_moon_gate_opens
system: リゾが黒い石の門へたどり着く。
system: 三日月形のくぼみに雨の印章を押し込む。
temple: ドン。
system: 門が内側へ開く。
rizo: 遅かったな、ノックス。
system: リゾはその先の暗闇へ消える。
system: 石の門が閉じ始める。
-> p063_reply

@prompt p063_reply “僕は”

* “すぐにリゾを追う” => “すぐにリゾを追う。” -> p069_rizos_trail
* “ルナを待つ” => “ルナを待つ。” -> p068_into_temple_together
* “まず雨の印章を外そうとする” => “まず雨の印章を外そうとする。” -> p063_seal_rejects

@scene p063_seal_rejects
system: ノックスは印章へ手を伸ばす。
system: 三日月形のくぼみが彼の手を挟むように閉じる。
temple: チリン！
nox: またあの鐘か。
system: 石の刃が落ちる直前、ルナが彼を後ろへ引く。
luna: 同じ間違いを繰り返すことには、本当に熱心ね。
-> p068_into_temple_together

@scene p064_prisoner_of_priests
system: フェリディアンの衛兵たちがノックスの手を縛る。
guard: お前が泥棒か証人かは、高位祭司が決める。
nox: リゾが雨の印章を持っている。
guard: 知っている。
nox: なら、なぜまだこの門を守っているんだ？
guard: 奴は三日月の翡翠を持っていないからだ。
system: 衛兵はノックスの背後の洞窟へ目を向ける。
-> p064_reply

@prompt p064_reply “僕は”

* “ルナが近くにいると明かす” => “ルナは近くにいる。” -> p070_priests_escort
* “ルナの居場所を隠す” => “ルナがどこにいるか知らない。” -> p064_conceal
* “リゾは彼女を売るつもりだと言う” => “リゾは彼女を売るつもりだ。” -> p070_priests_escort

@scene p064_conceal
guard: 嘘をついているな。
nox: リゾから学んだんだ。
guard: なら、祭司の前で嘘がなぜ通じないかも学んだかもしれないな。
system: 衛兵たちはノックスを古い水道橋の入口へ連れていく。
-> p075_forgotten_aqueduct

@scene p065_stolen_rain_seal
system: ノックスはリゾの腰帯から紐を切る。
system: 雨の印章が手の中へ落ちる。
rizo: ノックス。
system: すべての盗賊が彼を見る。
system: 上の尾根にルナが姿を現す。
-> p065_reply

@prompt p065_reply “僕は”

* “印章をルナへ投げる” => “印章をルナへ投げる。” -> p068_into_temple_together
* “自分のものにする” => “自分のものにする。” -> p071_seals_false_promise
* “リゾとの取引に使う” => “リゾとの取引に使う。” -> p065_bargain

@scene p065_bargain
nox: 僕を行かせろ。
nox: さもなければ、印章を崖から投げる。
rizo: 自分の命より価値ある唯一の物を、お前が壊せるものか。
nox: あなたは何度も、その二つを比べるね。
system: リゾが一歩近づく。
-> p065_bargain_reply

@prompt p065_bargain_reply “僕は”

* “ルナへ投げる” => “ルナへ投げる。” -> p068_into_temple_together
* “リゾへ返す” => “リゾへ返す。” -> p061_rizos_bargain
* “それを持って門へ走る” => “それを持って門へ走る。” -> p071_seals_false_promise

@scene p066_mouse_cuts_cage
system: ノックスはリゾが背を向けるまで待つ。
system: 鉄の檻の後ろへ忍び込む。
system: 中では、手首を縛られたルナが座っている。
luna: 戻ってきたのね。
nox: 静かに。
luna: 前にナイフを置いたときも、そう言っていた。
nox: 助けようとしているんだ。
luna: なら、もっと急いで。
-> p066_reply

@prompt p066_reply “僕は”

* “檻を開けて彼女と逃げる” => “檻を開けて彼女と逃げる。” -> p068_into_temple_together
* “先に報酬を要求する” => “先に報酬を要求する。” -> p071_seals_false_promise
* “すぐにリゾを攻撃するよう頼む” => “すぐにリゾを攻撃するよう頼む。” -> p057_lunas_assault

@scene p067_better_leader
system: ノックスは動けなくなった盗賊たちのロープを切る。
bandit: なぜ俺たちを助ける？
nox: リゾなら助けないからだ。
system: 残った盗賊たちはためらう。
bandit: あいつはお前を先に送り込んだ。
bandit: そのあと、俺たちまで置き去りにした。
system: リゾは一人で月の門へたどり着く。
-> p067_reply

@prompt p067_reply “僕は彼らに”

* “武器を収めてフェリディアン領を去れと言う” => “武器を収めてフェリディアン領を去れ。” -> p072_caravan_divides
* “僕についてリゾと戦えと言う” => “僕についてリゾと戦え。” -> p072_caravan_divides
* “僕抜きでリゾを追えと言う” => “僕抜きでリゾを追え。” -> p073_expendable_again

@scene p068_into_temple_together
system: ノックスとルナは月の門の前に立つ。
system: 古代フェリディアン文字が、三日月形の錠を囲んでいる。
luna: リゾは中へ入った。
nox: なら、追う。
luna: 正門は祭司のためのものよ。
nox: 別の入口は？
luna: 昔は水道橋があった。
-> p068_reply

@prompt p068_reply “僕たちは”

* “月の門から入るべきだ” => “月の門から入るべきだ。” -> p074_temple_of_abundance
* “古い水道橋を探すべきだ” => “古い水道橋を探すべきだ。” -> p075_forgotten_aqueduct
* “衛兵を待つべきだ” => “衛兵を待つべきだ。” -> p070_priests_escort

@scene p069_rizos_trail
system: ノックスは門が閉じる前に滑り込む。
system: その先の廊下には黒い床石が並んでいる。
system: リゾの足跡は不規則な順序でそれらを横切っている。
system: 踏まれていないいくつかの床石には、浅い三日月の印がある。
nox [thought]: あいつは踏んだ石もあれば、避けた石もある。
nox [thought]: だからといって、どれが安全か知っていたとは限らない。
-> p069_reply

@prompt p069_reply “僕は”

* “リゾが踏んだ場所を正確に踏む” => “リゾが踏んだ場所を正確に踏む。” -> p076_first_offering_hall
* “まず敷居を調べる” => “まず敷居を調べる。” -> p075_forgotten_aqueduct
* “踏まれていない三日月の床石を進む” => “踏まれていない三日月の床石を進む。” -> p069_trap

@scene p069_trap
system: ノックスは踏まれていない三日月の床石を踏む。
temple: チリン！
system: 背後で石の遮蔽板が落ちる。
system: 廊下へ水が流れ込み始める。
-> p093_flooded_shaft

@scene p070_priests_escort
system: フェリディアンの衛兵たちがノックスとルナを囲む。
guard: 三日月の翡翠が戻った。
luna: 雨の印章を取り戻すために戻ったの。
guard: 高位祭司がお前の話を聞く。
luna: 私が逃げる前にも、あの人は聞いていた。
system: 衛兵たちは神殿へ続く儀式の道を開く。
-> p070_reply

@prompt p070_reply “僕は”

* “今は従う” => “今は従う。” -> p077_procession_white_robes
* “ルナが脇道へ逃げるのを助ける” => “ルナが脇道へ逃げるのを助ける。” -> p075_forgotten_aqueduct
* “生贄は自ら望んだものか尋ねる” => “生贄は自ら望んだものなのか？” -> p070_answer

@scene p070_answer
guard: 三日月の翡翠は選ばれた。
nox: それは僕の質問への答えではない。
guard: 一つの命が谷を守る。
luna: それも彼の質問への答えではない。
system: 衛兵たちは隊列を狭める。
-> p077_procession_white_robes

@scene p071_seals_false_promise
system: ノックスは雨の印章を手にしている。
system: 黒い石は手の中で温かい。
nox [thought]: これがあれば、自分で神殿を開けられる。
system: 尾根の下に、封じられた狭い扉がある。
system: そのくぼみは三日月の形と一致する。
-> p071_reply

@prompt p071_reply “僕は”

* “最初の扉に印章を使う” => “最初の扉に印章を使う。” -> ending_false_treasure
* “ルナへ返す” => “ルナへ返す。” -> p068_into_temple_together
* “隠して水道橋から入る” => “隠して水道橋から入る。” -> p075_forgotten_aqueduct

@ending ending_false_treasure “偽りの宝”
system: ノックスは雨の印章を扉へ押し込む。
system: 三日月形の錠がそれを受け入れる。
system: 足元の床が開く。
nox [thought]: 開いた。
system: 印章は、あらゆる扉を開ける鍵ではなかった。
system: 権威を示す印にすぎない。
system: 神殿はノックスをその所持者とは認めない。

@ending ending_buried_abundance “豊穣に埋もれて”
system: ノックスは、抱えているものを手放そうとしない。
system: 金、水、石が彼の周囲でますます重くなる。
temple: 節度なき豊穣は重荷となる。
system: 手放さなかったすべての重みによって、部屋が閉じていく。

@scene p072_caravan_divides
system: ムリドの盗賊たちは武器を下ろす。
system: 隊商路へ逃げる者もいる。
system: ノックスのそばに残る者もいる。
bandit: リゾが印章を持っている。
bandit: 月の門の場所も知っている。
nox: なら、別の道から神殿へ行く。
system: ルナは尾根に刻まれた乾いた水路を指す。
luna: 古い水道橋よ。
-> p072_reply

@prompt p072_reply “僕たちは”

* “水道橋から入る” => “僕たちは水道橋から入る。” -> p075_forgotten_aqueduct
* “正門からリゾを追う” => “僕たちは正門からリゾを追う。” -> p076_first_offering_hall
* “盗賊たちを帰し、二人で進む” => “帰れ。ルナと僕で先へ進む。” -> p075_forgotten_aqueduct

@scene p073_expendable_again
system: 盗賊たちはリゾを追って駆け込む。
system: ノックスは後に残る。
system: その直後、月の門の中で鐘が鳴る。
temple: チリン。
temple: チリン。
temple: チリン。
system: 悲鳴が石の中を響く。
nox [thought]: あいつは彼らを先に送り込んだ。
nox [thought]: 僕にしたのと同じように。
-> ending_one_mouse_caravan

@scene p074_temple_of_abundance
system: 第四部
system: 豊穣の神殿の秘密
system: ノックスとルナの背後で月の門が閉じる。
system: 空気には埃、香、遠い水の匂いが混じっている。
system: 壁一面に雨の彫刻がある。
system: リゾの足跡は金色の廊下へ続いている。
system: それより古い水路は、反対方向へ下っている。
luna: 門が開いたことは、もう祭司たちに知られているはず。
nox: なら、急ごう。
-> p074_reply

@prompt p074_reply “僕たちは”

* “古代の雨の彫刻をたどるべきだ” => “古代の雨の彫刻をたどるべきだ。” -> p078_door_without_shadow
* “リゾの足跡をたどるべきだ” => “リゾの足跡をたどるべきだ。” -> p079_rizos_triggered_trap
* “下から聞こえる水音をたどるべきだ” => “下から聞こえる水音をたどるべきだ。” -> p075_forgotten_aqueduct

@scene p075_forgotten_aqueduct
system: 第四部
system: 豊穣の神殿の秘密
system: ノックスとルナは神殿の下にある乾いた石造りの水路へ入る。
system: 鉱物の染みから、かつてここを水が流れていたことが分かる。
system: さらに下のどこかから、かすかな水音が聞こえる。
system: 上の開口部から詠唱が響いてくる。
luna: この通路は、今の祭司職より古い。
nox: どうして分かるの？
luna: 昔の建築者は、水が入ってくることを想定していた。
luna: 今の祭司は、血が入ることを想定している。
-> p075_reply

@prompt p075_reply “僕たちは”

* “水音をたどるべきだ” => “水音をたどるべきだ。” -> p080_dry_reservoir
* “上の詠唱をたどるべきだ” => “上の詠唱をたどるべきだ。” -> p081_high_priest
* “壁に残るリゾの傷跡をたどるべきだ” => “壁に残るリゾの傷跡をたどるべきだ。” -> p076_first_offering_hall

@scene p076_first_offering_hall
system: 第四部
system: 豊穣の神殿の秘密
system: ノックスは儀式の捧げ物で満ちた部屋へ入る。
system: 金の鉢が壁沿いに並んでいる。
system: リゾの足跡が埃を横切っている。
system: 一つの鉢はすでに持ち去られている。
nox [thought]: 最初に目に入った宝を持っていったんだ。
system: 捧げ物の先に、低い石の扉が待っている。
-> p076_reply

@prompt p076_reply “僕は”

* “金には触れずにおく” => “金には触れずにおく。” -> p078_door_without_shadow
* “金の鉢を一つ持っていく” => “金の鉢を一つ持っていく。” -> p082_weight_of_gold
* “鉢の下にある印を調べる” => “鉢の下にある印を調べる。” -> p076_marks

@scene p076_marks
system: どの鉢の下にも絵が刻まれている。
system: 一つの下には穀物。
system: 別の下には水。
system: 空いた場所の下には、ひざまずく少女。
nox [thought]: 捧げ物は、すべて物ではない。
nox [thought]: 谷が差し出すものを表している。
-> p078_door_without_shadow

@scene p077_procession_white_robes
system: 白衣の祭司たちが神殿の階段を下りてくる。
system: フェリディアンの衛兵たちがノックスとルナを囲む。
system: 祭司はそれぞれ、空の銀鉢を持っている。
priest: 三日月の翡翠が戻った。
luna: 雨の印章を取り戻しに戻ったの。
priest: 印章はすでに神殿を開いた。
priest: 神々は徴を受け入れた。
nox [thought]: ルナがここにいないかのように話している。
-> p077_reply

@prompt p077_reply “僕は”

* “ルナがどうなるのか尋ねる” => “ルナはどうなる？” -> p083_meaning_of_jade
* “黙って観察する” => “黙って観察する。” -> p081_high_priest
* “リゾが雨の印章を持っていると伝える” => “リゾが雨の印章を持っている。” -> p077_rizo

@scene p077_rizo
priest: 盗人はお前たちより先に入った。
guard: 内殿を捜索しています。
luna: なら、詠唱をやめて捕まえなさい。
priest: 儀式は一人の盗賊より重要だ。
nox: あいつは聖なる部屋を開けられる。
priest: 本当に重要なものを開けられるのは、神殿に認められた者だけだ。
system: 石の奥深くで鐘が鳴る。
temple: チリン。
priest: 来なさい。
-> p081_high_priest

@scene p078_door_without_shadow
system: ノックスとルナは円形の扉へたどり着く。
system: 表面には三つの淡い石がはめ込まれている。
system: 一つ目は強く輝き、長い影を落としている。
system: 二つ目は鈍く、影を落とさない。
system: 三つ目はノックスが動くたびに明滅する。
nox [thought]: 本物の月長石は影を落とさなかった。
luna: 慎重に選んで。
-> p078_reply

@prompt p078_reply “僕は”

* “影のない石を押す” => “影のない石を押す。” -> p084_hall_three_hungers
* “一番明るい石を押す” => “一番明るい石を押す。” -> p085_false_crescent
* “明滅する石を押す” => “明滅する石を押す。” -> p085_false_crescent

@scene p079_rizos_triggered_trap
system: リゾの足跡は、細い床石の廊下を進んでいる。
system: いくつかの床石は、彼の重みで沈んでいる。
system: 壁の刃には、破れた上着の切れ端が掛かっている。
nox [thought]: 生き延びた。
nox [thought]: だからといって、正しく選んだわけではない。
system: 踏まれていない三日月の床石が、別の道を作っている。
-> p079_reply

@prompt p079_reply “僕は”

* “リゾの足跡を正確にたどる” => “リゾの足跡を正確にたどる。” -> p084_hall_three_hungers
* “まず仕掛けを調べる” => “まず仕掛けを調べる。” -> p079_inspection
* “踏まれていない三日月の道を進む” => “踏まれていない三日月の道を進む。” -> p086_untouched_floor

@scene p079_inspection
system: 細い溝が沈んだ床石と壁の刃をつないでいる。
system: 刃はすでに作動済みだ。
system: 踏まれていない三日月の床石は、天井の穴につながっている。
nox [thought]: リゾは目に見える罠を作動させた。
nox [thought]: 踏まれていない道には、まだ罠が残っているかもしれない。
-> p079_inspection_reply

@prompt p079_inspection_reply “より安全なのは”

* “リゾがすでに刃を作動させた道だ” => “より安全なのは、リゾがすでに刃を作動させた道だ。” -> p084_hall_three_hungers
* “踏まれていない三日月の床石だ” => “より安全なのは、踏まれていない三日月の床石だ。” -> p086_untouched_floor
* “どちらでもない” => “どちらの道も安全ではない。” -> p079_wall_route

@scene p079_wall_route
system: ノックスは彫刻された壁を調べる。
system: 二つの罠道の上に、保守用の細い足場がある。
luna: 通れるほど小さい？
nox: 僕なら。
luna: そうでしょうね。
system: ノックスは仕掛けの上を登り、内側から扉を開ける。
-> p084_hall_three_hungers

@scene p080_dry_reservoir
system: 水道橋は巨大な地下空間へ開いている。
system: ノックスの頭上はるか高くまで、壁に鉱物の線が残っている。
system: 貯水槽はほぼ完全に干上がっている。
system: 石の水門が、さらに深い複数の水路を分けている。
luna: ここには水があるはず。
nox: 昔はあった。
system: 操作壁一面に、記号が列をなして刻まれている。
-> p080_reply

@prompt p080_reply “僕は”

* “水位の印を調べる” => “水位の印を調べる。” -> p087_ancient_water_script
* “乾いた底で価値あるものを探す” => “乾いた底で価値あるものを探す。” -> p082_weight_of_gold
* “祭司の部屋へ向かって登る” => “祭司の部屋へ向かって登る。” -> p081_high_priest

@scene p081_high_priest
system: 行列は夜空に開かれた部屋へ入る。
system: 神殿の上に細い三日月が浮かんでいる。
system: 空の祭壇のそばで高位祭司が待っている。
priest: ルナ。
luna: 会いたかったみたいに、その名を呼ばないで。
priest: 谷のすべての村が、お前の帰還を祈っていた。
luna: 祈ったのは雨でしょう。
priest: 彼らは、もう違いなどないと学んだ。
-> p081_reply

@prompt p081_reply “僕は”

* “生贄に異議を唱える” => “彼女を殺すつもりなのか。” -> p088_one_life_thousand
* “なぜ雨が降らなくなったのか尋ねる” => “なぜ雨が降らなくなった？” -> p089_drought_ledger
* “ルナが自ら望んだのか尋ねる” => “ルナはこれを選んだのか？” -> p081_choice

@scene p081_choice
system: 高位祭司はルナを見る。
priest: 彼女は生まれた時に選ばれた。
nox: それは同じことではない。
priest: 命は、その持ち主が目的を理解する前に選ばれることもある。
luna: 選ぶ側には都合のいい話ね。
-> p088_one_life_thousand

@scene p082_weight_of_gold
system: ノックスは金の捧げ物を一つ持ち上げる。
system: 思ったより軽い。
system: 次の戸口へ近づくにつれ、鉢は重くなる。
nox [thought]: 重さが増している。
system: 背後の石の扉が閉じ始める。
temple: 運ぶものを差し出せ。
-> p082_reply

@prompt p082_reply “僕は”

* “金を落とす” => “金を落とす。” -> p084_hall_three_hungers
* “扉の向こうまで運ぶ” => “扉の向こうまで運ぶ。” -> ending_buried_abundance
* “ルナに渡す” => “ルナに渡す。” -> p082_luna

@scene p082_luna
system: ルナは鉢を受け取らない。
luna: 拾ったのはあなたよ。
nox: 重すぎる。
luna: なら、あなたのものなのでしょう。
nox [thought]: 神殿が試しているのは力じゃない。
nox [thought]: 手放せるかどうかだ。
-> p082_reply

@scene p083_meaning_of_jade
nox: 「三日月の翡翠」とはどういう意味なんだ？
priest: 三日月の下で捧げられる、穢れなき命。
nox: 人だ。
priest: 祝福だ。
luna: 少女よ。
system: 祭司はルナを見ない。
priest: 谷は、もう一季節も雨なしでは生きられない。
-> p083_reply

@prompt p083_reply “三日月の翡翠は”

* “ルナだ” => “三日月の翡翠はルナだ。” -> p090_lunas_confession
* “やはり実物の聖遺物に違いない” => “三日月の翡翠は、やはり実物の聖遺物に違いない。” -> p085_false_crescent
* “祭司たちが彼女に押しつけた称号だ” => “三日月の翡翠は、祭司たちが彼女に押しつけた称号だ。” -> p090_lunas_confession

@scene p084_hall_three_hungers
system: 三つの彫刻の下に、三つの扉が立っている。
system: 一つ目には、水があふれる鉢。
system: 二つ目には、金の山。
system: 三つ目には、月の下へ続く開かれた道。
temple: 汝の望みを選べ。
nox [thought]: 水。
nox [thought]: 富。
nox [thought]: 自由。
-> p084_reply

@prompt p084_reply “僕が選ぶのは”

* “水” => “僕が選ぶのは水だ。” -> p087_ancient_water_script
* “金” => “僕が選ぶのは金だ。” -> p082_weight_of_gold
* “自由” => “僕が選ぶのは自由だ。” -> p091_door_of_release

@scene p085_false_crescent
system: ノックスは輝く三日月を押す。
system: 石が割れて開く。
system: 中には緑色のガラスの偽物がある。
nox: 三日月の翡翠。
luna: 違う。
system: 部屋の扉が勢いよく閉じる。
temple: 偽りの捧げ物。
-> ending_false_treasure

@scene p086_untouched_floor
system: ノックスは踏まれていない三日月の床石へ乗る。
temple: チリン！
system: 背後で石の遮蔽板が落ちる。
system: 壁の穴から水が流れ込み始める。
nox: 誰も踏んでいない道なら安全だと思った。
luna: 誰も踏んでいないということは、試されていないということもある。
system: 水位が上がる先に、釣り合いを取るためのレバーがある。
-> p086_reply

@prompt p086_reply “僕は”

* “落ちている石で床を試す” => “落ちている石で床を試す。” -> p092_counterweight_chamber
* “水が上がる前に走り抜ける” => “水が上がる前に走り抜ける。” -> p093_flooded_shaft
* “保守用の解除装置を探す” => “保守用の解除装置を探す。” -> p092_counterweight_chamber

@scene p087_ancient_water_script
system: 操作壁には、水路、貯水槽、季節の印が描かれている。
system: すべての主要な水門のそばに、同じ記号が繰り返されている。
system: 地下牢の壁画で月の下にいた少女によく似ている。
nox [thought]: 同じ人影だ。
luna: 祭司たちは、生贄を意味すると言っている。
nox: 操作する者を意味するのかもしれない。
-> p087_reply

@prompt p087_reply “僕は”

* “地下牢の壁画と比べる” => “地下牢の壁画と比べる。” -> p094_first_crescent_jade
* “祭司の文字にすぎないと退ける” => “祭司の文字にすぎないと退ける。” -> p089_drought_ledger
* “最も深い水門まで水路をたどる” => “最も深い水門まで水路をたどる。” -> p092_counterweight_chamber

@scene p088_one_life_thousand
nox: 彼女を殺すつもりなんだ。
priest: 谷を救うつもりだ。
nox: 一人の少女を殺して。
priest: 数千人が死ぬ前に、一つの死を受け入れるのだ。
system: 高位祭司は眼下の乾いた谷を示す。
priest: 井戸は枯れている。
priest: 子どもたちは泥水を飲む。
priest: 農民は暖を取るために種籾を燃やす。
priest: 私がまず、どの命を重く見るべきか教えてくれ。
-> p088_reply

@prompt p088_reply “僕は”

* “別の解決策を要求する” => “別の解決策があるはずだ。” -> p094_first_crescent_jade
* “代わりにリゾを差し出す” => “代わりにリゾを生贄にしろ。” -> p095_rizo_at_altar
* “ルナには何の義務もないと言う” => “ルナはあなたたちに何も負っていない。” -> p090_lunas_confession

@scene p089_drought_ledger
system: 高位祭司は分厚い台帳を開く。
system: 各ページには、村の井戸、収穫量、死者数が記録されている。
priest: 残された日々を一日残らず数えた。
priest: 谷に残された時間は、おそらく二か月だ。
nox: そして、ルナが死ねば雨が降ると信じている。
priest: 過去にも、儀式のあとに雨が降った。
nox: あとに、だ。
nox: 儀式が降らせたわけではない。
-> p089_reply

@prompt p089_reply “僕は”

* “祭司たちの理屈を受け入れる” => “一つの命が谷を救うのかもしれない。” -> p096_lunas_choice
* “もっと古い記録を探す” => “最古の記録を見たい。” -> p094_first_crescent_jade
* “祭司が嘘をついていると責める” => “生贄が効かないと知っているんだろう。” -> p089_accusation

@scene p089_accusation
priest: 私に分かるのは、何もしなければ失敗するということだけだ。
priest: 確信とは、責任を負わない者にだけ許される贅沢だ。
luna: そして生贄とは、自分が捧げられない者にだけ許される贅沢ね。
system: 高位祭司は台帳を閉じる。
-> p096_lunas_choice

@scene p090_lunas_confession
system: ルナは祭壇を見る。
luna: 子どもの頃に選ばれた。
luna: 部屋へ入るたび、なぜ皆が泣くのかを知るより先に、祈りを教えられた。
nox: なぜ逃げたの？
luna: 生きたかったから。
system: ルナの爪が手のひらへ食い込む。
luna: それを身勝手だと、今でも信じている自分がいるから。
-> p090_reply

@prompt p090_reply “僕は”

* “彼女を死なせないと約束する” => “君を殺させない。” -> p097_promise_without_proof
* “彼女自身が生贄を選ぶのか尋ねる” => “今なら、君はそれを選ぶ？” -> p096_lunas_choice
* “選択は彼女自身のものだと伝える” => “選ぶのは君だ。” -> p090_choice_belongs

@scene p090_choice_belongs
luna: 本当に？
luna: 私が去れば、子どもたちが死ぬかもしれない。
luna: 残れば、私が死ぬ。
luna: それは選択ではない。
nox: なら、第三の道を探す。
luna: ネズミが必要としただけで、道が現れるみたいに言うのね。
nox: ネズミにしか気づけないほど細いから、見つかる道もある。
-> p097_promise_without_proof

@scene p091_door_of_release
system: 開かれた道の印がある扉は、牢獄の部屋へ続いている。
system: 古い鎖が壁から垂れている。
system: 中央のレバーは錆びた錠で縛られている。
system: リゾが石の柵の向こうに座っている。
rizo: ノックス。
rizo: お前なら自由を選ぶと思っていた。
nox: 自分のためにね。
rizo: 自由とは、そう都合よく相手を選べるものではない。
-> p091_reply

@prompt p091_reply “僕は”

* “鎖で縛られた機構を解放する” => “鎖で縛られた機構を解放する。” -> p092_counterweight_chamber
* “リゾを解放する” => “リゾを解放する。” -> p098_rizos_last_offer
* “あいつを閉じ込めたままにする” => “ここに置いていく。” -> p091_leave_rizo

@scene p091_leave_rizo
rizo: 祭司たちは娘を殺すぞ。
nox: あなたは彼女を祭司へ売るつもりだった。
rizo: 生き延びるつもりだった。
nox: 僕たちも同じだ。
system: ノックスは背を向ける。
rizo: まだ雨の印章が必要だろう！
system: リゾは上着の下から黒と銀の三日月を持ち上げる。
-> p098_rizos_last_offer

@scene p092_counterweight_chamber
system: 封じられた水門の上に、二つの石の鉢が吊られている。
system: 一つは空だ。
system: もう一つには、黒い沈殿物と古い儀式用品が入っている。
system: 天秤の梁を横切るように、細い碑文が刻まれている。
inscription: 重荷を分かち合うときにのみ、豊穣は流れる。
-> p092_reply

@prompt p092_reply “僕は”

* “空の鉢に石を入れて釣り合わせる” => “空の鉢に石を入れて釣り合わせる。” -> p099_temple_true_purpose
* “空の鉢に雨の印章を置く” => “空の鉢に雨の印章を置く。” -> p093_flooded_shaft
* “重い鉢からすべてを取り出す” => “重い鉢からすべてを取り出す。” -> p092_remove_all

@scene p092_remove_all
system: ノックスは儀式用品を一つずつ取り出す。
system: 重かった鉢が上がる。
system: 空の鉢が速すぎる勢いで落ちる。
system: 二人の下で水門が開く。
system: 水が縦穴へ轟音とともに流れ込む。
-> p093_flooded_shaft

@scene p093_flooded_shaft
system: 水が部屋へ押し寄せる。
system: 流れがノックスを縦穴へ引き込む。
luna: 手を！
-> p093_reply

@prompt p093_reply “僕は”

* “ルナの手を取る” => “ルナの手を取る。” -> p093_rescue
* “雨の印章を離さない” => “雨の印章を離さない。” -> ending_buried_abundance
* “下の水門へ泳ぐ” => “下の水門へ泳ぐ。” -> ending_buried_abundance

@scene p093_rescue
system: ルナがノックスの手首をつかむ。
system: 二人は力を合わせ、洪水の上にある保守用の足場へたどり着く。
nox: 猫は水が嫌いだと思っていた。
luna: 溺れるネズミを見るほうが嫌い。
system: 狭い保守通路が、古い操作室へ続いている。
-> p099_temple_true_purpose

@scene p094_first_crescent_jade
system: ノックスは現存する最古の記録を開く。
system: ページには、水門のそばに立つフェリディアンの少女が描かれている。
system: 彼女が持つのは道具であり、儀式の刃ではない。
inscription: 三日月の翡翠は、その生涯を谷に捧げるものとする。
system: その下には二つ目の文が残っている。
inscription: 後継者が現れるまで、彼女は水を守るものとする。
nox: 生涯を捧げる。
nox: 命を失う、ではない。
luna: 一生を務めに捧げるということ。
nox: 最初の三日月の翡翠は、水守だったんだ。
-> p094_reply

@prompt p094_reply “生贄とは”

* “もともと生涯にわたる奉仕だった” => “生贄とは、もともと生涯にわたる奉仕だった。” -> p099_temple_true_purpose
* “それでも血を必要とするはずだ” => “生贄には、それでも血が必要なはずだ。” -> p096_lunas_choice
* “後世の祭司が作り出したものだ” => “生贄は、後世の祭司が作り出したものだ。” -> p094_later_records

@scene p094_later_records
system: 後世の記録では、道具が鉢に置き換えられている。
system: さらに後になると、鉢は刃に変わる。
system: どの世代も、その前の世代を書き写している。
luna: たった一人の祭司が作ったわけではない。
nox: それなら、止めるのはもっと難しい。
luna: そして、一人ひとりが自分は無実だと言いやすくなる。
-> p099_temple_true_purpose

@scene p095_rizo_at_altar
system: 衛兵たちがリゾを儀式の部屋へ引きずってくる。
rizo: ノックス。
rizo: 馬鹿げていると、こいつらに言ってやれ。
priest: 谷のために一つの命を。
rizo: なら、それを信じている奴を使え。
nox: あなたはルナを差し出すつもりだった。
rizo: あれは商売だ。
-> p095_reply

@prompt p095_reply “僕は”

* “祭司たちにリゾを引き渡す” => “こいつを連れていけ。” -> p095_not_accepted
* “情報を得るためリゾの逃亡を助ける” => “あいつの知っていることが必要だ。” -> p098_rizos_last_offer
* “別の生贄へ置き換えることを拒む” => “その祭壇に載せられていい者などいない。” -> p100_rain_seal_reclaimed

@scene p095_not_accepted
priest: 三日月の翡翠は、ただの肉体ではない。
priest: 選ばれし印を帯びていなければならない。
rizo: ほらな？
rizo: こいつらの残酷さにさえ規則がある。
system: 祭司たちはリゾを脇へ押しやる。
-> p100_rain_seal_reclaimed

@scene p096_lunas_choice
system: ルナは開かれた祭壇の前に立つ。
priest: 谷が待っている。
luna: 私が生まれる前から、谷は待ち続けている。
priest: お前が逃げたからだ。
luna: あなたたちの神殿が機能しなくなったからよ。
system: ルナはノックスを見る。
luna: 本当のことを言って。
luna: ほかに道がないなら、私はやるべき？
-> p096_reply

@prompt p096_reply “僕は”

* “君が何を選んでも尊重する” => “君が何を選んでも尊重する。” -> p096_respect
* “君を死なせることはできない” => “君を死なせることはできない。” -> p097_promise_without_proof
* “一つの命が数千人を救うかもしれないと思う” => “一つの命が数千人を救うかもしれないと思う。” -> p101_sacrificial_procession

@scene p096_respect
luna: それは答えではない。
nox: 僕に言える、唯一正直な答えだ。
luna: なら、選ばされる前にもっとましな答えを探すのを手伝って。
-> p099_temple_true_purpose

@scene p097_promise_without_proof
nox: 君を殺させない。
luna: どうやって？
nox: まだ分からない。
luna: それでは約束ではない。
nox: 進む方向だ。
system: 神殿中で鐘が鳴り始める。
priest [distant]: 祭壇を整えよ。
-> p097_reply

@prompt p097_reply “僕は”

* “貯水設備を調べる” => “貯水設備を調べる。” -> p099_temple_true_purpose
* “すぐに祭司たちを攻撃する” => “すぐに祭司たちを攻撃する。” -> p101_sacrificial_procession
* “リゾと雨の印章を探す” => “リゾと雨の印章を探す。” -> p098_rizos_last_offer

@scene p098_rizos_last_offer
system: リゾは最後の操作扉のそばに立っている。
system: 雨の印章が錠へ押し当てられている。
rizo: 祭司たちは、娘が雨をもたらすと思っている。
rizo: お前は、この古い管が雨をもたらすと思っている。
rizo: 俺は、追い詰められた者ならどちらの話にも金を払うと思っている。
nox: 扉を開けろ。
rizo: 先に仲間になる約束だ。
-> p098_reply

@prompt p098_reply “僕は”

* “リゾとの協力を受け入れる” => “一緒にやろう。” -> ending_rizos_golden_bargain
* “操作室へ入るために利用する” => “扉を開けろ。そのあとで話す。” -> p100_rain_seal_reclaimed
* “印章を奪うため攻撃する” => “印章を渡せ。” -> p098_fight

@scene p098_fight
system: ノックスは雨の印章へ飛びかかる。
system: リゾは彼を石の扉へ叩きつける。
rizo: また身の丈以上の相手と戦おうとしているな。
system: ルナが上の足場から飛び降りる。
luna: なら、もっと重い相手が必要ね。
system: リゾが振り向いた時には遅い。
-> p100_rain_seal_reclaimed

@scene p099_temple_true_purpose
system: 最後の部屋に祭壇はない。
system: あるのは車輪、水門の操作装置、測定棒、そして谷の地図だ。
system: 古代の水路が、石灰岩の貯水槽とすべてのフェリディアン集落をつないでいる。
nox: この神殿は雨を作ったんじゃない。
luna: 水を蓄えていた。
nox: そして、干ばつの時に放流した。
system: 壊れた操作輪が、三日月形の支えの下にある。
luna: 三日月の翡翠は、この設備を保守していた。
nox: 祭司たちは称号だけを残し、仕事を忘れたんだ。
-> p099_reply

@prompt p099_reply “僕たちは”

* “古代の水門を開くべきだ” => “古代の水門を開くべきだ。” -> p102_buried_water
* “まず祭司たちに真実を示すべきだ” => “まず祭司たちに真実を示すべきだ。” -> p103_priests_doubt
* “知識を持って逃げるべきだ” => “知識を持って逃げるべきだ。” -> p099_escape_knowledge

@scene p099_escape_knowledge
luna: そして、空の貯水槽だけを残すの？
nox: 助けを連れて戻れる。
luna: 儀式は今夜始まる。
nox: なら、時間がない。
-> p102_buried_water

@scene p100_rain_seal_reclaimed
system: ルナは操作扉から雨の印章を引き剥がす。
system: リゾは壁へよろめく。
rizo: まだ俺が必要だ。
luna: 必要だったのは印章よ。
nox: それが、あなたが誰に対しても犯した間違いだ。
rizo: どの間違いだ？
nox: 道具を、それを使う人より大切だと思ったことだ。
-> p100_reply

@prompt p100_reply “僕は”

* “雨の印章をルナに渡す” => “印章はルナが持つべきだ。” -> p103_priests_doubt
* “自分で雨の印章を使う” => “僕が印章を使う。” -> ending_rizos_golden_bargain
* “雨の印章を壊す” => “誰にもこれを支配させるべきではない。” -> p100_destroy

@scene p100_destroy
system: ノックスは石床の上へ印章を振り上げる。
luna: 待って。
nox: 祭司たちは、それで君を選んだ。
luna: 印章は水門の操作にも使う。
system: ノックスは手を下ろす。
luna: 危険な道具も、道具であることに変わりはない。
luna: 使う者を変えるのよ。
-> p103_priests_doubt

@scene p101_sacrificial_procession
system: 神殿の鐘がすべての廊下を満たす。
system: 衛兵たちがルナを捕らえ、屋外の祭壇へ連れていく。
system: 村人たちが神殿の階段下に集まる。
system: 祈る者もいる。
system: 泣く者もいる。
system: 何もない空を見つめる者もいる。
priest: 月がアーチの中央へ達した時、捧げの儀を始める。
nox [thought]: もう時間がない。
-> p101_reply

@prompt p101_reply “僕は”

* “力ずくでルナを救う” => “力ずくでルナを救う。” -> p104_battle_beneath_crescent
* “儀式を続けさせる” => “儀式を続けさせる。” -> p105_promised_rain
* “神殿の記録を使って儀式を中断させる” => “この儀式は誤訳に基づいている。” -> p103_priests_doubt

@scene p102_buried_water
system: 第五部
system: 三日月のルナ
system: ノックスとルナは最後の水門操作装置の前に立つ。
system: 水圧で古い管が震えている。
system: 何世代もの間閉ざされた石の水門の向こうで、水が待っている。
luna: 急に開けば、下流の谷が洪水になる。
nox: ゆっくりすぎれば、儀式が続いてしまう。
system: 操作輪には二つの設定がある。
system: 一つは、水路へ徐々に放流する。
system: もう一つは、すべての水門を一度に破る。
-> p102_reply

@prompt p102_reply “僕は”

* “貯水槽の水をゆっくり放流する” => “貯水槽の水をゆっくり放流する。” -> p106_valley_drinks
* “すべての水門を一度に破る” => “すべての水門を一度に破る。” -> p107_great_flood
* “祭司の許可を待つ” => “祭司の許可を待つ。” -> p103_priests_doubt

@scene p103_priests_doubt
system: 第五部
system: 三日月のルナ
system: ノックスとルナは、最古の神殿記録を持って儀式の部屋へ入る。
system: 高位祭司は祭壇のそばに立っている。
priest: 月はまもなく定位置へ達する。
nox: あなたたちの訳は間違っている。
system: ノックスは、最初の三日月の翡翠が水の操作装置のそばに描かれた記録を開く。
luna: 彼女は水守だった。
luna: 死体ではない。
priest: 古い記号には、さまざまな解釈があり得る。
system: はるか下では、水が忘れられた水門を押している。
-> p103_reply

@prompt p103_reply “僕は”

* “古代の仕組みを実演する” => “なら、神殿が働くところを見て。” -> p106_valley_drinks
* “群衆の前で祭司たちを糾弾する” => “あなたたちは奉仕を生贄へ変えた。” -> p108_faith_in_ruins
* “高位祭司に選ばせる” => “水の仕組みを試すのか、それともルナを殺すのか？” -> p103_choice

@scene p103_choice
system: 高位祭司はルナと乾いた谷を交互に見る。
priest: 仕組みが動かなければ、儀式までに残された最後の時間を失う。
luna: 儀式が失敗すれば、あなたは私を失い、干ばつだけが残る。
nox: 一方の選択はやり直せる。
nox: もう一方は、やり直せない。
system: 高位祭司は儀式用の刃を下ろす。
-> p106_valley_drinks

@scene p106_valley_drinks
system: ノックスは古代の操作輪を握る。
system: ルナが隣で体を支える。
system: 車輪は一瞬、抵抗する。
system: そして動き始める。
temple: ドン。
system: 貯水槽の下で、一つの石の水門が開く。
system: 水が制御された流れとなって最初の水路へ入る。
luna: ゆっくり。
nox: やってる。
system: 二つ目の水門が震える。
system: はるか下で、誰も鳴らしていない神殿の鐘が鳴り始める。
-> p106_reply

@prompt p106_reply “僕は”

* “流れを制御したままにする” => “流れを制御したままにする。” -> p106_channels_open
* “二つ目の水門を全開にする” => “二つ目の水門を全開にする。” -> p107_great_flood
* “止めて谷の様子を確かめる” => “止めて谷の様子を確かめる。” -> p106_check_valley

@scene p106_check_valley
system: ノックスは一時的に車輪を固定する。
system: ルナは谷を見下ろす細い開口部へ登る。
system: 水は最初の乾いた運河へ到達している。
system: 村人たちがそのそばに集まっている。
system: 水路の壁は持ちこたえている。
luna: 動いている。
nox: 一つの運河が動いただけだ。
luna: それでも、どんな生贄より多くを証明した。
-> p106_channels_open

@scene p106_channels_open
system: ノックスは残りの水路を一つずつ開く。
system: 水が、目覚める生き物のように神殿の下を動く。
system: 乾いた噴水が震え始める。
system: 泥色の水が村の貯水池へ流れ込む。
system: 下にいる人々は詠唱をやめる。
system: 初めて、神殿の鐘が祝福の音に聞こえる。
-> p106_after_water

@scene p106_after_water
system: 高位祭司が操作室へ入る。
system: 儀式服の裾が水に濡れている。
priest: 下の運河が満ち始めている。
priest: 西の井戸の水位も上がっている。
luna: そして私はまだ生きている。
system: 高位祭司は古代の操作装置を見る。
priest: 我々は祈りを覚えていた。
priest: 仕事を忘れていた。
-> p106_priest_reply

@prompt p106_priest_reply “僕はこう言う”

* “なら、もう一度その仕事を教えればいい” => “なら、もう一度その仕事を教えればいい。” -> p109_public_choice
* “祭司職は責任を取らなければならない” => “祭司職は、このことへの責任を取らなければならない。” -> p108_faith_in_ruins
* “次に何をするかはルナが決めるべきだ” => “次に何をするかはルナが決めるべきだ。” -> p109_public_choice

@scene p107_great_flood
system: ノックスは最後の操作装置を、印のある限界を越えて無理やり動かす。
temple: バキッ！
system: 貯水槽のすべての水門が一度に開く。
system: 水が古代の水路へ噴き出す。
luna: ノックス！
system: 神殿の床が二人の下で揺れる。
system: はるか下で、最初の運河の壁が決壊する。
-> p107_reply

@prompt p107_reply “僕は”

* “水門を閉じようとする” => “水門を閉じようとする。” -> p107_too_late
* “下流の村々へ警告する” => “下流の村々へ警告する。” -> p107_warning
* “ルナと逃げる” => “逃げないと。” -> p107_escape

@scene p107_too_late
system: ノックスは体重をかけて車輪を押し戻そうとする。
system: 壊れた機構は空回りする。
system: 水はすでに神殿の先へ流れ出ている。
luna: 川を後ろへ引き戻すことはできない。
-> ending_great_flood

@scene p107_warning
system: ノックスは非常用の鐘を打つ。
temple: チリン。
temple: チリン。
temple: チリン。
system: 衛兵たちが下流の谷へ走る。
system: 高台へ逃げられた村人もいる。
system: 間に合わなかった者もいる。
-> ending_great_flood

@scene p107_escape
system: ルナはノックスを保守通路へ引き込む。
system: 背後で操作室が崩れる。
system: 二人は、水が眼下の谷を引き裂く中、尾根へたどり着く。
nox: みんなを救おうとしたんだ。
luna: 分かっている。
luna: だからといって、水が優しくなるわけではない。
-> ending_great_flood

@ending ending_great_flood “大洪水”
system: 干ばつは一夜で終わる。
system: いくつかの村も同じ夜に終わる。
system: 祭司たちは破壊を罰と呼ぶ。
system: リゾは好機と呼ぶ。
system: ノックスは、どちらでもないと知っている。
system: 川の力を与えられた焦りだった。

@scene p108_faith_in_ruins
system: ノックスは最古の神殿記録を儀式の壇上へ運ぶ。
system: 下の階段を村人たちが埋めている。
system: ルナは儀式の拘束具をつけず、彼の隣に立つ。
nox: 最初の三日月の翡翠は殺されていない。
nox: 彼女は水の設備を保守していた。
nox: 生贄はあとから始まった。
system: 群衆の間にざわめきが広がる。
priest: 何世代にもわたる信仰を捨てろと言うのか。
luna: 違う。
luna: 知識が失われたあと、なぜ信仰が少女たちの死を必要としたのかと尋ねている。
-> p108_reply

@prompt p108_reply “僕は”

* “祭司職に権力を手放すよう要求する” => “祭司職は神殿の支配権を手放さなければならない。” -> p108_break_priesthood
* “祭司たちに記録を守るよう求める” => “真実を保存し、誰にでも教えて。” -> p109_public_choice
* “群衆が暴徒になる前に立ち去る” => “今すぐ立ち去るべきだ。” -> ending_beyond_felidian

@scene p108_break_priesthood
system: 数人の村人が賛同の声を上げる。
system: 聖なる護符を掲げ、ルナを冒涜者と責める者もいる。
system: 衛兵たちは高位祭司の命令を待つ。
priest: 今ここで神殿を手放せば、谷は内側から引き裂かれるかもしれない。
nox: 手放さなければ、何も変わらない。
system: 群衆が祭壇へ押し寄せる。
-> p108_break_reply

@prompt p108_break_reply “僕は”

* “群衆とルナの間に立つ” => “ルナの隣に立つ。” -> p109_public_choice
* “群衆に祭司たちを捕らえさせる” => “民衆が決めるべきだ。” -> p108_riot
* “水道橋から逃げる” => “虐殺になる前に立ち去る。” -> ending_beyond_felidian

@scene p108_riot
system: 最初の石が祭司に当たる。
system: 衛兵が剣を抜く。
system: 神殿の階段が恐慌に包まれる。
system: 記録が踏みつけられる足の下へ落ちる。
luna: これは自由ではない。
nox: 分かっている。
system: 夜明け前に火が記録庫へ達する。
-> ending_faith_in_ashes

@ending ending_faith_in_ashes “灰の中の信仰”
system: 生贄は終わる。
system: 祭司職も終わる。
system: だが、古い記録もともに燃える。
system: 数年後、神殿がかつて何を意味していたのか、誰も意見を一致させられない。
system: 一つの残酷な伝統は破壊された。
system: その代わりとなる確かなものは、何も残らない。

@scene p109_public_choice
system: 夜明けの光が豊穣の神殿へ届く。
system: 谷の運河を水が流れている。
system: 儀式の祭壇は空のままだ。
system: 高位祭司はルナの首から銀の三日月を外す。
priest: 三日月の翡翠という称号は神殿に属する。
luna: 違う。
system: ルナは祭司の手から三日月を取る。
luna: その称号は、あなたたちがこの下へ置いたすべての少女に属していた。
luna: これからどうするかは、私たちに属する。
-> p109_reply

@prompt p109_reply “僕は”

* “公の場でルナの隣に立つ” => “公の場でルナの隣に立つ。” -> p109_crescent_luna
* “決定をすべて彼女に委ねる” => “これはルナが決めることだ。” -> p109_lunas_decision
* “最初の水守に称号を返すよう求める” => “生贄ではなく、最初の水守を記憶して。” -> p109_lunas_decision

@scene p109_lunas_decision
system: ルナは谷を見渡す。
system: 村人たちは下で待っている。
system: 祭司たちは彼女の後ろで待っている。
system: ノックスは彼女の隣で待っている。
luna: 三日月の翡翠は、その生涯を谷へ捧げるはずだった。
luna: 命を失うのではなく。
luna: ほかの者がやり方を学ぶまで、私が水を守る。
priest: では、称号を受け入れるのか？
luna: いいえ。
luna: 新しい名を選ぶ。
-> p109_crescent_luna

@scene p109_crescent_luna
system: ルナは儀式用の留め具を外す。
system: 首ではなく、操作輪の上へ置く。
luna: 古い称号はここで終わり。
nox: それなら、何と呼ばれたい？
system: ルナは消えゆく三日月を見る。
luna: ルナで十分。
system: 群衆の中の子どもが、空の水杯を掲げる。
child: 三日月のルナ！
system: ほかの者たちも、その名を繰り返す。
system: 生贄の名としてではない。
system: 生贄を終わらせた少女の名として。
-> ending_crescent_luna

@ending ending_crescent_luna “三日月のルナ”
system: 豊穣の神殿は、水守を育てる学校となる。
system: 記録は複写され、すべての村へ送られる。
system: 二度と祭壇のために子どもが選ばれることはない。
system: 雨はすぐには戻らない。
system: だが、蓄えられた水が谷をその季節の終わりまで支える。
system: 生き残ったリゾの盗賊たちは、宝を得ずにフェリディアン領を去る。
system: のちに交易商として戻る者もいる。
system: ノックスは運河の修復が終わるまで残る。
system: ようやく旅立つ支度をすると、ルナが道のそばで待っている。
nox: 僕についてくるの？
luna: また一人で遺跡へ入るのでしょう。
nox: 質問の答えになっていない。
luna: なら、逃げないで。
system: 三日月の下で、猫がネズミについていく。
system: 捕まえるほど近くはなく。
system: 見失うほど遠くもなく。

@scene p104_battle_beneath_crescent
system: ノックスは祭壇のロープを切る。
system: 衛兵たちが彼へ駆け寄る。
system: 衛兵が壇上へ着く前に、ルナは拘束を引き裂く。
luna: 騒がしい解決策を選んだのね。
nox: 静かな手段が尽きかけていた。
system: リゾが雨の印章を持って月の門に現れる。
rizo: 皆が気を取られている間に、立ち去ることを勧めるぞ。
-> p104_reply

@prompt p104_reply “僕は”

* “衛兵からルナを守る” => “ルナを守る。” -> p104_protect_luna
* “リゾと雨の印章を追う” => “リゾを追う。” -> p104_pursue_rizo
* “ルナと水道橋から逃げる” => “今すぐ逃げる。” -> ending_beyond_felidian

@scene p104_protect_luna
system: ノックスはルナと最も近い衛兵の間に立つ。
guard: どけ。
nox: いやだ。
guard: お前一人で全員を止められるものか。
nox: 最初の一人を止めればいい。
system: ルナが彼の隣へ立つ。
luna: 一人ではない。
-> p104_protect_reply

@prompt p104_protect_reply “僕は”

* “最古の記録を彼らに見せる” => “生贄は彼女を殺すものではなかった。” -> p103_priests_doubt
* “道が開くまで戦う” => “私たちは立ち去る。” -> p104_escape_battle
* “村人たちに選ばせる” => “まだこれを望むのか、彼らに尋ねろ。” -> p108_faith_in_ruins

@scene p104_escape_battle
system: ルナは祭壇から衛兵たちを押し返す。
system: ノックスは水道橋の門を開く。
system: 二人はともに神殿の下へ消える。
system: 背後では鐘が鳴り続ける。
-> ending_beyond_felidian

@scene p104_pursue_rizo
system: ノックスはルナを祭壇に残し、リゾを追う。
system: リゾが先に外門へたどり着く。
rizo: まだ宝を追っているのか？
nox: 雨の印章はあなたのものじゃない。
rizo: 娘もお前のものではない。
nox: 彼女は彼女自身のものだ。
rizo: なら、なぜ置き去りにした？
system: 儀式の鐘が鳴る。
-> p104_pursue_reply

@prompt p104_pursue_reply “僕は”

* “ルナのところへ戻る” => “ルナのところへ戻る。” -> p104_too_late
* “印章を懸けてリゾと戦う” => “印章を渡せ。” -> ending_rizos_golden_bargain
* “リゾを逃がして戻る” => “印章はあとでいい。” -> p104_too_late

@scene p104_too_late
system: ノックスは祭壇へ向かって走り戻る。
system: 群衆は静まり返っている。
system: 高位祭司が儀式の刃を下ろす。
nox: ルナ！
-> ending_promised_rain

@scene p105_promised_rain
system: 三日月が神殿のアーチの中央へ達する。
system: ルナは祭壇の前にひざまずく。
luna: ノックス。
nox: ここにいる。
luna: これを私の選択だったと呼ばせないで。
system: 儀式の鐘が一度鳴る。
-> ending_promised_rain

@ending ending_promised_rain “約束された雨”
system: 儀式は夜明け前に終わる。
system: ルナは祭壇を離れない。
system: 三日後、フェリディアンの谷の上に雲が集まる。
system: 畑に雨が降る。
system: 祭司たちは奇跡と呼ぶ。
system: ノックスは、その雨が最初から近づいていたのかどうかを永遠に知ることがない。
system: ただ、その代価だけは知っている。

@scene ending_beyond_felidian
system: ノックスとルナは神殿の壁の外にある水道橋から姿を現す。
system: 背後では、鐘が衛兵を祭壇へ呼び集めている。
system: 前方には、乾いたフェリディアン平原を横切る道が開けている。
nox: 逃げられた。
luna: そうね。
nox: 安心していないみたいだ。
luna: 谷はまだ死にかけている。
system: 遠くの村から煙が上がっている。
-> ending_beyond_reply

@prompt ending_beyond_reply “僕たちは”

* “別の解決策を見つけたら戻れる” => “別の解決策を見つけたら戻れる。” -> ending_beyond_felidian_final
* “この場所を永遠に離れられる” => “この場所を永遠に離れられる。” -> ending_beyond_felidian_final
* “干ばつについてほかの国々へ警告できる” => “干ばつについてほかの国々へ警告できる。” -> ending_beyond_felidian_final

@ending ending_beyond_felidian_final “フェリディアン領の彼方へ”
system: ノックスとルナは二人で国境を越える。
system: ルナは生き延びる。
system: その夜、生贄の儀式は行われない。
system: だが、神殿は何も変わらない。
system: 新たな干ばつの季節が始まる。
system: 二人の背後のどこかで、祭司たちは新しい三日月の翡翠を探し始める。
system: 自由は二つの命を救う。
system: まだ谷までは救わない。

@scene p119_rizos_final_bargain
system: リゾは最後の宝物庫へたどり着く。
system: 金色の儀式用の捧げ物が床を覆っている。
system: 雨の印章が、その奥にある狭い扉を開く。
rizo: 二人で分けても余るほどの富だ。
nox: ルナは？
rizo: 祭司たちには奇跡をくれてやればいい。
rizo: 俺たちは、奇跡の値打ちをいただく。
-> p119_reply

@prompt p119_reply “僕は”

* “取引を受け入れる” => “宝を持っていこう。” -> ending_rizos_golden_bargain
* “拒んでルナのところへ戻る” => “僕は戻る。” -> p104_too_late
* “リゾから雨の印章を奪う” => “印章はここに残す。” -> p119_fight

@scene p119_fight
system: ノックスは雨の印章へ手を伸ばす。
system: リゾがナイフを抜く。
rizo: ようやく、自分のために何かを望むことを覚えたか。
nox: 違う。
nox: 売ってはいけないものを覚えたんだ。
system: 二人の刃が、金の捧げ物の上でぶつかる。
-> p119_fight_reply

@prompt p119_fight_reply “僕は”

* “閉じかけた宝物庫の扉へリゾを押す” => “この宝はあなたのものだ。” -> ending_rizos_golden_bargain
* “戦いを捨ててルナのところへ戻る” => “印章より彼女が大切だ。” -> p104_too_late
* “ルナに助けを求める” => “ルナ！” -> p119_no_answer

@scene p119_no_answer
system: 神殿の鐘だけが答える。
temple: チリン。
rizo: お前は娘を祭壇に置いてきた。
rizo: また追ってきてくれるとでも思ったか？
-> ending_rizos_golden_bargain

@ending ending_rizos_golden_bargain “リゾの黄金の取引”
system: 宝物庫の扉が閉じる。
system: リゾとノックスは、王国を買えるほどの金の中に立つ。
system: 雨の印章では、内側から扉を開けられない。
rizo: ほかにも出口があるはずだ。
system: 石の向こうで儀式の鐘が鳴る。
system: 宝は本物だ。
system: その代価も本物だ。

@scene credits_crescent_luna
system: 三日月のルナ
system: 終
system: 遊んでくれてありがとう。
