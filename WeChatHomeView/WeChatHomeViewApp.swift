//
//  WeChatHomeViewApp.swift
//  WeChatHomeView
//
//  Created by 胡文博 on 2023/06/24.
//

import SwiftUI

@main
struct WeChatHomeViewApp: App {
    
    // 属性包装器PropertyWrapper
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
//    private var appDelegate = UIApplicationDelegateAdaptor(AppDelegate.self)
    
//    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase{
                
            case .background:
                // 建议操作:释放资源,保存数据,暂停计时器
                // App进入后台后走到这里(字面意思,就是看不到App,包括上推关闭App)
                print("app进入后台")
            case .inactive:
                // App进入非活跃状态走到这里
                // 包含1.App遇到了一些中断,比如用户下拉控制中心,向上推切换App时,等等,2.回到后台
                // 简易操作: 暂停正在进行的任务,暂停计时器等
                print("app进入非活跃状态")
            case .active:
                // App变成活跃的状态/被激活后走这里
                // 包含:1.App在前台时,用户取消中断,比如用户下拉打开控制中心又关掉(新版本来电不会打断) 2.进入前台 3.首次启动 4.点击推送进入App
                // 建议操作:刷新视图,开始计时器等
                print("app进入活跃状态")
            @unknown default:
                print("app进入其余在未来可能加入的状态")
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        config()
        
        return true
    }
    private func config(){
        //调整navibar的样式
        let naviBarAppearance = UINavigationBarAppearance()
        naviBarAppearance.configureWithDefaultBackground()
        // 单例
        UINavigationBar.appearance().standardAppearance = naviBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = naviBarAppearance
        
        // 调整tabbar的样式
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        //调整tabbar item的样式
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.selected.iconColor = UIColor(named: "WeChatGreen")
        tabBarItemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(named: "WeChatGreen")!,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11, weight: .medium)
        ]
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
    }
}
