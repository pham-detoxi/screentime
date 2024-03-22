//
//  TotalActivityView.swift
//  myDeviceActivityReportExtension
//
//  Created by Tarık Yılıkoğlu on 7.07.2022.
//

import SwiftUI

struct TotalActivityView: View {
    var activityReport: ActivityReport
    
    var body: some View {
        ScrollView{
            VStack{
                
                VStack(alignment: .leading){
                    Rectangle()
                        .frame(height: 10)
                        .foregroundColor(.clear)
                    Text("Wie läuft’s?")
                        .font(Font.custom("Livvic-Medium", size: 36))
                        .lineSpacing(40)
                        .foregroundColor(Color(red: 0, green: 0.58, blue: 0.56))
                    Rectangle()
                        .frame(height: 10)
                        .foregroundColor(.clear)
                    Text("Wir vergleichen hier deine aktuelle Woche mit den Tagesdurschnitten der Vorwoche. ")
                        .font(Font.custom("WorkSans-VariableFont_wght", size: 16))
                        .lineSpacing(7)
                        .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13));
                    Rectangle()
                        .frame(height: 10)
                        .foregroundColor(.clear)
                }
                
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        Text("Aktivierungen")
                            .font(Font.custom("Livvic-SemiBold", size: 18))
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        
                        Text("Wie häufig wurde dein Smartphone durch dich oder durch Mitteilungen im Tagesdurchschnitt aktiviert?")
                            .font(Font.custom("WorkSans-VariableFont_wght", size: 12).weight(.medium))
                            .lineSpacing(6)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.60))
                    }.frame(maxWidth: 235, alignment: .leading)
                    Spacer()
                    Text(activityReport.pickups.description)
                        .font(Font.custom("Livvic-Bold", size: 40).weight(.medium))
                        .foregroundColor(Color(red: 0, green: 0.58, blue: 0.56));
                }
                
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        Text("Mitteilungen")
                            .font(Font.custom("Livvic-SemiBold", size: 18))
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        
                        Text("Wie viele Mitteilungen hast du im Tagesdurchschnitt erhalten?")
                            .font(Font.custom("WorkSans-VariableFont_wght", size: 12).weight(.medium))
                            .lineSpacing(6)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.60))
                            .multilineTextAlignment(.leading)
                    }.frame(maxWidth: 235, alignment: .leading)

                    Spacer()
                    Text(activityReport.totalNotifications.description)
                        .font(Font.custom("Livvic-Bold", size: 40).weight(.medium))
                        .foregroundColor(Color(red: 1, green: 0.53, blue: 0.45));
                }
                
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        Text("Längste Pause(!)")
                            .font(Font.custom("Livvic-SemiBold", size: 18))
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        
                        Text("Wie viel Zeit ist vergangen, bevor dein Smartphone tagsüber erneut aktiviert worden ist? Longest use-time")
                            .font(Font.custom("WorkSans-VariableFont_wght", size: 12).weight(.medium))
                            .lineSpacing(6)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.60))
                    }.frame(maxWidth: 235, alignment: .leading)
                    Spacer()
                    Text(activityReport.longestActivity.stringFromTimeInterval())
                        .font(Font.custom("Livvic-Bold", size: 40).weight(.medium))
                        .foregroundColor(Color(red: 0, green: 0.58, blue: 0.56));
                }
                
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        Text("Störungs-Intervall")
                            .font(Font.custom("Livvic-SemiBold", size: 18))
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        
                        Text("Wie lange warst du in den letzten 7 Tagen durchschnittlich nicht von deinem Smartphone abgelenkt?")
                            .font(Font.custom("WorkSans-VariableFont_wght", size: 12).weight(.medium))
                            .lineSpacing(6)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.60))
                    }.frame(maxWidth: 235, alignment: .leading)
                    Spacer()
                    Text(activityReport.distractedPeriod.stringFromTimeInterval())
                        .font(Font.custom("Livvic-Bold", size: 40).weight(.medium))
                        .foregroundColor(Color(red: 1, green: 0.53, blue: 0.45));
                }
                
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        Text("Bildschirmzeit")
                            .font(Font.custom("Livvic-SemiBold", size: 18))
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        
                        Text("Wie lange war der Bildschirm deines Smartphones im Tagesdurchschnitt eingeschaltet?")
                            .font(Font.custom("WorkSans-VariableFont_wght", size: 12).weight(.medium))
                            .lineSpacing(6)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.60))
                    }.frame(maxWidth: 235, alignment: .leading)
                    Spacer()
                    Text(activityReport.totalDuration.stringFromTimeInterval())
                        .font(Font.custom("Livvic-Bold", size: 40).weight(.medium))
                        .foregroundColor(Color(red: 0, green: 0.58, blue: 0.56));
                }
                
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        Text("Lebenszeit")
                            .font(Font.custom("Livvic-SemiBold", size: 18))
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        
                        Text("Wie häufig wurde dein Smartphone durch dich oder durch Mitteilungen im Tagesdurchschnitt aktiviert?")
                            .font(Font.custom("WorkSans-VariableFont_wght", size: 12).weight(.medium))
                            .lineSpacing(6)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13).opacity(0.60))
                    }.frame(maxWidth: 235, alignment: .leading)
                    Spacer()
                    Text((24 * 60 * 60 - activityReport.totalDuration).stringFromTimeInterval())
                        .font(Font.custom("Livvic-Bold", size: 40).weight(.medium))
                        .foregroundColor(Color(red: 1, green: 0.53, blue: 0.45));
                }
                
            }.padding()
        }
        
        
    }
    //        GeometryReader { geometry in
    //            VStack {
    //                HStack{
    //                    Text("Total Pickups").padding()
    //                    Spacer()
    //                    Text(activityReport.pickups.description).padding()
    //                }
    //                Spacer().frame(width: 50)
    //                HStack{
    //                    Text("Total Notifications").padding()
    //                    Spacer()
    //                    Text(activityReport.totalNotifications.description).padding()
    //                }
    //                Spacer().frame(width: 50)
    //                HStack{
    //                    Text("Longest Use Period").padding()
    //                    Spacer()
    //                    Text(activityReport.longestActivity.stringFromTimeInterval()).padding()
    //                }
    //                Spacer().frame(width: 50)
    //                HStack{
    //                    Text("Störungs-Interval").padding()
    //                    Spacer()
    //                    Text(activityReport.distractedPeriod.stringFromTimeInterval()).padding()
    //                }
    //                Spacer().frame(width: 50)
    //                HStack{
    //                    Text("Total Screen Time").padding()
    //                    Spacer()
    //                    Text(activityReport.totalDuration.stringFromTimeInterval()).padding()
    //                }
    //                Spacer().frame(width: 50)
    //                HStack{
    //                    Text("Lebenszeit").padding()
    //                    Spacer()
    //                    Text((24 * 60 * 60 - activityReport.totalDuration).stringFromTimeInterval()).padding()
    //                }
    //            }.frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.9) // Limit the width to 80% of the parent width
    //        }.padding()
    
    
}



struct ActivityReport {
    let totalDuration: TimeInterval
    let totalNotifications: Int
    let pickups: Int
    let longestActivity: TimeInterval
    let distractedPeriod: TimeInterval
}


extension TimeInterval{
    
    func stringFromTimeInterval() -> String {
        let time = NSInteger(self)
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        return String(format: "%0.2d:%0.2d",hours,minutes)
    }
}
