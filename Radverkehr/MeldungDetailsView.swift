
import SwiftUI

struct MeldungDetailsView: View {

    var meldung: MeldungenResponseModel.Results

    var body: some View {
        VStack {
            // Header
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
                                    Color
                                        .accentColor
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
                            .foregroundColor(.accentColor)
                            .shadow(radius: 5)
                    }
                } else {
                    // Wenn es kein imageSet gibt, aber Image
                    if let imageURL = meldung.image?.uri {
                        AsyncImage(url: URL(string: imageURL)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.accentColor.opacity(0.2)
                                .overlay {
                                    ProgressView()
                                }
                        }
                        .frame(width: 300, height: 300, alignment: .center)
                        .clipShape(Circle())
                    } else {

                        // Wenn es kein Image oder ImageSet gibt
                        Image("AltImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300, alignment: .center)
                            .clipShape(Circle())
                    }
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
                .offset(x: 0, y: -130)

                HStack {
                    Text("Status: \(meldung.status?.rawValue ?? "unbekannt")")
                        .padding(8)
                        .background {
                            let background = RoundedRectangle(cornerRadius: 20)
                            switch (meldung.status) {
                                case .vorgesehen:    background.foregroundColor(.gray)
                                case .abgeschlossen: background.foregroundColor(.green)
                                case .inBau:         background.foregroundColor(.blue)
                                case .inPlanung:     background.foregroundColor(.yellow)
                                default:         background.foregroundColor(.gray)
                            }
                        }
                        .offset(x: 20, y: 90)
                    Spacer()
                }
            }

            // Details
            Text(meldung.subtitle)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal)
                .lineLimit(3)
                .minimumScaleFactor(0.1)

            ScrollView(.vertical, showsIndicators: false) {
                Text(meldung.description)
                    .opacity(0.8)
                    .padding(.vertical,8)
            }
                .padding(.horizontal, 30)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.accentColor)
                        .opacity(0.2)
                        .padding(.horizontal)
                        .shadow(color: .accentColor, radius: 5)

                }
            Spacer()
        }
    }
}


struct MeldungDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MeldungDetailsView(meldung: previewModel.results[0])
    }
}


