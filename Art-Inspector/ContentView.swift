import SwiftUI

struct ContentView: View {
//    @State private var droppedURLs: [URL] = []
    @StateObject private var viewModel = ContentViewModel()
    @State private var isTargeted: Bool = false
//    @State private var selected: URL? = nil

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack {
                            Text("Drop files here")
                                .font(.headline)
                                .accessibilityIdentifier("dropArea")
                            if !viewModel.droppedURLs.isEmpty {
                                ForEach(viewModel.droppedURLs, id: \.self) { url in
                                    Button(action: {
                                        print("Text clicked")
                                        viewModel.selectFile(url)
                                    }) {
                                        Text(url.lastPathComponent)
                                            .font(.subheadline)
                                            .lineLimit(1)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        .frame(width: 200)
                        .frame(maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                        .background(isTargeted ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .dropDestination(for: URL.self) { items, _ in
                            viewModel.handleDrop(items)
                            print("Dropped URLs: \(items)")
                            return true
                        } isTargeted: { over in
                            isTargeted = over
                        }
                        
                        VStack {
                            Button(action: {
                                print("Settings clicked")
                            }){
                                Text("Settings")
                            }
                            .accessibilityIdentifier("settingsButton")
                        }
                        .frame(width: 200, alignment: .leading)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Button(action: {
                                print("Open File clicked")
                            }){
                                Text("Open File")
                            }
                            .accessibilityIdentifier("openFileButton")
                            
                            Button(action: {
                                print("Export Report clicked")
                            }){
                                Text("Export Report")
                            }
                            .accessibilityIdentifier("exportReportButton")
                        }
                        
                        if !viewModel.droppedURLs.isEmpty, let selected = viewModel.selected,
                           let nsImage = NSImage(contentsOf: selected) {
                            Image(nsImage: nsImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: geometry.size.height * 0.6)
                                .border(Color.gray)
                                .accessibilityIdentifier("imagePreview")
                        }else{
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(height: geometry.size.height * 0.6)
                                .overlay(Text("Image Preview").foregroundColor(.gray))
                        }
                        
                        if !viewModel.droppedURLs.isEmpty, let selected = viewModel.selected {
                            HStack {
                                Text("Selected File: \(selected.lastPathComponent)")
                                Spacer()
                                Text("\(viewModel.droppedURLs.count) files dropped")
                            }
                        }else{
                            Rectangle()
                                .fill(Color.gray.opacity(0.0))
                                .frame(height: geometry.size.height * 0.2)
                                .overlay(Text("Metadata").foregroundColor(.gray))
                        }
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
