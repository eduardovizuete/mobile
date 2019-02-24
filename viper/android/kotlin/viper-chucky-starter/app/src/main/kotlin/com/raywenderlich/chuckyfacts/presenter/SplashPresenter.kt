package com.raywenderlich.chuckyfacts.presenter

import com.raywenderlich.chuckyfacts.BaseApplication
import com.raywenderlich.chuckyfacts.SplashContract
import com.raywenderlich.chuckyfacts.view.activities.MainActivity
import ru.terrakok.cicerone.Router


class SplashPresenter(private var view: SplashContract.View?): SplashContract.Presenter {

    private val router: Router? by lazy { BaseApplication.INSTANCE.cicerone.router }

    override fun onViewCreated() {
        router?.navigateTo(MainActivity.TAG)
        view?.finishView()
    }

    override fun onDestroy() {
        view = null
    }
}
