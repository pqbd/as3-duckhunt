package alx.duckhunt
{
  import alx.common.util.CRandom;

  public class CNickGenerator
  {
    private static var s_random:CRandom = null;
    private static var s_arDatabase:Array = new Array( 'Deg omMOPO3'
                                                      , 'nyrJIuBbIu JIbI>|<HuK'
                                                      , 'aKTuBHbIu roMeC'
                                                      , 'yCaTbIu ToKaPb'
                                                      , 'C4aCTJIuBbIu JIyneHb'
                                                      , 'BeCeJIbIu 4eKuCT'
                                                      , 'HeXuJIbIu TaHKuCT'
                                                      , 'CaguCT-3aTeuHuK'
                                                      , 'Hego6pbIu JIeKaPb'
                                                      , 'MaCTeP XegoB'
                                                      , '6PoHeTeMKuH noHoCeU,'
                                                      , 'CepguTbIu 3y6PuK'
                                                      , 'CoHJIuBbIu BuKuHr'
                                                      , '3Meu ropbIHbI4'
                                                      , 'ra3oHoKocuJIbLLI,uK'
                                                      , 'Xy>I<e_JIoJIKu'
                                                      , '~BuHHu_nyK~'
                                                      , 'Ba3eJIuHoBbIu My>I<uK'
                                                      , '6ypaTuHo'
                                                      , '/7a/7a_KapJIo'
                                                      , 'My>|<u4oK CJIOHoBu4oK'
                                                      , '>|<eCTKuu_4e6yp'
                                                      , 'KpbIca KaMuKag3e'
                                                      , 'KoH4eHbIu ypog'
                                                      , 'He3gopoBbIu ncux'
                                                      , 'ommonbIpeHbIu ynbIPb'
                                                      , 'CKyKo>|<eHbIu E>I<'
                                                      , 'nu>|<oH c Ho>|<oM'
                                                      , 'CyKa-B-6oTaX'
                                                      , '3apa3a B Ta3e'
                                                      , 'KocMoHaBT Ha KaMa3e'
                                                      , '[baz] DeCaHmHuK'
                                                      , 'uHCneKToP'
                                                      , 'BbIcTpeJI B >I<ony!'
                                                      , 'DupeKTop_KyKypy3HuKa'
                                                      , 'Cep>I<aHm'
                                                      , 'Ha4aJIbHuK KapmbI'
                                                      , 'y4uTeJIb XuMuu'
                                                      , '>I<apeHbIu neTyX'
                                                      , 'BaMnup'
                                                      , '6oT 6a3uJIuo'
                                                      , 'TepMuHaTop'
                                                      , 'Kapa6aC PaCKoJI6aC'
                                                      , '[oMoH]~noKeMoH'
                                                      , '[+Duracell-]'
                                                      , 'Oo!oO'
                                                      , 'MegBe>I<oHoK -)MKa'
                                                      , 'PbI6oKon'
                                                      , 'CynePKpoBo>I<agHbIu'
                                                      , 'g>I<eKu 4aH'
                                                      , 'KOT-B-POMALLIKAX'
                                                      , 'Bcex-nopBy!'
                                                      , 'CmpaHHbIu CmpaHHuK'
                                                      , 'yJIbI6o4HbIu 6oT'
                                                      , '[RWL] BoBa KoMaTo3HuK'
                                                      , '[RWL] LLIHULLEJIb'
                                                      , '[RWL] Ado'
                                                      , '[RWL] dur5t'
                                                      , '[RWL] SAOPP Family'
                                                      , '[RWL] Deni$OK'
                                                      , 'IOHbIu 3agpoT.'
                                                      , 'NetManiac'
                                                      , 'CmapuK-noxa6bI4'
                                                      , 'KoMaToZZzz'
                                                      , 'Kyu >I<eJIe3HbIu'
                                                      , '[HSH] KyMapuK'
                                                      , 'uBaH KpuBopyKoB'
                                                      , '>PartiZan<'
                                                      , '3JIo6HbIu yXaPb'
                                                      , '=ReANiMaToR='
                                                      , 'OTMoPo>I<eHbIu MuHTau'
                                                      , 'nPanoP KoHeB'
                                                      , '4yKoTcKuu CHauneP'
                                                      , '[dnb] BASSBOMB'
                                                      , 'noHb KugaJIbHbIu'
                                                      , 'cccp| =LENIN='
                                                      , 'SHiBZDiK'
                                                      , 'BOP_B_3anoE'
                                                      , 'Mo3roEg'
                                                      , 'Mauop KyMaP'
                                                      , 'uHCneKToP >I<onuH'
                                                      , 'KpoBaBbIu neKaPb'
                                                      , 'XMyPbIu >I<MyPuK'
                                                      , '3JIoCTHbIu nePgyH'
                                                      , 'CuBbIu gyPeHb'
                                                      , 'z00m'
                                                      , 'K!110grAmm'
                                                      , 'jaZzK!ll'
                                                      , 'KeKS| PerDoLetto'
                                                      , 'KeKS| KyKyM6a'
                                                      , 'KeKS| Co6aKa-PeKC'
                                                      , 'KeKS| ZeliBoBa'
                                                      , 'BoJIoCaTbIe Ho3gPu'
                                                      , '6yXou MATPOC'
                                                      , 'CocucbKa'
                                                      , 'CbIH_OTMoPo3Ka'
                                                      , 'CTaPuK OTMoPo3oK'
                                                      , 'KpuBou PaxuT KyKyeB'
                                                      , 'KpyTou nep4uK~'
                                                      , '3JIou TapaKaH'
                                                      , 'Heu3BecmHbIu'
                                                      , 'HoBoXygoHocop'
                                                      , 'rpy3oBuK C HaBo3oM'
                                                      , 'OrpbI3oK'
                                                      , '6apbIra'
                                                      , 'Ky3bKuHa_MaTb'
                                                      , 'CaHuTaP u3 Mopra'
                                                      , 'KyJIuHaP TeCaKoB'
                                                      , 'noJIy4u_B_>I<6aH'
                                                      , 'KoMaPuK'
                                                      , 'ne4aJIbHbIu 4auHuK'
                                                      , '::M4N`o`W4R::'
                                                      , 'P1nc ZoMBy'
                                                      , '>I<bIPHbIu nuHrBuH'
                                                      , 'SchtandartenFuhrer'
                                                      , 'ST4L!N RuL!T'
                                                      , 'B.B./7ymuH'
                                                      , '4ePHbIu JIeKToP.'
                                                      , 'naHKu_B_TAHKE'
                                                      , 'Kampers in Pampers'
                                                      , 'OTJIu4HbIu_nuHr!'
                                                      , 'napa nCuXoJIoroB'
                                                      , 'KoBapHoe JIaMo'
                                                      , '4e6ypeK @(o,o)@'
                                                      , 'He>I<Ha9I JIaMKa'
                                                      , 'geg Ma3gau'
                                                      , 'HeonbITHbIu /7ana'
                                                      , '/7poDOOMaHHbIu III'
                                                      , '3BePCKuu_4uT0P'
                                                      , '=| ReAnimaToR |='
                                                      , 'Ky3bMu4b'
                                                      , 'TelepuzO'
                                                      , 'Tynou KyPCaHT'
                                                      , 'XogoK 3a /7uBoM'
                                                      , 'DEADushka MoroZ'
                                                      , 'mu1ti-K!ll'
                                                      , 'Ne0'
                                                      , 'ToJIna areHToB CMuToB'
                                                      , '=ZL0Y='
                                                      , 'HeadKilla ==(oo)=>'
                                                      , '))==0KyHb=%>'
                                                      , 'laZar'
                                                      , '=| Zar |='
                                                      , 'DeD LoGoPeD'
                                                      , '|z| QuaZatron.'
                                                      , '|z| NecromanZer.'
                                                      , '|z| Zerg.'
                                                      , '|z| teZer'
                                                      , '[z] *moZg*'
                                                      , '/z/ Z-Lum!noFor'
                                                      , '[dnb] dub'
                                                      , '[dnb] Kara'
                                                      , '(dnb) Mechano!d'
                                                      , 'dnb| 3v!LKilla'
                                                      , '4ygHbIu /7anopomHuK'
                                                      , 'XuTPbIu_AHyC'
                                                      , 'Xo66uT'
                                                      , '[baz] GAD'
                                                      , '[baz] K/IoH'
                                                      , '[baz] viz0r'
                                                      , '[baz] MiXa'
                                                      , '|baz| go6pbIu 6o6puK'
                                                      , '|baz| DiGGeR'
                                                      , '|baz| =GRoMoZeKA='
                                                      , '|baz| BuHToBKuH'
                                                      , '|baz| ZveroBoy'
                                                      , 'SK| ahl.'
                                                      , 'SK| bds.'
                                                      , 'SK| brunk'
                                                      , 'SK| ElemenT'
                                                      , 'SK| fisker'
                                                      , 'SK| goseY'
                                                      , 'SK| HeatoN'
                                                      , 'SK| Potti'
                                                      , 'Morda'
                                                      , '6oM>I<yaH'
                                                      , 'n0name| Haru6aToP'
                                                      , 'KyJIbHbIu_PyJIe3'
                                                      , 'NiTron'
                                                      , '[.71]TPAXTOP'
                                                      , 'M19*KaLbI4'
                                                      , 'M19*Rado'
                                                      , 'M19*NooK'
                                                      , 'M19*MadFan'
                                                      , 'M19*Rider'
                                                      , 'forZe| Xen1tron'
                                                      , '[forZe] iTuman'
                                                      , 'forZe| Electric.eYe'
                                                      , 'forZe| Romashka'
                                                      , '[forZe] h0s7'
                                                      , '[team9] vesslan'
                                                      , '[team9] XeqtR'
                                                      , '[team9] Luciano'
                                                      , '[team9] quick'
                                                      , '[team9] Luccese'
                                                      , '6bIK'
                                                      , 'StabiliZat0R'
                                                      , 'yHuKaJIbHbIu yHuTa3'
                                                      , 'MegaCamper'
                                                      , 'KoT MaTPOCKuH'
                                                      , '8=======B'
                                                      , 'L1MoN'
                                                      , 'Bo>|<gb /7oKeMoHoB'
                                                      , '[s!L3nt]xen0b1te'
                                                      , 'Xeg-XegbI4'
                                                      , '=XAM='
                                                      , 'loloboto'
                                                      , 'L0M'
                                                      , 'FluroGinecolog'
                                                      , '-papique-'
                                                      , 'CyKaHax'
                                                      , 'Be>I<JIuBbIu JIOCb'
                                                      , 'CTago CJIoHoB'
                                                      , 'yKypbILLI'
                                                      , 'OTCTou CJIuBo4HbIu'
                                                      , 'CAXA'
                                                      , 'Alinka^^'
                                                      , 'yahooo!'
                                                      , 'Gena'
                                                      , '(*_*)'
                                                      , '==]====>'
                                                      );

    public function CNameGenerator()
    {
    }
    
    public static function next( random:CRandom = null):String
    {
      if ( random == null)
      {
        if ( CNickGenerator.s_random == null)
          CNickGenerator.s_random = new CRandom();
        random = CNickGenerator.s_random;
      }
      return CNickGenerator.s_arDatabase[ random.nextUint( 0, CNickGenerator.s_arDatabase.length)];
    }
  }
}