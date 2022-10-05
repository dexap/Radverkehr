
import SwiftUI

struct MeldungDetailsView: View {

    var meldung: MeldungenModel.Results

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {

            VStack {
                ZStack{
                    // MARK: - IMAGE
                    // Wenn es ein ImageSet in imagesBefore gibt
                    if !meldung.imagesBefore.isEmpty {
                        TabView {
                            ForEach(0..<meldung.imagesBefore.count) { index in
                                if let imageURL = meldung.imagesBefore[index]?.uri {
                                    AsyncImage(url: URL(string: imageURL)) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        Color("purple")
                                            .opacity(0.2)
                                            .overlay{
                                                ProgressView()
                                            }
                                    }
                                }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(width: 300, height: 300, alignment: .center)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 3)
                                .foregroundColor(Color("purple"))
                                .shadow(radius: 5)
                        }
                    } else {
                        Image("AltImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300, alignment: .center)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(lineWidth: 3)
                                    .foregroundColor(Color("purple"))
                                    .shadow(radius: 5)
                            }
                    }

                    VStack(alignment: .center, spacing: 5) {
                        VStack(alignment: .leading) {
                            Text("# " + meldung.districts[0].name)
                                .bold()
                        }
                        .foregroundColor(.white)
                        .padding(6)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gray)
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("purple"))
                        }


                        Text(meldung.title)
                            .foregroundColor(.black)
                            .opacity(0.8)
                            .font(Font.custom(FontManager.BerlinFont.bold, size: 20))
                            .padding(5)
                            .lineLimit(2)
                            .minimumScaleFactor(0.1)
                            .overlay {
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(lineWidth: 3)
                                    .fill(RadialGradient(
                                        colors: [
                                            Color(red: 0.6, green: 0.6, blue: 0.6),
                                            Color(red: 0.1, green: 0.1, blue: 0.1)],
                                        center: .center,
                                        startRadius: 0,
                                        endRadius: 200))
                                    .shadow(radius: 5)
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 3)
                                    .foregroundColor(.white)
                            }
                    }
                    .offset(x: 0, y: -130)

                    HStack {
                        Text("Status: \(meldung.status?.rawValue ?? "unbekannt")")
                            .foregroundColor(.black)
                            .padding(8)
                            .background {
                                let background = RoundedRectangle(cornerRadius: 20)
                                switch (meldung.status) {
                                    case .vorgesehen:    background.foregroundColor(.gray)
                                    case .abgeschlossen: background.foregroundColor(.green)
                                    case .inBau:         background.foregroundColor(.blue)
                                    case .inPlanung:     background.foregroundColor(.yellow)
                                    default:                 background.foregroundColor(.gray)
                                }
                            }
                            .offset(x: 20, y: 90)
                        Spacer()
                    }
                }

                Text(meldung.subtitle)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .lineLimit(3)
                    .minimumScaleFactor(0.1)

                Text(meldung.description)
                    .opacity(0.8)
                    .padding(.vertical,8)

                    .padding(.horizontal, 30)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("purple"))
                            .opacity(0.2)
                            .padding(.horizontal)
                            .shadow(color: Color("purple"), radius: 5)

                    }
                Spacer()
            }
        }
        
    }
}


struct MeldungDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MeldungDetailsView(meldung: previewModel.results[0])
    }
}


