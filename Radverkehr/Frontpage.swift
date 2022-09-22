import SwiftUI

struct Frontpage: View {
    @State var isShowingWebView = false

    var body: some View {


        VStack {
            Spacer()
            Text("Radverkehrs-maßnahmen Berlin")
                .foregroundColor(Color("purple"))
                .fontWeight(.heavy)
                .font(.system(size: 50))
                .lineLimit(3)



            ZStack {
                Circle()
                    .stroke()
                    .foregroundColor(Color("purple"))
                    .shadow(color: .accentColor ,radius: 3)
                    .overlay {
                        Image(systemName: "bicycle")
                            .resizable()
                            .frame(width: 70,height: 45, alignment: .center)
                            .scaledToFit()
                            .foregroundColor(Color("purple"))
                    }
            }
            .frame(width: 100, height: 100, alignment: .center)

            Text("weiter")
                .foregroundColor(.accentColor)
                .fontWeight(.heavy)
                .font(.system(size: 30))

            Spacer()

            HStack{
                Button {
                    isShowingWebView.toggle()
                } label: {
                    Text("Quelle: infravelo.de")
                        .bold()
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                }
                .padding()
                Spacer()
            }
        }
        .sheet(isPresented: $isShowingWebView) {
            WebView(url: URL(string: "https://www.infravelo.de")!)
        }
    }
}

struct Frontpage_Previews: PreviewProvider {
    static var previews: some View {
        Frontpage()
    }
}
